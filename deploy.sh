#!/bin/bash

tar czf easyio.tar.gz main.js package.json public LICENSE
scp easyio.tar.gz ubuntu@184.72.126.120:~
rm easyio.tar.gz

ssh ubuntu@184.72.126.120 << 'ENDSSH'
pm2 stop all
rm -rf easyio
mkdir easyio
tar xf easyio.tar.gz -C easyio
rm easyio.tar.gz
cd easyio 
npm i
pm2 start all
ENDSSH
