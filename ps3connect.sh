#!/bin/bash
#check for zenity and attempt to install if not found
PKG_FOUND = $(dpkg-query -W --showformat='$(Status)\n'zenity|grep "install ok installed")
echo Checking for lub: $PKG_FOUND
if ["" == PKG_FOUND]; then
  echo "couldn't find"
  gksudo apt-get --force-yes --yes install zenity
fi

#zenity *could* be used to pipe the password to sudo -A (i think),
#but storing the pword in plain text in mem might be retarded
#gksudo is a better option for gui pword	      
gksudo apt-add-repository ppa:falk-t-j/qtsixa #> /dev/null
echo "repo"
#might want to get rid of update
sudo apt-get update > /dev/null
echo "update"
sudo apt-get install sixad #> /dev/null
zenity --info --text="Connect the PS3 controller"
sudo sixpair #> /dev/null
zenity --info --text="Unplug the PS3 controller"
zenity --info --text="Press the home button!" 
 
sudo sixad --start #> /dev/null


 
