# How-to install and compile gretl on Ubuntu
This repository includes:

1. [a script installing all necessary packages for compiling gretl on an Ubuntu machine (tested on Ubuntu 20.04)](https://raw.githubusercontent.com/atecon/install_gretl_ubuntu/main/scripts/install_packages.sh), and
3. [a script for the actual compilation and installation of gretl](https://raw.githubusercontent.com/atecon/install_gretl_ubuntu/main/scripts/install_packages.sh).

While the official gretl manual includes a chapter on how to compile gretl, the list of required packages is either outdated or does not work on recent Ubuntu versions.


# Steps

## Clone the gretl git repository.
Switch via the `cd` command to some folder where you manage git repos. For the following, I assume the directory is `$HOME/git`.

Clone the offocial gretl repository:
```bash
cd $HOME/git
git clone git://git.code.sf.net/p/gretl/git gretl-git
```

The last command will download the source code and put it to the directory `$HOME/git/grelt-git`.

## Install all necessary packages
### 'Manual' way
Execute the following command in your terminal:
```bash
sudo apt install -y \
  gcc \
  g++ \
  g++-9 \
  autoconf \
  automake \
  cmake \
  build-essential \
  libtool \
  flex \
  bison \
  gcc-doc \
  libc6-dev \
  gfortran \
  gettext \
  libglib2.0-dev \
  libgtk3-perl \
  libgfs-dev \
  libpng-dev \
  libxslt1-dev \
  liblapack-dev \
  libfftw3-dev \
  libreadline-dev \
  zlib1g-dev \
  libbz2-dev \
  libxml2-dev \
  libgmp-dev \
  libcurl4-gnutls-dev \
  libmpfr-dev \
  git \
  gnuplot \
  imagemagick \
  libjson-glib-1.0-0 \
  libjson-glib-dev \
  openmpi-bin \
  openmpi-common \
  nano \
  ca-certificates \
  libgtk-3-dev \
  libgtksourceview-3.0-dev \
  libgsf-1-dev \
  texlive-latex-extra
```

### Use the shell script
Assuming, you know how to use shell scripts, [simply execute this one.](https://raw.githubusercontent.com/atecon/install_gretl_ubuntu/main/scripts/install_packages.sh)

## Compile and install gretl
The next step is to compile and install gretl. 

### 'By hand'
Make sure you are in the directory `$HOME/git/gretl-git` and execute the following steps:

```bash
git pull       # only necessary if you want to latest state

mkdir build    # create a build directory
cd build       # switch to the directory

# Configure
.././configure \
	--enable-build-doc \
	--enable-build-addons \
	--enable-quiet-build

# Compile
make -j"$(nproc)"     # This will make use of all available CPU cores
sudo make pdfdocs     # Compile the PDF manual(s)

sudo make install     # Install gretl
sudo make install-doc # Install the documentation

make clean
sudo ldconfig

# Remove build directory
cd ..
rm -rf ./build
```

### By means of a shell-script
Alternatively, [execute this shell script](https://raw.githubusercontent.com/atecon/install_gretl_ubuntu/main/scripts/install_packages.sh).

## Check
To make sure you've installed gretl properly, open it or check for the installed version by:
```bash
gretlcli --version
```

Also make sure that the documentation works
```bash
gretlcli
help ols   # Should show the help for the OLS command
```


That's it ;-)
