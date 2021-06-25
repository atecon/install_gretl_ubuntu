#!/bin/bash


# ADJUST THIS PATH IF NECESSARY
cd "$HOME/git/gretl-git" || exit

echo "Pull the latest available source code"
git pull

echo "Create and switch to build directory"
mkdir build
cd build

# `.././configure --help` will show various options
.././configure \
	--enable-build-doc \
	--enable-build-addons \
	--with-odbc \
	--enable-quiet-build

make -j"$(nproc)"

sudo make pdfdocs
sudo make install

if [ "$?" -ne 0 ] ]
then
     printf "Failed to install gretl.\\n"
     exit 1
else
	sudo make install-doc
	make clean
	sudo ldconfig

	echo "Remove build directory"
	cd ..
	rm -rf ./build

	echo "################################################################"
	echo "##################  Mmhhh, you've got a freshly   ##############"
	echo "##################  compiled gretl version...	##############"
	echo "################################################################"
	exit 0
fi
