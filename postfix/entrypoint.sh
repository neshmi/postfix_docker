#!/bin/sh

# Start rsyslog
rsyslogd

# Ensure the mail log file exists
touch /var/log/mail.log

# Postmap the configuration files
postmap /etc/postfix/sasl_passwd
postmap /etc/postfix/sender_canonical

# Start postfix in the foreground
postfix start-fg

# Tail the mail log to keep the container running (optional)
tail -f /var/log/mail.log
