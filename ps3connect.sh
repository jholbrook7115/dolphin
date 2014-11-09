 #!/bin/bash
 sudo apt-add-repository ppa:falk-t-j/qtsixa #> /dev/null
 echo "repo"
 #might want to get rid of update
 sudo apt-get update #> /dev/null
 echo "update"
 sudo apt-get install sixad #> /dev/null
 zenity --info --text="Connect the PS3 controller"
 sudo sixpair #> /dev/null
 zenity --info --text="Unplug the PS3 controller"
 zenity --info --text="Press the home button!" 
 
 sudo sixad --start #> /dev/null


 