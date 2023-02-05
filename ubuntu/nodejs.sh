#!/bin/bash

sudo apt-get install nodejs npm
sudo npm install n -g

sudo n lts

sudo apt-get purge nodejs npm

N_PREFIX=${HOME}/.local/lib/n
install -d $(dirname ${N_PREFIX})

n lts

SHELL_RC=${HOME}/.bashrc
if [ -f "${HOME}/.zshrc" ];
  SHELL_RC=${HOME}/.zshrc
then

echo '
########################
# n (node js)
########################
export N_PREFIX="${HOME}/.local/lib/n"
export PATH="${N_PREFIX}/bin:${PATH}"' >> ${SHELL_RC}
