FROM debian:jessie

ENV USR dev

RUN apt-get update && \
      apt-get -y install sudo

RUN useradd -ms /bin/bash ${USR} && passwd -d ${USR} && usermod ${USR} -G sudo

ENV WD /home/${USR}
WORKDIR ${WD}
USER ${USR}

RUN sudo apt-get -qq update && sudo apt-get -y install \
	git-core \
	build-essential \
	libssl-dev \
	libncurses5-dev \
	unzip \
	gawk \
	zlib1g-dev \
	vim \
	python \
	wget \
	subversion \
	gettext \
	groff \
	mercurial

COPY . ${WD}

RUN sudo chown -R ${USR}:${USR} ${WD}

RUN ./scripts/feeds update -a
RUN ./scripts/feeds install -a

RUN cp ${WD}/configfiles/basic_yun ${WD}/.config
RUN sudo ln -s /lib/terminfo/ /usr/share/terminfo

RUN make tools/install V=99 && make toolchain/install V=99
#RUN make V=s -j9
RUN make V=s
