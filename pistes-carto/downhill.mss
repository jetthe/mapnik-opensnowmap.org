#downhill-bg{ /* white bg for aliasing*/
    line-cap: round;
    line-join: round;
    line-color: #FFFFFF;
    line-gamma: 0.6;
    line-smooth: 0.2;
    [difficulty='freeride']{line-color: #DDDDDD;}
    
    [zoom>=9][zoom<=11]{line-width: 2.5;}
    [zoom=12]{line-width: 4.5;}
    [zoom>=13][zoom<=15]{line-width: 6.5;}
    [zoom>=16]{line-width: 8.5;}
}

#downhill-casing{
opacity: 0.9;
    line-cap: round;
    line-join: round;
    line-gamma: 0.6;
    line-smooth: 0.2;
    
    [zoom>=9][zoom<=11]{line-width: 2;}
    [zoom=12]{line-width: 4;}
    [zoom>=13][zoom<=15]{line-width: 6;}
    [zoom>=16]{line-width: 7.5;}
    
    line-color: #FFFFFF;
        [us="1"] {
            [difficulty="novice"]{line-color: #26A626;}
            [difficulty="easy"]{line-color: #26A626;}
            [difficulty="intermediate"]{line-color: #1919DE;}
            [difficulty="advanced"]{line-color: #222222;}
            [difficulty="expert"]{line-color: #222222;}
            [difficulty="freeride"]{line-color: #FFE72D;}
            [zoom>=9][zoom<=10]{
            [difficulty="novice"]{line-color: darken(desaturate(#26A626,20%), 10%);}
            [difficulty="easy"]{line-color: darken(desaturate(#26A626,20%), 10%);}
            [difficulty="intermediate"]{line-color: lighten(desaturate(#1919DE,10%), 10%);}
            [difficulty="advanced"]{line-color: lighten(desaturate(#222222,10%), 10%);}
            [difficulty="expert"]{line-color: lighten(desaturate(#222222,10%), 10%);}
            [difficulty="freeride"]{line-color: lighten(desaturate(#FFE72D,10%), 10%);}
            }
        }
    
        [us="0"] {
            [difficulty="novice"]{line-color: #26A626;}
            [difficulty="easy"]{line-color: #1919DE;}
            [difficulty="intermediate"]{line-color: #E81F1F;}
            [difficulty="advanced"]{line-color: #222222;}
            [difficulty="expert"]{line-color: #FFBB2D;}
            [difficulty="freeride"]{line-color: #FFE72D;}
            [zoom>=9][zoom<=10]{
            [difficulty="novice"]{line-color: darken(desaturate(#26A626,20%), 10%);}
            [difficulty="easy"]{line-color: lighten(desaturate(#1919DE,10%), 3%);}
            [difficulty="intermediate"]{line-color: lighten(desaturate(#E81F1F,25%), 3%);}
            [difficulty="advanced"]{line-color: lighten(desaturate(#222222,10%), 10%);}
            [difficulty="expert"]{line-color: lighten(desaturate(#FFBB2D,10%), 3%);}
            [difficulty="freeride"]{line-color: lighten(desaturate(#FFE72D,10%), 3%);}
            }
        }
}


#downhill-area-bg{ /* white bg for aliasing*/
    line-cap: round;
    line-join: round;
    line-color: #FFFFFF;
    line-gamma: 0.6;
    line-smooth: 0.2;
    [zoom>=9][zoom<=11]{line-width: 1;}
    [zoom=12]{line-width: 2.0;}
    [zoom>=13][zoom<=15]{line-width: 2.5;}
    [zoom>=16]{line-width: 2;}
}

#downhill-area-casing{
opacity: 0.9;
    line-cap: round;
    line-join: round;
    line-gamma: 0.6;
    line-smooth: 0.2;
    
    [zoom>=9][zoom<=11]{line-width: 1;}
    [zoom=12]{line-width: 1.5;}
    [zoom>=13][zoom<=15]{line-width: 2;}
    [zoom>=16]{line-width: 2.5;}
    
    line-color: #FFFFFF;
        [us="1"] {
            [difficulty="novice"]{line-color: #26A626;}
            [difficulty="easy"]{line-color: #26A626;}
            [difficulty="intermediate"]{line-color: #1919DE;}
            [difficulty="advanced"]{line-color: #222222;}
            [difficulty="expert"]{line-color: #222222;}
            [difficulty="freeride"]{line-color: #FFE72D;}
            [zoom>=9][zoom<=10]{
            [difficulty="novice"]{line-color: darken(desaturate(#26A626,20%), 10%);}
            [difficulty="easy"]{line-color: darken(desaturate(#26A626,20%), 10%);}
            [difficulty="intermediate"]{line-color: lighten(desaturate(#1919DE,10%), 10%);}
            [difficulty="advanced"]{line-color: lighten(desaturate(#222222,10%), 10%);}
            [difficulty="expert"]{line-color: lighten(desaturate(#222222,10%), 10%);}
            [difficulty="freeride"]{line-color: lighten(desaturate(#FFE72D,10%), 10%);}
            }
        }
    
        [us="0"] {
            [difficulty="novice"]{line-color: #26A626;}
            [difficulty="easy"]{line-color: #1919DE;}
            [difficulty="intermediate"]{line-color: #E81F1F;}
            [difficulty="advanced"]{line-color: #222222;}
            [difficulty="expert"]{line-color: #FFBB2D;}
            [difficulty="freeride"]{line-color: #FFE72D;}
            [zoom>=9][zoom<=10]{
            [difficulty="novice"]{line-color: darken(desaturate(#26A626,20%), 10%);}
            [difficulty="easy"]{line-color: lighten(desaturate(#1919DE,10%), 3%);}
            [difficulty="intermediate"]{line-color: lighten(desaturate(#E81F1F,25%), 3%);}
            [difficulty="advanced"]{line-color: lighten(desaturate(#222222,10%), 10%);}
            [difficulty="expert"]{line-color: lighten(desaturate(#FFBB2D,10%), 3%);}
            [difficulty="freeride"]{line-color: lighten(desaturate(#FFE72D,10%), 3%);}
            }
        }
}

#downhill-area-fill[zoom>=12]{
opacity: 0.9;
    
    [zoom=12]{polygon-opacity: 0.4; polygon-gamma: 1;}
    [zoom>=13][zoom<=15]{polygon-opacity: 0.2; polygon-gamma: 0.6; 
    polygon-smooth:0.2;
    }
    [zoom>=16]{polygon-opacity: 0.05;polygon-gamma: 1; 
    polygon-smooth:0.2;
    }
    
    polygon-fill: #FFFFFF;
        [us="1"] {
            [difficulty="novice"]{polygon-fill: #26A626;}
            [difficulty="easy"]{polygon-fill: #26A626;}
            [difficulty="intermediate"]{polygon-fill: #1919DE;}
            [difficulty="advanced"]{polygon-fill: #222222;}
            [difficulty="expert"]{polygon-fill: #222222;}
            [difficulty="freeride"]{polygon-fill: #FFE72D;}
        }
    
        [us="0"] {
            [difficulty="novice"]{polygon-fill: #26A626;}
            [difficulty="easy"]{polygon-fill: #1919DE;}
            [difficulty="intermediate"]{polygon-fill: #E81F1F;}
            [difficulty="advanced"]{polygon-fill: #222222;}
            [difficulty="expert"]{polygon-fill: #FFBB2D;}
            [difficulty="freeride"]{polygon-fill: #FFE72D;}
        }
}
/*Overlay erasers */
#downhill-overlay-eraser1[zoom>=9][zoom<=11]{
    comp-op: dst-out;
    opacity: 0.35;
    
    line-color: #FFFFFF;
    line-cap: round;
    line-join: round;
    line-gamma: 0.6;
    line-width: 0.2;
}
#downhill-overlay-eraser2[zoom=12]{
    comp-op: dst-out;
    opacity: 0.55;
    
    line-color: #FFFFFF;
    line-cap: round;
    line-join: round;
    line-gamma: 0.6;
    line-width: 2;
}
#downhill-overlay-eraser3[zoom>=13][zoom<=15]{
    comp-op: dst-out;
    opacity: 0.85;
    
    line-color: #FFFFFF;
    line-cap: round;
    line-join: round;
    line-gamma: 0.6;
    line-width: 4;
    line-smooth: 0.2;
}
#downhill-overlay-eraser4[zoom>=16]{
    comp-op: dst-out;
    opacity: 0.95;
    
    line-color: #FFFFFF;
    line-cap: round;
    line-join: round;
    line-gamma: 0.6;
    line-width: 5;
    line-smooth: 0.2;
}

#downhill-area-eraser[zoom>=12]{
    comp-op: dst-out;
    
    polygon-fill: #FFFFFF;
    [zoom=12]{polygon-opacity: 1; polygon-gamma: 0.6;}
    [zoom>=13][zoom<=15]{polygon-opacity: 1; polygon-gamma: 0.6; 
    polygon-smooth:0.2;
    }
    [zoom>=16]{polygon-opacity: 1; polygon-gamma: 1; 
    polygon-smooth:0.2;
    }

}

#downhill-overlay-thin[zoom>=15]{
    line-cap: round;
    line-join: round;
    line-gamma: 0.6;
    line-smooth: 0.2;
    line-width: 2;
    line-color: #FFFFFF;
    line-opacity: 0.05;
    
        [us="1"] {
            [difficulty="novice"]{line-color: #26A626;}
            [difficulty="easy"]{line-color: #26A626;}
            [difficulty="intermediate"]{line-color: #1919DE;}
            [difficulty="advanced"]{line-color: #222222;}
            [difficulty="expert"]{line-color: #222222;}
            [difficulty="freeride"]{line-color: #FFE72D;}
        }
    
        [us="0"] {
            [difficulty="novice"]{line-color: #26A626;}
            [difficulty="easy"]{line-color: #1919DE;}
            [difficulty="intermediate"]{line-color: #E81F1F;}
            [difficulty="advanced"]{line-color: #222222;}
            [difficulty="expert"]{line-color: #FFBB2D;}
            [difficulty="freeride"]{line-color: #FFE72D;}
        }
}

#downhill-text[zoom>=15]{
    text-name:'[pistename]';
    text-face-name:@book-fonts;
    text-halo-radius:1;
    text-size: 10;
    text-placement: point;
    text-avoid-edges: true;
    text-allow-overlap:false;
    text-wrap-width: 25;
    text-spacing: 10000;
    
    text-halo-fill:#DFE9F0;
    text-fill:#666666;
    
        [us="1"] {
            [difficulty="novice"]{text-fill: #26A626;}
            [difficulty="easy"]{text-fill: #26A626;}
            [difficulty="intermediate"]{text-fill: #1919DE;}
            [difficulty="advanced"]{text-fill: #222222;}
            [difficulty="expert"]{text-fill: #222222;}
            [difficulty="freeride"]{text-fill: #FFE72D;}
        }
    
        [us="0"] {
            [difficulty="novice"]{text-fill: #26A626;}
            [difficulty="easy"]{text-fill: #1919DE;}
            [difficulty="intermediate"]{text-fill: #E81F1F;}
            [difficulty="advanced"]{text-fill: #222222;}
            [difficulty="expert"]{text-fill: #FFBB2D;}
            [difficulty="freeride"]{text-fill: #FFE72D;}
        }
    
    [grooming='mogul']{text-dy: 10;}
    [gladed=true]{text-dy: 10;}
    [lit=true]{text-dy: 10;}
    
    [us="1"] {
        [difficulty='advanced']{
            shield-placement: 'line';
            shield-spacing: 400;
            shield-face-name:@bold-fonts;
            shield-name:'';
            shield-allow-overlap: false;
            shield-label-position-tolerance: 150;
            shield-transform: scale(0.25,0.25);
            shield-file: url('pics/diamond.svg');
            shield-spacing: 300;
        }
        [difficulty='expert']{
            shield-placement: 'line';
            shield-spacing: 400;
            shield-face-name:@bold-fonts;
            shield-name:'';
            shield-allow-overlap: false;
            shield-label-position-tolerance: 150;
            shield-transform: scale(0.25,0.25);
            shield-file: url('pics/diamonds.svg');
            shield-spacing: 300;
        }
    }
    
}
#downhill-icons[zoom>=14]{
    
    [difficulty='freeride']{
        shield-placement: 'line';
        shield-spacing: 400;
        shield-face-name:@bold-fonts;
        shield-name:'';
        shield-allow-overlap: false;
        shield-label-position-tolerance: 200;
        shield-transform: scale(0.4,0.4);
        shield-file: url('pics/danger-red.svg');
    }
    [gladed=true]{
        shield-placement: 'line';
        shield-spacing: 400;
        shield-face-name:@bold-fonts;
        shield-name:'';
        shield-allow-overlap: false;
        shield-label-position-tolerance: 200;
        shield-transform: scale(0.6,0.6);
        shield-file: url('pics/gladed.svg');
    }
    [grooming='mogul']{
        shield-placement: 'line';
        shield-spacing: 400;
        shield-face-name:@bold-fonts;
        shield-name:'';
        shield-allow-overlap: false;
        shield-label-position-tolerance: 200;
        shield-transform: scale(0.6,0.6);
        shield-file: url('pics/mogul.svg');
    }

}
