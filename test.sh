#!/bin/bash

if [$(dpkg-query -W -f='${Status}' zenity 2>/dev/null | grep -c "ok installed") -eq 0];
then echo "it's gone"
fi
