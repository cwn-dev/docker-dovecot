#!/bin/bash

mkdir -p /home/app/.mail/${NAME}

chown -R 1000:1000 /home/app
find /home/app -type d -print0 | xargs -0 chmod 755

/usr/sbin/dovecot -F