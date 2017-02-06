
### What is Conda?
Similar to [pip](https://pypi.python.org/pypi/pip), [**conda**](http://conda.pydata.org/docs/) is an **open source package and environment management system** for installing multiple versions of software packages, their dependencies and switching easily between them. While it originally was developed to support Python, it now supports multiple languages. It works on Linux, OS X and Windows. This [Aug. 2016 blog post](https://jakevdp.github.io/blog/2016/08/25/conda-myths-and-misconceptions/) from Jake Vanderplas provides nice clarifications about conda and where it fits in the ecosystem of Python packaging and environments. See also [this Continuum Analytics blog post for a great, comprehensive introduction to conda](http://www.continuum.io/blog/conda-data-science) targeted to data scientists; it also has links to a presentation (Youtube and slides) on the same material.

For additional help you can consult the [UW GeoHack conda introduction](https://geohackweek.github.io/Introductory/00-conda-tutorial/).

### Anaconda or Miniconda
[Anaconda](https://www.continuum.io/why-anaconda) is a data science platform that comes with a lot of packages. At the core, Anaconda uses the conda package management system. A list of packages included can be found [*here*](https://docs.continuum.io/anaconda/pkg-docs). If you don't have time or disk space -- or the inclination -- to install the entire distribution, try [Miniconda](http://conda.pydata.org/miniconda.html), a bootstrap version of Anaconda, which contains only Python, essential packages, and conda. Other packages have to be installed individually.

**NOTE: We will be using Python 2.7 for this geopandas workshop.**

### Installing Anaconda

1. To install Anaconda, please click on the link below for your operating system, and follow the instructions on the site:
  **NOTE: FOR Windows and OSX Graphical installation, make sure to do a custom install and uncheck the box `modify PATH`**
  
  ![OSX Custom Install](https://docs.continuum.io/_images/pathoption.png)
  
  - [Windows](https://docs.continuum.io/anaconda/install#anaconda-for-windows-install)
  - [OSX](https://docs.continuum.io/anaconda/install#anaconda-for-os-x-graphical-install)
  - Linux: see below
  
  ```bash
  url=https://repo.continuum.io/archive/Anaconda2-4.2.0-Linux-x86_64.sh
  curl $url -o anaconda.sh
  bash anaconda.sh -b
  export PATH=$HOME/anaconda2/bin:$PATH
  conda update --yes --all
  ```
2. Once Anaconda installation step is finished run `python` in the command line to test if Anaconda is installed correctly. **Note: For windows, please use Windows powershell as the command line. It should be preinstalled, if not click [here](https://msdn.microsoft.com/en-us/powershell/scripting/setup/installing-windows-powershell).**
If Anaconda is installed correctly, you should have this prompt, which emphasizes **Anaconda**:

```bash
$ python
Python 2.7.11 |Anaconda custom (x86_64)| (default, Dec  6 2015, 18:57:58)
[GCC 4.2.1 (Apple Inc. build 5577)] on darwin
Type "help", "copyright", "credits" or "license" for more information.
Anaconda is brought to you by Continuum Analytics.
Please check out: http://continuum.io/thanks and https://anaconda.org
>>>
```

### Installing Miniconda

#### Windows
Navigate to http://conda.pydata.org/miniconda.html and download the proper installer for you Windows platform (32 or 64 bits).
We recommend to download the Python 2 version of Miniconda as not all packages are Python 3-compliant yet.  You can still create new Python 3 environments using the Python 2 verson of Miniconda, so you are not limiting yourself.

When installing you will be asked if you wish to make the Anaconda Python your default Python for Windows.
If you do not have any other installation that may be a good option.  If you want to keep multiple versions of python on your machine (e.g. ESRI-supplied python, or both 32 and 64 bit versions of Anaconda), then don't select the option to modify your path or modify your Windows registry settings.

#### Linux and OSX
You may follow manual steps from http://conda.pydata.org/miniconda.html similar to the instructions on Windows (see above). Alternatively, you can execute these commands on a terminal shell (in this case, the bash shell):

```bash
url=https://repo.continuum.io/miniconda/Miniconda2-latest-Linux-x86_64.sh  # On MacOSX, replace Linux with MacOSX
curl $url -o miniconda.sh
bash miniconda.sh -b
export PATH=$HOME/miniconda2/bin:$PATH
conda update --yes --all
```

### Creating the `geopandasenv` conda environment

Download the `environment.yml` file by going to [this link](https://raw.githubusercontent.com/BiG-CZ/BiG-CZ-Toolbox/master/geopandas/environment.yml), right clicking with the mouse and choosing `Save as...`

Open a terminal window where you saved the file and type the commands to create the environment and "activate" it.
```bash
conda env create environment.yml  # Will create an environment called "geopandasenv"
source activate geopandasenv  # OSX and Linux
activate geopandasenv  # Windows
```

The `geopandasenv` conda environment includes `geopandas` and its dependencies, which include (for vector-handling packages) `shapely`, `fiona`, `pyproj`, `descartes` and `pysal`, in addition to `pandas` and `numpy`. These will be handled automatically by the conda environment. Additional conda packages available in the environment include `pyepsg`, `geojson`, `folium` (for interactive maps in Jupyter notebooks), `rasterstats` (for simplified raster-vector analysis), `requests`, and `psycopg2` for access to vector data stored in PostGIS (though this `Maptime` workshop will not include PostGIS).

### Starting Jupyter notebooks

On Windows and MacOSX you may have a conda GUI application already installed, specially if you installed Anaconda. That application should let you select the `geopandasenv` environment, then launch Jupyter notebook with that environment.

Otherwise, on the command shell, you can launch Jupyter notebooks (after activating the environment) like this:
```bash
jupyter notebook
```

### Removing and recreating the `geopandasenv` conda environment

To delete the conda environment, first "deactivate" it if you've activated it in your shell session:
```bash
source deactivate  # OSX and Linux
deactivate  # Windows
```

Then remove the environment:
```bash
conda env remove -n geopandasenv
```

You can create it again, from scratch, using the command described earlier.
