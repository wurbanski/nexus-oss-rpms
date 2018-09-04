#!/bin/bash

set -eu

function OSC {
  osc -c <($WORKDIR/osc-login.sh) "$@"
}

WORKDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
PKG_DIR=$OBS_PROJECT/$OBS_PKG

FILES="SPECS/nexus3-oss.spec SOURCES/nexus3.service OBS/_service"

OSC co $OBS_PROJECT
cp $FILES $PKG_DIR
cd $PKG_DIR
for missing in $(OSC st | grep '?' | awk '{print $2;}'); do
  OSC add $missing
done
#OSC vc -m "Updated with ${TRAVIS_COMMIT}"
OSC commit --skip-local-service -m "Updated with ${TRAVIS_COMMIT}"
