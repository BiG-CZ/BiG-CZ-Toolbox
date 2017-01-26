#!bin/bash

CONDAURL=https://repo.continuum.io/miniconda/Miniconda2-latest-Linux-x86_64.sh
curl $CONDAURL -o miniconda.sh
bash miniconda.sh -b
export PATH=$HOME/miniconda2/bin:$PATH
conda update --yes --all
