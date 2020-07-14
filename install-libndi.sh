#!/bin/bash

set -e

BASE_DIR=$(pwd)

NDILIB_VERSION="4.5.1"
NDILIB_INSTALLER_SHA256="e0bc795d2281cfa60fcc881366ce19156164a2c7bb1b9f95a1e213f8c87c91dc"
NDILIB_INSTALLER="/tmp/libndi-install.sh"

cd /tmp
curl -kL -o $NDILIB_INSTALLER https://slepin.fr/obs-ndi/ci/libndi-linux-v$NDILIB_VERSION-install.sh -f --retry 5
echo "$NDILIB_INSTALLER_SHA256 $NDILIB_INSTALLER" | sha256sum -c
chmod +x $NDILIB_INSTALLER
yes | PAGER="cat" sh $NDILIB_INSTALLER

rm -rf /tmp/ndisdk
mv "/tmp/NDI SDK for Linux" /tmp/ndisdk
ls /tmp/ndisdk

cd $BASE_DIR
