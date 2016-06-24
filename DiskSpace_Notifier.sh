#!/bin/sh


# Laeeq H - April 2016
# Designed to run periodically (Weekly)
# Place in /usr/local/etc/scripts/ and run as periodic


# Actions - Check Disk Size # Add if condition # if less than assigned then # execute bigboldtext

# set variable
leftover=$(df -h /Volumes/MacHD | sed -n 2p | awk '{print $4}' | sed 's/\(.*\)../\1/')
CD="/usr/local/HMUtils/CocoaDialog.app/Contents/MacOS/CocoaDialog"
BHT="/usr/local/HMUtils/BigHonkingText"
consoleuser=`ls -l /dev/console | cut -d " " -f4`
# Show a notification here with OK button via Finder
# add it in Daily Periodic Job


# First Release so holding on BIGTexts
#if [[ ${leftover} -lt 5 ]]; then

#sudo -u "${consoleuser}" /usr/local/HMUtils/BigHonkingText "Less than 5GB of space is left on this Mac" -w 92% -h 10% -p 5

#elif [[ leftover -lt 10 ]]; then


if [[ leftover -lt 12 ]]; then

rv=`$CD ok-msgbox --no-cancel --text "Low Disk Space Alert" \
--informative-text "Your Mac $hostname is running on low disk - only $leftover GB is free. It's recommended to keep more than 15GB free. For assistance, please call Helpdesk at 1105" \
--no-newline --float`

fi

exit 0