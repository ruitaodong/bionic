FROM	ubuntu:xenial	AS	XENIAL

RUN	apt-get update && apt-get install -y libpng12-0

FROM	ubuntu:bionic

ENV	DEBIAN_FRONTEND noninteractive

COPY	--from=XENIAL /usr/lib/x86_64-linux-gnu/libpng12* /usr/local/lib/

RUN	apt-get update && apt-get install -y strace xpdf net-tools tcsh xemacs21 screen git-core python3 libjpeg62 make

RUN	apt-get install -y xterm x11-xserver-utils x11vnc xtightvncviewer xvfb

RUN	apt-get install -y libglu1-mesa mesa-utils libgl1-mesa-dri libgl1-mesa-glx 

ADD 	https://netactuate.dl.sourceforge.net/project/virtualgl/2.6.5/virtualgl_2.6.5_amd64.deb /tmp
RUN	dpkg -i /tmp/virtualgl_2.6.5_amd64.deb && rm -f /tmp/virtualgl_2.6.5_amd64.deb

COPY	bin/	/usr/local/bin/

RUN	ln -s 	x86_64-linux-gnu/libtiff.so.5 /usr/local/lib/libtiff.so.3

CMD	[ "tcsh" ]
