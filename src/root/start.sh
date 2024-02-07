#!/bin/bash

mkdir -p /home/app/.mail/${NAME}

chown -R 1000:1000 /home/app
find /home/app -type d -print0 | xargs -0 chmod 755

# SMTP Config
sed -i "s/{SMTP_HOST}/${SMTP_HOST}/g" /etc/dovecot/conf.d/10-submission.conf
sed -i "s/{SMTP_PORT}/${SMTP_PORT}/g" /etc/dovecot/conf.d/10-submission.conf
sed -i "s/{SMTP_USER}/${SMTP_USER}/g" /etc/dovecot/conf.d/10-submission.conf
sed -i "s/{SMTP_PASSWORD}/${SMTP_PASSWORD}/g" /etc/dovecot/conf.d/10-submission.conf

# Other Config
sed -i "s/{SMTP_PASSWORD}/${DOMAIN_NAME}/g" /etc/dovecot/conf.d/10-submission.conf

/usr/sbin/dovecot -F