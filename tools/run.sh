#!/bin/bash

event1="$1"
event2="$2"

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
    --volume ${PWD}/config:/.stepmania-5.0 \
    --volume ${PWD}/cache:/stepmania/Cache \
    --volume ${PWD}/save:/stepmania/Save \
    --volume st-songs:/stepmania/Songs \
    --device $event1 \
    --device $event2 \
    --user $(id -u):$(id -g) \
    stepmania