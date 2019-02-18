#!/bin/sh
echo "Initializing Backup . . . "

DIRNAME="System Backup for "$(hostname)" on "$( date "+%b %d, %Y %H:%M:%S")
echo $DIRNAME

# STEP 1 RSYNC STUFF
sudo rsync -aH $HOME ./"$DIRNAME"

# STEP 2 PUSH TO GOOGLE DRIVE
drive push -hidden -no-prompt ./"$DIRNAME" 

# STEP 3 DELETE STUFF FROM FOLDER
sudo rm -r ./"$DIRNAME"

echo "Backup Finished"
