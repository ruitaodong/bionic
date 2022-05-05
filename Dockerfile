FROM	ubuntu:xenial	AS	XENIAL

RUN	apt-get update && apt-get install -y libpng12-0

FROM	ubuntu:bionic

ENV	DEBIAN_FRONTEND noninteractive

COPY	--from=XENIAL /usr/lib/x86_64-linux-gnu/libpng12* /usr/local/lib/

RUN	ln -s /usr/lib/x86_64-linux-gnu/libtiff.so.5 /usr/local/lib/libtiff.so.3

RUN	apt-get update && apt-get install -y net-tools tcsh xemacs21 ispell screen git-core libjpeg62 xpdf make strace xterm x11-xserver-utils openssh-server

RUN	apt-get install -y 
RUN	mkdir -p /run/screen /run/sshd

COPY	bin/	/usr/local/bin/

ENV	LD_LIBRARY_PATH /usr/local/lib

CMD	[ "tcsh" ]
