FROM	ubuntu:xenial	AS	XENIAL

RUN	apt-get update && apt-get install -y libpng12-0

FROM	ubuntu:bionic

ENV	DEBIAN_FRONTEND noninteractive

COPY	--from=XENIAL /usr/lib/x86_64-linux-gnu/libpng12* /usr/local/lib/

RUN	ln -s /usr/lib/x86_64-linux-gnu/libtiff.so.5 /usr/local/lib/libtiff.so.3

RUN	apt-get update && apt-get install -y net-tools tcsh xemacs21 ispell screen git-core libjpeg62 xpdf make strace 

RUN	apt-get install -y xterm x11-xserver-utils x11vnc xtightvncviewer xvfb

RUN	apt-get install -y libglu1-mesa mesa-utils libgl1-mesa-dri libgl1-mesa-glx 

RUN	apt-get install -y qgis python-qgis python3-rasterio gdal-bin python3-fiona\
	libtiff-tools python3-openslide hdf5-tools python3-h5py

COPY	bin/	/usr/local/bin/

ENV	LD_LIBRARY_PATH /usr/local/lib

CMD	[ "tcsh" ]
