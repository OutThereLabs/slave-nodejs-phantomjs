FROM openshift/jenkins-slave-nodejs-centos7

MAINTAINER Patrick Tescher <patrick@outtherelabs.com>

ENV PHANTOMJS_VERSION 2.1.1

USER root

RUN yum install -y fontconfig bzip2 

RUN curl https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-${PHANTOMJS_VERSION}-linux-x86_64.tar.bz2 -L -o /tmp/phantomjs-${PHANTOMJS_VERSION}-linux-x86_64.tar.bz2 &&\
    tar jxvf /tmp/phantomjs-${PHANTOMJS_VERSION}-linux-x86_64.tar.bz2 &&\
    mv phantomjs-${PHANTOMJS_VERSION}-linux-x86_64/bin/phantomjs /usr/local/bin &&\
    rm -rf phantomjs-${PHANTOMJS_VERSION}-linux-x86_64

USER 1001
