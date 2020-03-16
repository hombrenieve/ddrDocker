#!/bin/bash

if [ -f /tmp/pulseaudio.client.conf ]
then
    echo "Using existing pulseaudio socket"
else
    pactl load-module module-native-protocol-unix socket=/tmp/pulseaudio.socket
    cp pulseaudio.client.conf /tmp
fi

docker run --rm --net=host -e DISPLAY=:0 \
    --env PULSE_SERVER=unix:/tmp/pulseaudio.socket \
    --env PULSE_COOKIE=/tmp/pulseaudio.cookie \
    --volume /tmp/pulseaudio.socket:/tmp/pulseaudio.socket \
    --volume /tmp/pulseaudio.client.conf:/etc/pulse/client.conf \
    --user $(id -u):$(id -g) \
    stepmania