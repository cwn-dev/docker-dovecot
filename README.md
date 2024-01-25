# docker-dovecot

A simple dovecot docker image. I use this as a self-hosted IMAP server in Maildir mode (each email stored as a separate file). This means I can use isync to download emails from my provider and straight into dovecot and connect my clients (phone, laptop, etc.) into my dovecot server. No more reliance on a single provider ;)