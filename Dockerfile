FROM ubuntu:latest

RUN apt-get update && \
    apt-get install -y postfix mailutils libsasl2-modules

# COPY postfix/main.cf /etc/postfix/main.cf

CMD ["postfix", "start-fg"]
