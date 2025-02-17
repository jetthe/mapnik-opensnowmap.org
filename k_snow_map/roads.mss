/* ==================================================================
   ROAD & RAIL LINES
/* ================================================================== */

/* At lower zoomlevels, just show major automobile routes: motorways
and trunks. */

#roads_low[zoom>=5][zoom<=8] {
  [type='motorway'] { line-color: @motorway_line; }
  [type='trunk'] { line-color: @trunk_line; }
  [zoom=5] {
    [type='motorway'] { line-width: 0.4; }
    [type='trunk'] { line-width: 0.2; } }
  [zoom=6] {
    [type='motorway'] { line-width: 0.5; }
    [type='trunk'] { line-width: 0.25; } }
  [zoom=7] {
    [type='motorway'] { line-width: 0.6; }
    [type='trunk'] { line-width: 0.3; } }
  [zoom=8] {
    [type='motorway'] { line-width: 1; }
    [type='trunk'] { line-width: 0.5; } }
}

/* At mid-level scales start to show primary and secondary routes
as well. */

#roads_med[zoom>=9][zoom<=10] {
  [type='motorway'],
  [type='motorway_link'] {
    line-color: @motorway_line;
  }
  [type='trunk'],
  [type='trunk_link'] {
    line-color: @trunk_line;
  }
  [type='primary'] { line-color: @primary_line; }
  [type='secondary'] { line-color: @secondary_line; }
  [type='tertiary'] { line-color: @standard_line; }
  [zoom=9] {
    [type='motorway'],[type='trunk'] { line-width: 1.4; }
    [type='primary'],[type='secondary'],
    [type='motorway_link'],[type='trunk_link'] { line-width: 0.6; }
  }
  [zoom=10] {
    [type='motorway'],[type='trunk'] { line-width: 1.8; }
    [type='primary'],[type='secondary'],
    [type='motorway_link'],[type='trunk_link'] { line-width: 0.8; }
  }
}

/* At higher levels the roads become more complex. We're now showing 
more than just automobile routes - railways, footways, and cycleways
come in as well.

/* Road width variables that are used in road & bridge styles */
@rdz11_maj: 1.6; @rdz11_med: 0.8; @rdz11_min: 0.2;
@rdz12_maj: 2.5; @rdz12_med: 1.2; @rdz12_min: 0.8;
@rdz13_maj: 3;   @rdz13_med: 1.5; @rdz13_min: 1;
@rdz14_maj: 4;   @rdz14_med: 2.5; @rdz14_min: 1.6;
@rdz15_maj: 6;   @rdz15_med: 4;   @rdz15_min: 2;
@rdz16_maj: 8;   @rdz16_med: 6;   @rdz16_min: 4;
@rdz17_maj: 14;  @rdz17_med: 12;  @rdz17_min: 10;
@rdz18_maj: 20;  @rdz18_med: 17;  @rdz18_min: 14;

/* ---- Tracks ----------------------------------------- */
#roads_high::trackleft[stylegroup='track'][zoom>=15][zoom<=20],
#tunnel[stylegroup='track'][render='3_inline'][zoom>=15][zoom<=20],
#bridge[stylegroup='track'][render='3_inline'][zoom>=15][zoom<=20]{
  /* -- colors & styles -- */
    line-cap: butt;
    line-join: round;

  [zoom=15] {
    line-color: darken(@standard_case,40%);
  }
  [zoom>15] {
    line-color: darken(@standard_case,30%);
  }
  [tunnel=1] {
    line-cap: butt;
  }
    [zoom=15] {
    line-offset: @rdz15_min / 1.5/2; 
    line-width: 0.8;
  }
  [zoom=16] {
     line-offset: @rdz16_min / 1.5/2; 
    line-width: 1;
  }
  [zoom=17] {
     line-offset: @rdz17_min / 3/2; 
    line-width: 1.5;
  }
  [zoom>=18] {
     line-offset: @rdz18_min / 2.5/2;
    line-width: 1.5;
  }

  [zoom=15] {line-dasharray: 6,2;  }
  [zoom=16] {line-dasharray: 7,4;  }
  [zoom=17] {line-dasharray: 9,6;  }
  [zoom>=18] {line-dasharray: 10,7;}
 
}
#roads_high::trackright[stylegroup='track'][zoom>=15][zoom<=20],
#tunnel[stylegroup='track'][render='3_inline'][zoom>=15][zoom<=20],
#bridge[stylegroup='track'][render='3_inline'][zoom>=15][zoom<=20]{
  /* -- colors & styles -- */
    line-cap: butt;
    line-join: round;

  [zoom=15] {
    line-color: darken(@standard_case,40%);
  }
  [zoom>15] {
    line-color: darken(@standard_case,30%);
  }
  [tunnel=1] {
    line-cap: butt;
  }

  [zoom=15] {
    line-offset: 0-@rdz15_min / 1.5/2; 
    line-width: 0.8;
  }
  [zoom=16] {
     line-offset: 0-@rdz16_min / 1.5/2; 
    line-width: 1;
  }
  [zoom=17] {
     line-offset: 0-@rdz17_min / 3/2; 
    line-width: 1.5;
  }
  [zoom>=18] {
     line-offset: 0-@rdz18_min / 2.5/2;
    line-width: 1.5;
  }

  [zoom=15] {line-dasharray: 6,2;  }
  [zoom=16] {line-dasharray: 7,4;  }
  [zoom=17] {line-dasharray: 9,6;  }
  [zoom>=18] {line-dasharray: 10,7;}

}
#roads_high::track[stylegroup='track'][zoom>=14][zoom<=20],
#tunnel[stylegroup='track'][render='3_inline'][zoom>=14][zoom<=20],
#bridge[stylegroup='track'][render='3_inline'][zoom>=14][zoom<=20]{
  /* -- colors & styles -- */

    line-color: @standard_line;
    line-opacity: 0.7;
    line-cap: butt;
    line-join: round;

  [tunnel=1] {
    line-cap: butt;
  }
  
  [zoom=14]{ 
    line-width: @rdz14_min / 4; 
    line-color: darken(@standard_case,50%);
  }
  [zoom=15] {
    line-width: @rdz15_min / 1.5 ; 
  }
  [zoom=16] {
     line-width: @rdz16_min / 1.5 - 1.0; 
  }
  [zoom=17] {
     line-width: @rdz17_min / 3 - 1.5; 
  }
  [zoom>=18] {
     line-width: @rdz18_min / 2.5 - 1.5;
  }
}
/* ---- Casing ----------------------------------------------- */

#roads_high::outline[zoom>=11][zoom<=20],
#tunnel[render='1_outline'][zoom>=11][zoom<=20],
#bridge[render='1_outline'][zoom>=11][zoom<=20]{
  /* -- colors & styles -- */
  line-cap: round;
  [bridge=1],
  [tunnel=1] {
    line-cap: butt;
  }
  line-join: round;
  line-color: @standard_case;
  [bridge=1] { line-color: darken(@standard_case,20%) ; }
  
  
  [stylegroup='track']{
    line-width: 0;
  }
  [type='motorway'],
  [type='motorway_link'] {
    line-color: @motorway_case;
    [bridge=1] { line-color: @motorway_case ; }
  }
  [type='trunk'],
  [type='trunk_link'] {
    line-color: @trunk_case;
    [bridge=1] { line-color: @trunk_case ; }
  }
  [type='primary'],
  [type='primary_link'] {
    line-color: @primary_case;
    [bridge=1] { line-color: @primary_case ; }
  }
  [type='secondary'],
  [type='secondary_link'] {
    line-color: @secondary_case;
    [bridge=1] { line-color: @secondary_case ; }
  }
  [stylegroup='railway'] {
    line-color: fadeout(@land,50%);
    [bridge=1] { line-color: @secondary_case ; }
  }
  [tunnel=1] { line-dasharray: 3,3; }    
  /* -- widths -- */
  [zoom=11] {
    [stylegroup='motorway'] { line-width: @rdz11_maj + 2; }
    [stylegroup='mainroad'] { line-width: @rdz11_med + 1.6; }
    [stylegroup='minorroad']{ line-width: @rdz11_min; }
    /* No minor bridges yet */
    [stylegroup='service']  { line-width: 0; }
    [stylegroup='noauto']   { line-width: 0; }
    [stylegroup='railway']  { line-width: 0; }
  }
  [zoom=12] {
    [stylegroup='motorway'] { line-width: @rdz12_maj + 2; }
    [stylegroup='mainroad'] { line-width: @rdz12_med + 2; }
    [stylegroup='minorroad']{ line-width: @rdz12_min/2; }
    /* No minor bridges yet */
    [stylegroup='service']  { line-width: 0; }
    [stylegroup='noauto']   { line-width: 0; }
    [stylegroup='railway']  { line-width: 0; }
  }
  [zoom=13] {
    [stylegroup='motorway'] { line-width: @rdz13_maj + 2; }
    [stylegroup='mainroad'] { line-width: @rdz13_med + 2; }
    [stylegroup='minorroad']{ line-width: @rdz13_min + 0.7; }
    /* No minor bridges yet */
    [stylegroup='service']  { line-width: 0; }
    [stylegroup='noauto']   { line-width: 0; }
    [stylegroup='railway']  { line-width: 0; }
  }
  [zoom=14] {
    [stylegroup='motorway'] { line-width: @rdz14_maj + 2; }
    [stylegroup='mainroad'] { line-width: @rdz14_med + 2; }
    [stylegroup='minorroad']{ line-width: @rdz14_min + 1; }
    /* No minor bridges yet */
    [stylegroup='service']  { line-width: @rdz14_min / 3 ; }
    [stylegroup='noauto']   { line-width: 0; }
    [stylegroup='railway']  { line-width: 0; }
  }
  [zoom=15] {
    [stylegroup='motorway'] { line-width: @rdz15_maj + 2.5; }
    [stylegroup='mainroad'] { line-width: @rdz15_med + 2; }
    [stylegroup='minorroad']{ line-width: @rdz15_min + 2; }
    [stylegroup='service']  { line-width: @rdz15_min / 3 + 1; }
    [stylegroup='noauto']   { line-width: 0; }
    [stylegroup='railway']  { line-width: 1.5 + 2; 
        [tunnel=1] { line-width: 0; }}
  }
  [zoom=16] {
    [stylegroup='motorway'] { line-width: @rdz16_maj + 2.5; }
    [stylegroup='mainroad'] { line-width: @rdz16_med + 2.5; }
    [stylegroup='minorroad']{ line-width: @rdz16_min + 2; }
    [stylegroup='service']  { line-width: @rdz16_min / 3 + 1; }
    [stylegroup='noauto']   { line-width: 0; }
    [stylegroup='railway']  { line-width: 2 + 2; 
        [tunnel=1] { line-width: 0; }}
  }
  [zoom>=17] {
    [stylegroup='motorway'] { line-width: @rdz17_maj + 3; }
    [stylegroup='mainroad'] { line-width: @rdz17_med + 2.5; }
    [stylegroup='minorroad']{ line-width: @rdz17_min + 2; }
    [stylegroup='service']  { line-width: @rdz17_min / 3 + 1; }
    [stylegroup='noauto']   { line-width: 0; }
    [stylegroup='railway']  { line-width: 3 + 4; 
        [tunnel=1] { line-width: 0; }
        } 
  }
  [zoom>=18] {
    [stylegroup='motorway'] { line-width: @rdz18_maj + 4; }
    [stylegroup='mainroad'] { line-width: @rdz18_med + 4; }
    [stylegroup='minorroad']{ line-width: @rdz18_min + 3.5; }
    [stylegroup='service']  {line-width: @rdz18_min / 2 + 2.5; }
    [stylegroup='noauto']   { line-width: 0; }
    [stylegroup='railway']  { line-width: 4 + 6; 
        [tunnel=1] { line-width: 0; }}
  }
}


#roads_high[zoom>=11][zoom<=20],
#tunnel[render='3_inline'][zoom>=11][zoom<=20],
#bridge[render='3_inline'][zoom>=11][zoom<=20]{
  /* -- colors & styles -- */
  line-color: @standard_fill;
  [stylegroup='noauto']{
    line-color: darken(@standard_case,25%);
  }
  [stylegroup='track']{
    line-width: 0;
  }
  [type='motorway'],
  [type='motorway_link'] {
    line-color: @motorway_fill;
    [tunnel=1] { line-color: lighten(@motorway_fill, 10%); }
  }
  [type='trunk'],
  [type='trunk_link'] {
    line-color: @trunk_fill;
    [tunnel=1] { line-color: lighten(@trunk_fill, 10%); }
  }
  [type='primary'],
  [type='primary_link'] {
    line-color: @primary_fill;
    [tunnel=1] { line-color: lighten(@primary_fill, 10%); }
  }
  [type='secondary'],
  [type='secondary_link'] {
    line-color: @secondary_fill;
    [tunnel=1] { line-color: lighten(@secondary_fill, 10%); }
  }
  [stylegroup='railway'] {
    line-color: @rail_line;
    [tunnel=1] { line-opacity: 0.5; }
    [zoom<13] { line-color: lighten(@rail_line, 10%);  } 
    line-dasharray: 1,1;
    [type='subway'] { line-opacity: 0.67; }
    [zoom>15] { line-dasharray: 1,2; } 
  }
  [stylegroup='noauto'],
  [stylegroup='service'],
  [stylegroup='minorroad'] {
    line-width: 0;
  }
  [stylegroup='service'],
  [stylegroup='minorroad'],
  [stylegroup='mainroad'],
  [stylegroup='motorway'] {
    line-cap: round;
    line-join: round;
  }
  [stylegroup='noauto'] {
    line-join: round;
  }
  [tunnel=1] {
    line-cap: butt;
  }
  /* -- widths -- */
  [zoom=11] {
    [stylegroup='motorway'] { line-width: @rdz11_maj; }
    [stylegroup='mainroad'] { line-width: @rdz11_med; }
    [stylegroup='minorroad']{ line-width: 0; }
    [stylegroup='railway']  { line-width: 0.2; }
  }
  [zoom=12] {
    [stylegroup='motorway'] { line-width: @rdz12_maj; }
    [stylegroup='mainroad'] { line-width: @rdz12_med; }
    [stylegroup='minorroad']{ line-width: 0; }
    [stylegroup='service']  {  line-width: 0;}
    [stylegroup='railway']  { line-width: 0.4; }
  }
  [zoom=13] {
    [stylegroup='motorway'] { line-width: @rdz13_maj; }
    [stylegroup='mainroad'] { line-width: @rdz13_med; }
    [stylegroup='minorroad']{ line-width: @rdz13_min; }
    [stylegroup='service']  { line-width: @rdz13_min / 3;}
    [stylegroup='noauto']   { line-width: @rdz13_min / 4; line-dasharray: 3,2; }
    [stylegroup='railway']  { line-width: 0.8; }
  }
  [zoom=14] {
    [stylegroup='motorway'] { line-width: @rdz14_maj; }
    [stylegroup='mainroad'] { line-width: @rdz14_med; }
    [stylegroup='minorroad']{ line-width: @rdz14_min; }
    [stylegroup='service']  { line-width: @rdz14_min / 4; }
    [stylegroup='noauto']   { line-width: @rdz14_min / 4; line-dasharray: 3,2; }
    [stylegroup='railway']  { line-width: 1; }
  }
  [zoom=15] {
    [stylegroup='motorway'] { line-width: @rdz15_maj; }
    [stylegroup='mainroad'] { line-width: @rdz15_med; }
    [stylegroup='minorroad']{ line-width: @rdz15_min; }
    [stylegroup='service']  { line-width: @rdz15_min / 3;  }
    [stylegroup='noauto']   { line-width: @rdz15_min / 2.2; line-dasharray: 4,3; }
    [stylegroup='railway']  { line-width: 1.5; }
  }
  [zoom=16] {
    [stylegroup='motorway'] { line-width: @rdz16_maj; }
    [stylegroup='mainroad'] { line-width: @rdz16_med; }
    [stylegroup='minorroad']{ line-width: @rdz16_min; }
    [stylegroup='service']  { line-width: @rdz16_min / 3;  }
    [stylegroup='noauto']   { line-width: @rdz16_min /4; line-dasharray: 5,3; }
    [stylegroup='railway']  { line-width: 2; }
  }
  [zoom=17] {
    [stylegroup='motorway'] { line-width: @rdz17_maj; }
    [stylegroup='mainroad'] { line-width: @rdz17_med; }
    [stylegroup='minorroad']{ line-width: @rdz17_min; }
    [stylegroup='service']  { line-width: @rdz17_min / 3; }
    [stylegroup='noauto']   { line-width: @rdz17_min / 8; line-dasharray: 6,3; }
    [stylegroup='railway']  { line-width: 3; }
  }
  [zoom>=18] {
    [stylegroup='motorway'] { line-width: @rdz18_maj; }
    [stylegroup='mainroad'] { line-width: @rdz18_med; }
    [stylegroup='minorroad']{ line-width: @rdz18_min; }
    [stylegroup='service']  { line-width: @rdz18_min / 2;  }
    [stylegroup='noauto']   { line-width: @rdz18_min / 8; line-dasharray: 7,4; }
    [stylegroup='railway']  { line-width: 4; }
  }
}

/* ---- Bridge fill for dashed lines -------------------------------- */
#tunnel[render='2_line'][zoom>=14][zoom<=20],
#bridge[render='2_line'][zoom>=14][zoom<=20]{
  /* -- colors & styles -- */
  [stylegroup='noauto'] {
    line-color: @land;
    line-width: 0;
    line-join: round;
  }
  [stylegroup='railway'] {
    line-color: @land;
    line-join: round;
  }
  /* -- widths -- */
  [zoom=14] {
    [stylegroup='noauto']   { line-width: @rdz14_min / 4 + 1; }
    [stylegroup='railway']  { line-width: 1 + 1; 
        [tunnel=1] { line-width: 0; }}
  }
  [zoom=15] {
    [stylegroup='noauto']   { line-width: @rdz15_min / 4 + 1; }
    [stylegroup='railway']  { line-width: 1.5 + 1; 
        [tunnel=1] { line-width: 0; }}
  }
  [zoom=16] {
    [stylegroup='noauto']   { line-width: @rdz16_min / 4 + 1; }
    [stylegroup='railway']  { line-width: 2 + 1; 
        [tunnel=1] { line-width: 0; }}
  }
  [zoom=17] {
    [stylegroup='noauto']   { line-width: @rdz17_min / 4 + 3; }
    [stylegroup='railway']  { line-width: 3 + 2; 
        [tunnel=1] { line-width: 0; }}
  }
  [zoom>=18] {
    [stylegroup='noauto']   { line-width: @rdz18_min / 4 + 3; }
    [stylegroup='railway']  { line-width: 4 + 3; 
        [tunnel=1] { line-width: 0; }}
  }
}

/* ---- Turning Circles --------------------------------------------- */
#turning_circle_case[zoom>=14] {
  marker-fill:@standard_fill;
  marker-line-color:@standard_case;
  marker-line-width:2;
  marker-allow-overlap:true;
}
#turning_circle_fill[zoom>=14] {
  marker-fill:@standard_fill;
  marker-line-width:0;
  marker-line-opacity:0;
  marker-allow-overlap:true;
}
#turning_circle_case,
#turning_circle_fill {
  [zoom=14] { marker-width:@rdz14_min * 1.1; }
  [zoom=15] { marker-width:@rdz15_min * 1.1; }
  [zoom=16] { marker-width:@rdz16_min * 1.1; }
  [zoom=17] { marker-width:@rdz17_min * 1.1; }
  [zoom>=18] { marker-width:@rdz18_min * 1.1; }
}

/* ================================================================== */
/* AEROWAYS
/* ================================================================== */

#aeroway[zoom>9] {
  line-color:@aeroway;
  line-cap:butt;
  line-join:miter;
  [type='runway'] {
    [zoom=10]{ line-width:1; }
    [zoom=11]{ line-width:2; }
    [zoom=12]{ line-width:3; }
    [zoom=13]{ line-width:5; }
    [zoom=14]{ line-width:7; }
    [zoom=15]{ line-width:11; }
    [zoom=16]{ line-width:15; }
    [zoom=17]{ line-width:19; }
    [zoom>17]{ line-width:23; }
  }
  [type='taxiway'] {
    [zoom=10]{ line-width:0.2; }
    [zoom=11]{ line-width:0.2; }
    [zoom=12]{ line-width:0.2; }
    [zoom=13]{ line-width:1; }
    [zoom=14]{ line-width:1.5; }
    [zoom=15]{ line-width:2; }
    [zoom=16]{ line-width:3; }
    [zoom=17]{ line-width:4; }
    [zoom>17]{ line-width:5; }
  }
}

/******************************************************************* */
