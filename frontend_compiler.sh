#!/bin/bash

currentpath=$(pwd)
cd beer_game/server/templates/index
npm install
npm run build
cd build
echo "<form id = 'csrf_cup'>{% csrf_token %}</form>" >> index.html
cd ../..
cd instructor
npm install
npm run build
cd ../player
npm install
npm run build
cd $currentpath
