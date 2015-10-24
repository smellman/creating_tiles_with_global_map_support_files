/*
Map {
  background-color: #b8dee6;
}

#countries {
  ::outline {
    line-color: #85c5d3;
    line-width: 2;
    line-join: round;
  }
  polygon-fill: #fff;
}
*/
.coastl {
  line-width:1;
  line-color:#24dbdb;
  line-join: round;
  line-cap: butt;
}

.polbnda {
  line-color:#594;
  line-width:0.5;
  line-opacity: 0.8;
  polygon-opacity:0.2;
  polygon-fill:#ae8;
}

.polbndl {
  line-width:1;
  line-color:#168;
}

.polbnda[zoom>=10][laa!="UNK"][laa!="Unknown"][laa!="NULL"][laa!="Null"][laa!="null"] {
  text-name: "[laa]";
  text-face-name: "DejaVu Sans Bold";
  text-size: 10;
  text-halo-fill: #FFFFFF;
  text-fill: #9966FF;
  text-allow-overlap: false;
  text-horizontal-alignment: auto;
  text-vertical-alignment: auto;
  text-halo-radius: 1.5;
  text-min-distance: 128;
}

