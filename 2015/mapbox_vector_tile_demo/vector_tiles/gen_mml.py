import ogr
from gdalconst import *
import re
import os
import json

def parse_all(_target_directory, _output_file):
    target_directory = os.path.abspath(_target_directory)
    base = _base_dict()
    base["Layer"] = _get_each_directory([], target_directory)
    fp = open(_output_file, 'w')
    json.dump(base, fp, indent=2)
    fp.close()

def _base_dict():
    return {
        "bounds": [
            -180,
            -85.05112877980659,
            180,
            85.05112877980659
        ],
        "center": [
            0,
            0,
            2
        ],
        "format": "png",
        "interactivity": False,
        "minzoom": 0,
        "maxzoom": 22,
        "srs": "+proj=merc +a=6378137 +b=6378137 +lat_ts=0.0 +lon_0=0.0 +x_0=0.0 +y_0=0.0 +k=1.0 +units=m +nadgrids=@null +wktext +no_defs +over",
        "Stylesheet": [],
        "Layer": [],
        "scale": 1,
        "metatile": 2,
        "name": "",
        "description": ""
    }

def _get_each_directory(layers, target_directory):
    _, dirs, files = os.walk(target_directory).next()
    for f in files:
        sp = os.path.splitext(f)
        if sp[1] == ".shp":
            path = os.path.join(target_directory, f)
            layers.append(_parse_file(path))
    for d in dirs:
        child_directory = os.path.join(target_directory, d)
        layers = _get_each_directory(layers, child_directory)
    return layers

def _parse_file(path):
    datasource = ogr.Open(path, GA_ReadOnly)
    layer = datasource.GetLayer()
    layer.ResetReading()
    name = layer.GetName()
    class_name = re.sub('_.*$', '', name)
    geometry_type = __geometryType(class_name)
    layer_id = name.replace('_', '')
    extent = __extent(layer)
    srs = __srs(layer)
    return __makedict(path, geometry_type, layer_id, class_name, extent, srs)

def __srs(layer):
    spatialRef = layer.GetSpatialRef()
    return str(spatialRef.ExportToProj4())
    
def __extent(layer):
    extent = layer.GetExtent()
    return [extent[0], extent[1], extent[2], extent[3]]
    
def __geometryType(class_name):
    t = class_name[-1:]
    if t == "p":
        return "point"
    if t == "a":
        return "polygon"
    return "linestring"

def __makedict(path, geometry_type, layer_id, class_name, extent, srs):
    dic = {
        "geometry": geometry_type, 
        "extent": extent,
        "id": layer_id,
        "class": class_name,
        "Datasource": {
            "file": path,
            "type": "shape"
        },
        "srs": srs,
        "advanced": {},
        "name": layer_id
    }
    return dic

if __name__ == '__main__':
    #print _parse_file("gm-jpn-trans_u_2_1/raill_jpn.shp")
    #print get_each_directory([], ".")
    import argparse
    parser = argparse.ArgumentParser(description='Convert shapefiles to mml file')
    parser.add_argument('target', metavar='target',
                        help='directory contain target shapefiles (retravel)')
    parser.add_argument('output_file', metavar='output_file',
                        help='output file')
    args = parser.parse_args()
    parse_all(args.target, args.output_file)
