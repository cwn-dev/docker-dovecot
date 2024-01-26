FROM debian:bookworm-slim

ENV NAME = unset
ENV SERVER = unset
ENV EMAIL = unset
ENV PASSWORD = unset

COPY root/ /

RUN apt update && \ 
    apt install dovecot-imapd isync -y && \
    echo "ssl = no" > /etc/dovecot/conf.d/10-ssl.conf && \
    echo "log_path = /dev/stderr" >> /etc/dovecot/conf.d/10-logging.conf && \
    echo "auth_verbose = yes" >> /etc/dovecot/conf.d/10-logging.conf && \
    echo "disable_plaintext_auth = no" >> /etc/dovecot/conf.d/10-auth.conf && \
    echo "auth_mechanisms = plain" >> /etc/dovecot/conf.d/10-auth.conf && \
    rm -rf /tmp/* /var/tmp/* && \
    adduser --disabled-password --gecos "" app && \
    mkdir -p /home/app/maildir && \
    chown -R 1000:1000 /home/app && \
    find /home/app -type d -print0 | xargs -0 chmod 755

RUN sed 's/{NAME}/$NAME/g' /mbsync.conf && \
    sed 's/{SERVER}/$SERVER/g' /mbsync.conf && \
    sed 's/{EMAIL}/$EMAIL/g' /mbsync.conf && \
    sed 's/{PASSWORD}/$PASSWORD/g' /mbsync.conf && \
    mv /mbsync.conf /home/app/.mbsyncrc

EXPOSE 143

VOLUME /home/app

ENTRYPOINT ["/usr/sbin/dovecot", "-F"]
