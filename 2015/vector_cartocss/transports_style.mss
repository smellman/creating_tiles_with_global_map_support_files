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

.airp {
  marker-file: url(image/airport-24.svg);
  marker-width:20;
  marker-fill:#000000;
  marker-allow-overlap:true;
  marker-ignore-placement:true;
}

.raill {
  ::line {
    [zoom < 8] { line-width: 1; }
    [zoom = 8] { line-width: 2; }
    [zoom > 8] { line-width: 4; }
    line-color: #777;
  }
  ::dash {
    line-color: #fff;
    [zoom < 8] { line-width: 0.5; }
    [zoom = 8] { line-width: 1; }
    [zoom > 8] { line-width: 2; }
    line-dasharray: 6, 6;
  }
}

.roadl {
  /* primary route */
  [rtt=14] { 
    ::case {
      line-width: 5; 
      line-color: #d83;
    }
    ::fill {
      line-width: 2.5;
      line-color: #fe3;
    }
  }
  /* secondary route */
  [rtt=15] {
    ::case {
      line-width: 3; 
      line-color: #d83;
    }
    ::fill {
      line-width: 1.5;
      line-color: #fe3;
    }
  }
  /* Hightway */
  [rtt=16] {
    ::case {
      line-width: 7; 
      line-color: #d83;
    }
    ::fill {
      line-width: 3.5;
      line-color: #fe3;
    }
  }
}
