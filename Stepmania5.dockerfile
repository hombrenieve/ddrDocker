FROM ubuntu:xenial

RUN apt-get -y update && apt-get -y install \
    libmad0 \
    libjpeg62 \
    libva1 \
    libvorbisfile3 \
    libglu1-mesa \
    libglib2.0-0 \
    libatk1.0-0 \
    libgdk-pixbuf2.0-0 \
    libcairo2 \
    libpango-1.0-0 \
    libpangocairo-1.0-0 \
    libpangoxft-1.0-0 \
    libgtk2.0-0 \
    libasound2 \
    libjack0 \
    libpulse0 \
    libsm6 \
    wget \
    && rm -rf /usr/share/doc/* && \
    rm -rf /usr/share/info/* && \
    rm -rf /tmp/* && \
    rm -rf /var/tmp/*

RUN wget https://github.com/stepmania/stepmania/releases/download/v5.0.12/StepMania-5.0.12-Linux.tar.gz && \
    tar xvzf StepMania-5.0.12-Linux.tar.gz && mv StepMania-5.0.12-Linux/stepmania-5.0 /stepmania && \
    rm -rf StepMania-5.0.12-Linux && \
    rm StepMania-5.0.12-Linux.tar.gz

CMD /stepmania/stepmania