#!/bin/bash

readonly ARCH=$(dpkg --print-architecture)
readonly SRCLISTS=/etc/apt/sources.list.d
readonly KEYRINGS=/etc/apt/keyrings

sudo mkdir -p ${KEYRINGS}

sudo curl -fsSL https://repo.charm.sh/apt/gpg.key -o ${KEYRINGS}/charm.asc
echo "deb [arch=${ARCH} signed-by=${KEYRINGS}/charm.asc] https://repo.charm.sh/apt/ * *" | sudo tee ${SRCLISTS}/charm.list

sudo apt-get update
sudo apt-get install -y glow
