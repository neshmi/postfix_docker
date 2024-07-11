#!/bin/sh

# Ensure necessary directories exist and set permissions
mkdir -p /var/spool/rsyslog
mkdir -p /var/spool/postfix/dev
mkdir -p /var/log

touch /var/log/mail.log
touch /var/log/syslog

chmod 755 /var/spool/rsyslog
chmod 755 /var/spool/postfix
chmod 644 /var/log/mail.log
chmod 644 /var/log/syslog

# Create /dev/log for rsyslog
if [ ! -e /var/spool/postfix/dev/log ]; then
  ln -sf /dev/log /var/spool/postfix/dev/log
fi

# Start rsyslog
rsyslogd

# Postmap the configuration files
postmap /etc/postfix/sasl_passwd
postmap /etc/postfix/sender_canonical

# Start postfix in the foreground
postfix start-fg

# Tail the mail log to keep the container running
tail -f /var/log/mail.log
