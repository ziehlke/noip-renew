#!/bin/sh

USER=$(whoami)
SUDO=sudo
LOGDIR=/var/log/noip-renew/$USER
INSTDIR=/usr/local/bin
INSTEXE=$INSTDIR/noip-renew-$USER
CRONJOB="30 8    * * *   $USER    $INSTEXE $LOGDIR"
NEWCJOB="30 8    $1 $2 *   $USER    $INSTEXE $LOGDIR"

$SUDO sed -i '/noip-renew/d' /etc/crontab

if [ $3 = "True" ]; then
    echo "$NEWCJOB" | $SUDO tee -a /etc/crontab
else
    echo "$CRONJOB" | $SUDO tee -a /etc/crontab
fi

exit 0
