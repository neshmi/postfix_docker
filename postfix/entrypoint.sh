#!/bin/sh

# Start rsyslog
rsyslogd

# Ensure the mail log file exists and set permissions
touch /var/log/mail.log
chmod 644 /var/log/mail.log

# Ensure the syslog file exists and set permissions
touch /var/log/syslog
chmod 644 /var/log/syslog

# Postmap the configuration files
postmap /etc/postfix/sasl_passwd
postmap /etc/postfix/sender_canonical

# Start postfix in the foreground
postfix start-fg

# Tail the mail log to keep the container running
tail -f /var/log/mail.log
