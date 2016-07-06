const express = require('express');
const http = require('http');
const app = express();

const tilelive = require('tilelive');
require('tilelive-bridge').registerProtocols(tilelive);
const project_path = 'bridge://' + __dirname + '/project.xml';
console.log(project_path);

tilelive.load(project_path, function(err, source) {
    if (err) throw err;

    app.set('port', 7777);

    app.use(function(req, res, next) {
        res.header("Access-Control-Allow-Origin", "*");
        res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
        next();
    });

    app.get(/^\/tiles\/(\d+)\/(\d+)\/(\d+).pbf$/, function(req, res){

        var z = req.params[0];
        var x = req.params[1];
        var y = req.params[2];
        // check cache {z}/{x}/{y}.pbf

        console.log('get tile %d, %d, %d', z, x, y);

        source.getTile(z, x, y, function(err, tile, headers) {
            if (err) {
                res.status(404)
                res.send(err.message);
                console.log(err.message);
            } else {
                // cache {z}/{x}/{y}.pbf
              res.set(headers);
              res.send(tile);
            }
        });
    });

    http.createServer(app).listen(app.get('port'), function() {
        console.log('Express server listening on port ' + app.get('port'));
    });

});
