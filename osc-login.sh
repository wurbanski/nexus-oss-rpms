#!/bin/bash

set -eu

echo "[general]
apiurl = https://api.opensuse.org

[https://api.opensuse.org]
user = $OBS_USER
pass = $OBS_PASS"
