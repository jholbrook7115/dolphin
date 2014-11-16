#!/bin/bash
#check for zenity and attempt to install if not found
#this will try to find the package and store the result of a grep on the return
#using keywords. if it can't be found the string will be empty and the module 
#attempted to be installed
checked = 0;
if [ $(dpkg-query -W -f='${Status}' zenity 2>/dev/null | grep -c "ok installed") -eq 0 ]; then
 gksudo apt-get install zenity > /dev/null
 checked = 1;
fi

#zenity *could* be used to pipe the password to sudo -A (i think),
#but storing the pword in plain text in mem might be retarded
#gksudo is a better option for gui pword and is ALMOST always
#installed by default	      
if [ $checked -eq 0]; then
  gksudo apt-add-repository ppa:falk-t-j/qtsixa > /dev/null #no one wants to see all that
else
  sudo apt-add-repository ppa:falk-t-j/qtsixa > /dev/null
fi
#update repos
sudo apt-get update > /dev/null
echo "update"
sudo apt-get install sixad > /dev/null
zenity --info --text="Connect the PS3 controller"
sudo sixpair #> /dev/null
zenity --info --text="Unplug the PS3 controller"
zenity --info --text="Press the home button!" 
 
sudo sixad --start #> /dev/null


 
