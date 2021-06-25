#!/bin/bash

echo "Retrieve eventual updates"
sudo apt update

#echo "Upgrade installed packages"
#sudo apt upgrade -y

echo "Install required packages for compiling gretl"
sudo apt install -y \
  gcc \
  g++ \
  g++-9 \
  autoconf \
  automake \
  build-essential \
  libtool \
  libc6-dev \
  gfortran \
  gettext \
  libglib2.0-dev \
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


if [ "$?" -ne 0 ]
then
     echo "ERROR: Failed to install packages."
     exit 1
else
	echo "INFO: Succesfully installed required packages."
	echo "INFO: Proceed with compiling gretl"
	exit 0
fi

