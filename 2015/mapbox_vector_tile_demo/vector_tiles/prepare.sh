#!/bin/sh
curl -o gm-jpn-all_u_2_1.zip http://www1.gsi.go.jp/geowww/globalmap-gsi/download/data/gm-japan/gm-jpn-all_u_2_1.zip
curl -o gm-jpn-bnd_u_2_1.zip http://www1.gsi.go.jp/geowww/globalmap-gsi/download/data/gm-japan/gm-jpn-bnd_u_2_1.zip
curl -o gm-jpn-trans_u_2_1.zip http://www1.gsi.go.jp/geowww/globalmap-gsi/download/data/gm-japan/gm-jpn-trans_u_2_1.zip
unzip gm-jpn-all_u_2_1.zip
unzip gm-jpn-bnd_u_2_1.zip
unzip gm-jpn-trans_u_2_1.zip
