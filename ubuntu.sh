#!/bin/bash

export DEBIAN_FRONTEND=noninteractive
sed -i "/^# deb .* multiverse$/ s/^# //" /etc/apt/sources.list
ln -fs /usr/share/zoneinfo/America/New_York /etc/localtime
apt-get update
apt-get install -y nginx
rm -rf /var/lib/apt/lists/*
