FROM python:3.6.1

COPY docker/ /

ENV SERVERLESS_VERSION=1.15.3

RUN curl -sL https://deb.nodesource.com/setup_8.x | bash \
 && apt-get update -qq \
 && apt-get install -y --no-install-recommends \
    nodejs \
 && npm install -g \
    serverless@${SERVERLESS_VERSION} \
 && pip install \
    boto3 \
 && apt-get clean autoclean \
 && apt-get autoremove --yes \
 && rm -rf /var/lib/{apt,dpkg,cache,log}/

WORKDIR /root/serverless