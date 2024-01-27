#!/bin/bash

mkdir -p /home/app/.mail/runbox

chown -R 1000:1000 /home/app
find /home/app -type d -print0 | xargs -0 chmod 755

sed -i "s/{NAME}/${NAME}/g" /mbsync.conf
sed -i "s/{SERVER}/${SERVER}/g" /mbsync.conf
sed -i "s/{EMAIL}/${EMAIL}/g" /mbsync.conf
sed -i "s/{PASSWORD}/${PASSWORD}/g" /mbsync.conf
sed -i "s/{NAME}/${NAME}/g" /etc/cron.d/isync

/usr/sbin/dovecot -F