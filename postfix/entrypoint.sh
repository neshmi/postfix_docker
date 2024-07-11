#!/bin/sh

# Start rsyslog
rsyslogd

# Start postfix
postfix start

# Tail the mail log to keep the container running
tail -f /var/log/mail.log
