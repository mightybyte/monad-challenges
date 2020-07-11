#!/bin/sh

SITE_DIR=../result/bin
$SITE_DIR/site clean
$SITE_DIR/site build
rm ../../docs/index.html
rm -fr ../../docs/pages
cp -R _site/* ../../docs
