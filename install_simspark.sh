#!/bin/bash

cd SimSpark || exit
bash ./clean.sh
bash ./build.sh
bash ./clean.sh
cd ..