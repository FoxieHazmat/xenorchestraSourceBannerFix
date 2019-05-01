#!/bin/bash

##FOXIEHAZMAT##
##Version: 0.1
##XOA Compatiblility: v5.34.0

####### SUDO IS REQUIRED #######

#stop xo-server
systemctl stop xo-server

#find xo-web install path
cd $(find / -wholename */xen-orchestra/packages/xo-web)

#backup index file
cp src/xo-app/index.js src/xo-app/index.js.bak

#remove no-no lines
sed -i '225,235 d' src/xo-app/index.js

#recompile xo-web
yarn build

#start xo-server
systemctl start xo-server