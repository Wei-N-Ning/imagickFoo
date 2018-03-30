#!/usr/bin/env bash

function createTestData() {
    rm -rf /tmp/sut
    rm -rf /tmp/resized
    cp -rf ../../_testdata /tmp/sut
    mkdir /tmp/resized
}

function doResize() {
    mogrify -path /tmp/resized -resize 60x60% -quality 80 -format jpg /tmp/sut/*
}

createTestData
doResize

ls /tmp/sut/* | xargs file 
ls /tmp/resized/* | xargs file
