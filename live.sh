#!/bin/bash
mkdir -p live
rm -rf live/*
fswatch -0 -or live.ipynb | xargs -0 -n 1 ./deploy.sh

