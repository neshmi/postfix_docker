FROM ubuntu:latest

RUN apt-get update && \
    apt-get install -y postfix mailutils libsasl2-modules rsyslog

COPY postfix/entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

CMD ["/usr/local/bin/entrypoint.sh"]
