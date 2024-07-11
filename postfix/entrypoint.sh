#!/bin/sh

# Start rsyslog
rsyslogd

# Postmap the configuration files
postmap /etc/postfix/sasl_passwd
postmap /etc/postfix/sender_canonical

# Start postfix
postfix start

# Tail the mail log to keep the container running
tail -f /var/log/mail.log
