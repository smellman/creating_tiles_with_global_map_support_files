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

.builtupp[zoom>=8][nam!="NULL"][nam!="Null"][nam!="UNK"][nam!="Unknown"][nam!="N_A"] {
  text-name: "[nam]";
  text-face-name: "DejaVu Sans Bold";
  text-allow-overlap: false;
  text-opacity: 0.5;
  text-halo-fill: #FFFFFF;
  text-halo-radius: 1.5;
  text-size: 12;
}
