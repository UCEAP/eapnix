#!/usr/bin/env bash

set -oue pipefail

mkdir -p /usr/local/bin
cd /usr/local/bin
curl -L https://github.com/pantheon-systems/terminus/releases/download/4.0.1/terminus.phar --output terminus
chmod +x terminus
./terminus self:update
