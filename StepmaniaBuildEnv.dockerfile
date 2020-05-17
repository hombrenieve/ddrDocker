FROM ubuntu:focal

RUN apt-get -y update && apt-get -y install \
    libmad0-dev \
    libjpeg62-dev \
    libva-dev \
    libglu1-mesa-dev \
    libglib2.0-dev \
    libatk1.0-dev \
    libgdk-pixbuf2.0-dev \
    libcairo2-dev \
    libpango1.0-dev \
    libgtk2.0-dev \
    libasound2-dev \
    libjack-dev \
    libpulse-dev \
    libsm-dev \
    libogg-dev \
    libvorbis-dev \
    nasm \
    yasm \
    libbz2-dev \
    libglew-dev \
    libudev-dev \
    cmake \
    git \
    && rm -rf /usr/share/doc/* && \
    rm -rf /usr/share/info/* && \
    rm -rf /tmp/* && \
    rm -rf /var/tmp/*

# RUN curl -L https://github.com/stepmania/stepmania/archive/v5.1.0-b2.tar.gz -o stepmania.tar.gz && \
#     tar xvzf stepmania.tar.gz && cd stepmania-5.1.0-b2 && \
#     cmake . && \
#     make && \
#     make install && \
#     cd .. && \
#     rm -rf stepmania*

# CMD /stepmania/stepmania