# docker-dovecot

A simple dovecot docker image. I use this as a self-hosted IMAP server in Maildir mode (each email stored as a separate file). This means I can use isync to download emails from my provider and straight into dovecot and connect my clients (phone, laptop, etc.) into my dovecot server. No more reliance on a single provider as I can simply change where isync points and everything will continue to work! ;)

# How to Run

The [docker-compose.yml](docker-compose.yml) should run with no changes, in theory. Once the container is running, you will need to run the following commands to create your dovecot user

### Create a dovecot account

```sh
$ MAIL_PASSWORD=`doveadm pw -s BLF-CRYPT  -p somepassword`
$ echo "app:$MAIL_PASSWORD:1000:1000::/home/app::" > /etc/dovecot/users
```

### Take Ownership of the /home Folder

I will fix this at some point as it shouldn't be necessary, but it was a quick fix at the time.

```
chown -R app:app /home/app
```