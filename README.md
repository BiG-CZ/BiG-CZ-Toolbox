
BiG-CZ-Toolbox
==============

Work on the python toolboxes for advanced access and interaction with the BiG CZ data services.

## Data Access Web Services for the BiGCZ

[Initial notes about common, relevant data web services.](Web_Services.md)

## IPython (Jupyter) notebook demos
- Using the [ODM2 REST API's](http://sis-devel.cloudapp.net/docs/) (web services) from Python. It uses Emilio's [Marchantaria Time Series data use case](https://github.com/ODM2/ODM2/tree/master/usecases/marchantariats). The notebook can be [viewed as rendered by Github](https://github.com/BiG-CZ/BiG-CZ-Toolbox/blob/master/ipynotebooks/ODM2RESTdemo_MarchantariaUseCase.ipynb), but with the glitch that the interactive, inline map is not rendered; for best results see the notebook as [rendered on nbviewer](http://nbviewer.ipython.org/github/BiG-CZ/BiG-CZ-Toolbox/blob/master/ipynotebooks/ODM2RESTdemo_MarchantariaUseCase.ipynb). It can be downloaded from either system. 8/8/2015.
- [Various demos from Emilio, presented at the BiG CZ project meeting at Stroud in October 2014.](https://github.com/BiG-CZ/BiG-CZ-Toolbox/tree/master/ipynotebooks/2014OctMeeting)

## Multi-platform, easy-to-install Python environment based on Conda

Will create a Python configuration based on the [Conda package management system](http://conda.pydata.org/docs/) (note: [Anaconda](https://store.continuum.io/cshop/anaconda/) is based on conda). Will connect to IOOS efforts, with [its IOOS conda recipes](https://github.com/ioos/conda-recipes) and its [linked IOOS anaconda (fomerly "binstar") channel,](https://anaconda.org/ioos/) and specially with the broader [conda-forge](https://conda-forge.github.io/) effort (the [conda-forge project was described in May 2016 in a recent Continuum guess blog post.](https://www.continuum.io/blog/developer-blog/community-conda-forge))

[This Continuum blog post is a terrific, recent and comprehensive introduction to conda](http://www.continuum.io/blog/conda-data-science) targeted to data scientists. It also has links to a presentation (Youtube and slides) on the same material. An extra nifty aspect of this material is that it "explores how to use conda in a multi-language data science project" with an example combining Python and R libraries (conda now supports R as well).

While we haven't launched the BiGCZ anaconda channel yet (we have a [placeholder repo on github](https://github.com/BiG-CZ/conda-recipes-BiG-CZ), for now), the related [ODM2 anaconda channel](https://anaconda.org/odm2) is up and running, with associated [ODM2 conda recipes github repository](https://github.com/ODM2/conda-recipes-ODM2).

### Setting up conda and BiGCZ/ODM2 environments

*(Note: this text borrows heavily from https://github.com/ioos/conda-recipes/wiki/)*

The use of [Miniconda](http://conda.pydata.org/miniconda.html) is recommended, instead of the more loaded [Anaconda distribution](https://store.continuum.io/cshop/anaconda/). Using this minimal Anaconda we can create our own environments using just the packages we need.

Follow instructions at http://conda.pydata.org/miniconda.html to install Miniconda on any OS. Here is some OS-specific information:

#### Install Miniconda on Windows
Navigate to http://conda.pydata.org/miniconda.html and download the proper installer for you Windows platform (32 or 64 bits).
We recommend to download the Python 2 version of Miniconda as not all packages are Python 3-compliant yet.  You can still create new Python 3 environments using the Python 2 verson of Miniconda, so you are not limiting yourself. 

When installing you will be asked if you wish to make the Anaconda Python your default Python for Windows.
If you do not have any other installation that is a good option.  If you want to keep multiple versions of python on your machine (e.g. ESRI-supplied python, or both 32 and 64 bit versions of Anaconda), then don't select the option to modify your path or modify your windows registry settings.

#### Install Miniconda on Linux and OSX
You may follow manual steps from http://conda.pydata.org/miniconda.html similar to the instructions on Windows (see above). Alternatively, you can execute these commands on a terminal shell (in this case, the bash shell):

```bash
url=http://repo.continuum.io/miniconda/Miniconda2-latest-Linux-x86_64.sh
curl $url -o miniconda.sh
bash miniconda.sh -b
export PATH=$HOME/miniconda2/bin:$PATH
conda update --yes --all
```

### Create and activate an ODM2 environment

Download the [environment.yml](https://raw.githubusercontent.com/ODM2/conda-recipes-ODM2/master/environment.yml) by right clicking with the mouse and choosing
`save as...`

Open a terminal window where you saved the file and type the commands to create the environment and to activate it.
```bash
conda env create environment.yml  # Will create an environment called "ODM2"
source activate ODM2  # OSX and Linux
activate ODM2  # Windows
```

The `environment.yml` file is just a text file with the environment name, what channel we want to add, and the list of the software that will be installed.

(You may have to specify the path for `activate`; e.g. for OSX `source /Users/username/miniconda2/bin/activate IOOS`)

### Exiting the ODM2 environment
To leave the ODM2 environment and return to the root conda environment, you can type
```bash
source deactivate  # OSX and Linux
deactivate  # Windows
```
Also, the environment is active only on the terminal window that initiated it. Exiting the terminal will exit the environment.
