# Mapbox Vector Tile with ISCGM Demo

## How to use

Open 2 consoles.

in a console:

```bash
cd vector_tiles
sh prepare.sh
virtualenv env
source env/bin/activate
pip install GDAL
python gen_mml.py . project.mml
npm install
carto project.mml > project.xml
npm run start
```

Run vector tiles server with port 7777.

other console:

```bash
cd demosites
npm install
npm run start
```

Web server run with port 8000.

Open http://localhost:8000/demosite.html

## memo

Mapbox GL need glphys and sprites if you need to use text and images.

### make glphys pbf

```bash
mkdir -p fonts/"Open Sans Regular,Arial Unicode MS Regular"
npm run fontnik OpenSans-Regular.ttf fonts/"Open Sans Regular,Arial Unicode MS Regular"
```

### make sprite images

```bash
curl -L -o maki-2.0.5.tar.gz https://github.com/mapbox/maki/archive/v2.0.5.zip
tar zxf maki-2.0.5.tar.gz
mkdir maki-sprites
npm run spritezero maki-sprites/sprite maki-2.0.5/icons
npm run spritezero --retina maki-sprites/sprite@2x maki-2.0.5/icons
```
