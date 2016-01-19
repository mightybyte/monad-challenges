#!/bin/sh

./site clean
./site build
rm ../index.html
rm -fr ../pages
cp -R _site/* ..
