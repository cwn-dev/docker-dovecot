FROM debian:bookworm-slim

ENV NAME = unset
ENV SERVER = unset
ENV EMAIL = unset
ENV PASSWORD = unset

RUN apt update && \ 
    apt install dovecot-imapd isync ca-certificates cron -y && \
    echo "ssl = no" > /etc/dovecot/conf.d/10-ssl.conf && \
    echo "log_path = /dev/stderr" >> /etc/dovecot/conf.d/10-logging.conf && \
    echo "auth_verbose = yes" >> /etc/dovecot/conf.d/10-logging.conf && \
    echo "disable_plaintext_auth = no" >> /etc/dovecot/conf.d/10-auth.conf && \
    echo "auth_mechanisms = plain" >> /etc/dovecot/conf.d/10-auth.conf && \
    rm -rf /tmp/* /var/tmp/* && \
    adduser --disabled-password --gecos "" app

COPY root/ /

RUN chmod +x /start.sh

EXPOSE 143

VOLUME /home/app

ENTRYPOINT [ "/start.sh" ]