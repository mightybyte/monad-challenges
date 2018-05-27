#!/bin/sh

SITE_DIR=../result/bin
$SITE_DIR/site clean
$SITE_DIR/site build
rm ../index.html
rm -fr ../pages
cp -R _site/* ..
