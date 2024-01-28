FROM debian:bookworm-slim

ENV SMTP_HOST = unset
ENV SMTP_PORT = unset
ENV SMTP_USER = unset
ENV SMTP_PASSWORD = unset

RUN apt update && \ 
    apt install dovecot-imapd dovecot-submissiond ca-certificates -y && \
    echo "ssl = no" > /etc/dovecot/conf.d/10-ssl.conf && \
    echo "log_path = /dev/stderr" >> /etc/dovecot/conf.d/10-logging.conf && \
    echo "auth_verbose = yes" >> /etc/dovecot/conf.d/10-logging.conf && \
    echo "disable_plaintext_auth = no" >> /etc/dovecot/conf.d/10-auth.conf && \
    echo "auth_mechanisms = plain" >> /etc/dovecot/conf.d/10-auth.conf && \
    echo "maildir_very_dirty_syncs = yes" >> /etc/dovecot/conf.d/10-mail.conf && \
    rm -rf /tmp/* /var/tmp/* && \
    adduser --disabled-password --gecos "" app && \
    MAIL_PASSWORD=`doveadm pw -s BLF-CRYPT  -p dovecot` && \
    echo "app:$MAIL_PASSWORD:1000:1000::/home/app" > /etc/dovecot/users

COPY root/ /

RUN chmod +x /start.sh

EXPOSE 143 25

VOLUME /home/app/mail/maildir

ENTRYPOINT [ "/start.sh" ]