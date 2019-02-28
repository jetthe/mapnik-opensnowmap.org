dropdb imposm
createdb -E UTF8 -O imposm imposm -D data_ssd
psql -d imposm -c "CREATE EXTENSION postgis;"
psql -d imposm -c "CREATE EXTENSION hstore;" # only required for hstore support
echo "ALTER USER imposm WITH PASSWORD 'imposm';" |psql -d imposm

readonly PG_CONNECT="postgis://imposm:imposm@localhost/imposm"
readonly inputpbf=planet_pistes.pbf
#~ readonly inputpbf=/nvme-data/data/europe-latest.osm.pbf
readonly mappingfile=opensnowmap.yml
echo "$(date) - importing: $inputpbf "

/home/yves/DEV/go/bin/./imposm3 import \
    -quiet \
    -mapping $mappingfile \
    -read $inputpbf \
    -write \
    -optimize \
    -overwritecache \
    -diff -cachedir /nvme-data/data/imposm-cache -diffdir /nvme-data/data/imposm-cache \
    -deployproduction \
    -connection $PG_CONNECT
#Fix imported geometries, otherwise we have issue with 
#collection of polygons at the output of ST_LineMerge
echo "UPDATE osm_pistes_route_members ..."
echo "UPDATE osm_pistes_route_members
        SET geometry=ST_ExteriorRing(geometry)
        WHERE ST_GeometryType(osm_pistes_route_members.geometry)='ST_Polygon'
    ;" |psql -d imposm
echo "CREATE TABLE pistes_routes ..."
echo "CREATE TABLE pistes_routes AS (
    SELECT 
        osm_pistes_routes.osm_id as osm_id,
        osm_pistes_routes.tags as tags,
        string_agg(distinct osm_pistes_routes.name,';') as name,
        string_agg(distinct osm_pistes_routes.piste_type,';') as piste_type,
        string_agg(distinct osm_pistes_routes.grooming,';') as grooming,
        bool_and(osm_pistes_routes.gladed) as gladed,
        bool_and(osm_pistes_routes.patrolled) as patrolled,
        bit_and(osm_pistes_routes.oneway) as oneway,
        string_agg(distinct osm_pistes_routes.piste_name,';') as piste_name,
        string_agg(distinct osm_pistes_routes.piste_ref,';') as piste_ref,
        string_agg(distinct osm_pistes_routes.ref,';') as ref,
        string_agg(distinct osm_pistes_routes.color,';') as color,
        string_agg(distinct osm_pistes_routes.colour,';') as colour,
        string_agg(distinct osm_pistes_routes.color,';') as nordic_route_render_colour,
        0 as nordic_route_offset,
        string_agg(distinct osm_pistes_routes.difficulty,';') as difficulty,
        bool_and(osm_pistes_routes.lit1) as lit1,
        bool_and(osm_pistes_routes.lit2) as lit2,
        ST_LineMerge(
            ST_CollectionExtract(
                ST_Collect(osm_pistes_route_members.geometry)
                ,2)
        )::geometry(Geometry, 3857) AS geometry
    FROM 
    osm_pistes_routes
    JOIN
    osm_pistes_route_members ON (osm_pistes_routes.osm_id=osm_pistes_route_members.osm_id)
    GROUP BY osm_pistes_routes.osm_id, osm_pistes_routes.tags
    );" |psql -d imposm
#~ -- Add an index to the bbox column.
echo "CREATE INDEX idx_routes_geom ON pistes_routes USING gist (geometry);" |psql -d imposm
#~ -- Cluster table by geographical location.
echo "CLUSTER pistes_routes USING idx_routes_geom;" |psql -d imposm
echo "ANALYSE pistes_routes;" |psql -d imposm
#~ Rapide <2s
#~ EXPLAIN ANALYSE SELECT st_AsBinary("geometry") AS geom
    #~ FROM test_c
    #~ WHERE "geometry" && st_SetSRID('BOX3D(715000. 5920000.,725000. 5930000.)'::box3d,3857);
#~ Planning time: 0.135 ms
#~ Execution time: 0.311 ms
#~ Et puis de temps en temps:
#~ echo "REFRESH MATERIALIZED VIEW pistes_routes;" |psql -d imposm
echo "CREATE TABLE pistes_sites ..."
echo "CREATE TABLE pistes_sites AS (
    SELECT 
        osm_pistes_sites.osm_id as osm_id,
        osm_pistes_sites.name as name,
    
        array_to_string(array_agg(distinct osm_pistes_ways.piste_type::text) 
        || array_agg(distinct pistes_routes.piste_type::text)
        || array_agg(distinct osm_pistes_area.piste_type::text)
        || array_agg(distinct osm_sport_ways.piste_type::text)
        || array_agg(distinct osm_sport_nodes.piste_type::text)
        ,';') 
        AS members_types,
    
        ST_ConvexHull(ST_Collect(
        ARRAY[
        ST_Collect(osm_pistes_ways.geometry),
        ST_Collect(pistes_routes.geometry),
        ST_Collect(osm_pistes_area.geometry),
        ST_Collect(osm_sport_ways.geometry),
        ST_Collect(osm_sport_nodes.geometry)
        ]
        ))::geometry(Geometry, 3857) 
        AS geometry
    
    FROM 
        osm_pistes_sites
    LEFT JOIN osm_pistes_site_members 
        ON (osm_pistes_sites.osm_id=osm_pistes_site_members.osm_id)
    LEFT JOIN osm_pistes_ways 
        ON (osm_pistes_ways.osm_id=osm_pistes_site_members.member)
    LEFT JOIN pistes_routes 
        ON (pistes_routes.osm_id=-osm_pistes_site_members.member)
    LEFT JOIN osm_pistes_area 
        ON (osm_pistes_area.osm_id=osm_pistes_site_members.member)
    LEFT JOIN osm_sport_ways 
        ON (osm_sport_ways.osm_id=osm_pistes_site_members.member)
    LEFT JOIN osm_sport_nodes 
        ON (osm_sport_nodes.osm_id=osm_pistes_site_members.member)
    GROUP BY osm_pistes_sites.osm_id, osm_pistes_sites.name
    );" |psql -d imposm

echo "CREATE INDEX idx_sites_geom ON pistes_sites USING gist (geometry);" |psql -d imposm
echo "CLUSTER pistes_sites USING idx_sites_geom;" |psql -d imposm
echo "ANALYSE pistes_sites;" |psql -d imposm

# landuse_ressorts
echo "CREATE TABLE landuse_resorts ..."
echo "CREATE TABLE landuse_resorts AS SELECT * FROM osm_resorts;

ALTER TABLE landuse_resorts ADD members_types text;

UPDATE landuse_resorts SET members_types = concat_ws(
    ';', 
    members_types,
    (SELECT string_agg(distinct pistes_routes.piste_type::text, ';')
        FROM pistes_routes
        WHERE ST_Intersects(pistes_routes.geometry,landuse_resorts.geometry)
    )
);
UPDATE landuse_resorts SET members_types = concat_ws(
    ';',
    members_types,
    (SELECT string_agg(distinct osm_pistes_ways.piste_type::text, ';')
        FROM osm_pistes_ways
        WHERE ST_Intersects(osm_pistes_ways.geometry,landuse_resorts.geometry)
    )
);
UPDATE landuse_resorts SET members_types = concat_ws(
    ';',
    members_types,
    (SELECT string_agg(distinct osm_pistes_area.piste_type::text, ';')
        FROM osm_pistes_area
        WHERE ST_Intersects(osm_pistes_area.geometry,landuse_resorts.geometry)
    )
);
UPDATE landuse_resorts SET members_types = concat_ws(
    ';',
    members_types,
    (SELECT string_agg(distinct osm_sport_ways.piste_type::text, ';')
        FROM osm_sport_ways
        WHERE ST_Intersects(osm_sport_ways.geometry,landuse_resorts.geometry)
    )
);
UPDATE landuse_resorts SET members_types = concat_ws(
    ';',
    members_types,
    (SELECT string_agg(distinct osm_sport_nodes.piste_type::text, ';')
        FROM osm_sport_nodes
        WHERE ST_Intersects(osm_sport_nodes.geometry,landuse_resorts.geometry)
    )
);" |psql -d imposm
# Faudrait aussi s'assurer d'avoir plus de 3 ways ...
#~ SELECT 363196 => autant que de landusages
echo "CREATE INDEX idx_landuse_resorts_geom ON landuse_resorts USING gist (geometry);" |psql -d imposm
echo "CLUSTER landuse_resorts USING idx_landuse_resorts_geom;" |psql -d imposm
echo "ANALYSE landuse_resorts;" |psql -d imposm

echo "ALTER TABLE osm_pistes_route_members ..."
echo "ALTER TABLE osm_pistes_route_members
ADD COLUMN nordic_route_offset integer DEFAULT 0,
ADD COLUMN nordic_route_colour text DEFAULT '',
ADD COLUMN nordic_route_length integer DEFAULT 1000000,
ADD COLUMN nordic_route_render_colour text DEFAULT '',
ADD COLUMN direction_to_route integer DEFAULT 0;
" |psql -d imposm
echo "ALTER TABLE osm_pistes_ways ..."
echo "ALTER TABLE osm_pistes_ways
ADD COLUMN nordic_route_offset integer DEFAULT 0,
ADD COLUMN nordic_route_colour text DEFAULT '',
ADD COLUMN nordic_route_length integer DEFAULT 1000000,
ADD COLUMN nordic_route_render_colour text DEFAULT '',
ADD COLUMN direction_to_route integer DEFAULT 0;
" |psql -d imposm
echo "UPDATE osm_pistes_route_members ..."
echo "UPDATE osm_pistes_route_members
SET 
  nordic_route_offset = 0,
  nordic_route_colour = (SELECT coalesce(osm_pistes_routes.colour,osm_pistes_routes.color)
                            FROM osm_pistes_routes 
                            WHERE osm_pistes_routes.osm_id=osm_pistes_route_members.osm_id),
  nordic_route_render_colour = (SELECT coalesce(osm_pistes_routes.colour,osm_pistes_routes.color)
                            FROM osm_pistes_routes 
                            WHERE osm_pistes_routes.osm_id=osm_pistes_route_members.osm_id),
  direction_to_route = (SELECT 
                          CASE WHEN
                            ST_IsEmpty(
                              ST_GeometryN(
                                ST_SharedPaths(pistes_routes.geometry,osm_pistes_route_members.geometry),
                                 1)
                            )
                            THEN -1
                            ELSE 1
                          END
                        FROM pistes_routes
                        WHERE pistes_routes.osm_id=osm_pistes_route_members.osm_id
                        AND ST_GeometryType(osm_pistes_route_members.geometry) in ('ST_MultiLineString', 'ST_LineString')
                        AND ST_GeometryType(pistes_routes.geometry) in ('ST_MultiLineString', 'ST_LineString')
                            ),
  nordic_route_length=(SELECT ST_Length(pistes_routes.geometry) 
                            FROM pistes_routes
                            WHERE pistes_routes.osm_id=osm_pistes_route_members.osm_id)
                            ;
" |psql -d imposm
echo "build-relations-DB ..."
./build-relations-DB.py ../../offset_lists/
