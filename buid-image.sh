#!/bin/bash


echo  " ======= build docker kaldi image ======== "
docker build -t kaldi_docker .
echo " ======== end of build ========== "
