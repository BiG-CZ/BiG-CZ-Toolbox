
### What is Conda?
Similar to [pip](https://pypi.python.org/pypi/pip), [**conda**](http://conda.pydata.org/docs/) is an **open source package and environment management system** for installing multiple versions of software packages, their dependencies and switching easily between them. It works on Linux, OS X and Windows.

### What is Anaconda?
[Anaconda](https://www.continuum.io/why-anaconda) is a data science platform that comes with a lot of packages. At the core, Anaconda uses conda package management system.

- List of packages included can be found [*here*](https://docs.continuum.io/anaconda/pkg-docs)

- If you don't have time or disk space for the entire distribution, try [Miniconda](http://conda.pydata.org/miniconda.html), a bootstrap version of Anaconda, which contains only Python, essential packages, and conda. The rest of the packages has to be installed individually.

- [This Continuum blog post is a terrific, recent and comprehensive introduction to conda](http://www.continuum.io/blog/conda-data-science) targeted to data scientists. It also has links to a presentation (Youtube and slides) on the same material. An extra nifty aspect of this material is that it "explores how to use conda in a multi-language data science project" with an example combining Python and R libraries.

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

##### Windows
Navigate to http://conda.pydata.org/miniconda.html and download the proper installer for you Windows platform (32 or 64 bits).
We recommend to download the Python 2 version of Miniconda as not all packages are Python 3-compliant yet.  You can still create new Python 3 environments using the Python 2 verson of Miniconda, so you are not limiting yourself.

When installing you will be asked if you wish to make the Anaconda Python your default Python for Windows.
If you do not have any other installation that is a good option.  If you want to keep multiple versions of python on your machine (e.g. ESRI-supplied python, or both 32 and 64 bit versions of Anaconda), then don't select the option to modify your path or modify your windows registry settings.

##### Linux and OSX
You may follow manual steps from http://conda.pydata.org/miniconda.html similar to the instructions on Windows (see above). Alternatively, you can execute these commands on a terminal shell (in this case, the bash shell):

```bash
url=https://repo.continuum.io/miniconda/Miniconda2-4.2.12-Linux-x86_64.sh
curl $url -o miniconda.sh
bash miniconda.sh -b
export PATH=$HOME/miniconda2/bin:$PATH
conda update --yes --all
```
