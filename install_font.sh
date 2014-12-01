#!/bin/bash
curl -fLo /tmp/DroidSansMonoForPowerlinePlusNerdFileTypes.otf \
    https://raw.githubusercontent.com/ryanoasis/vim-webdevicons/master/lib/DroidSansMonoForPowerlinePlusNerdFileTypes.otf
cd /tmp && sudo chmod 777 DroidSansMonoForPowerlinePlusNerdFileTypes.otf

if [ "$(uname)" == "Linux" ]
then
  sudo cp /tmp/DroidSansMonoForPowerlinePlusNerdFileTypes.otf /usr/share/fonts/opentype
fi

