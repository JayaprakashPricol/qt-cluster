#!/bin/bash
source /opt/poky/qt5/environment-setup-cortexa9hf-vfp-neon-poky-linux-gnueabi
make distclean
qmake
make -j8
arm-poky-linux-gnueabi-strip QT_demo_App
sync
