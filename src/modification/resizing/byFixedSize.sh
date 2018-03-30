#!/usr/bin/env bash

function createTestData() {
    rm -rf /tmp/sut
    cp -rf ../../_testdata /tmp/sut
}

# 100x - resize the width to 100 pixels while maintaining the h/w ratio
function doResizeW() {
    rm -rf /tmp/resized
    mkdir /tmp/resized
    mogrify -path /tmp/resized -resize 100x -quality 80 -format jpg /tmp/sut/*
}

# x100 - resize the height to 100 pixels while maintaining the h/w ratio
function doResizeH() {
    rm -rf /tmp/resized
    mkdir /tmp/resized
    mogrify -path /tmp/resized -resize x100 -quality 80 -format jpg /tmp/sut/*
}

createTestData
ls /tmp/sut/* | xargs file 

doResizeW
ls /tmp/resized/* | xargs file

doResizeH
ls /tmp/resized/* | xargs file
