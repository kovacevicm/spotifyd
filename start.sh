#!/usr/bin/env bash

sudo docker run -d \
	--net host \
	--group-add $(getent group audio | cut -d: -f3) \
	--device /dev/snd:/dev/snd \
	-v /usr/share/alsa:/usr/share/alsa \
	-v $PWD/spotifyd.conf:/etc/spotifyd.conf \
	--name spotifyd \
	--restart unless-stopped \
	spotifyd:local
