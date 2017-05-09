FROM openshift/jenkins-slave-nodejs-centos7

MAINTAINER Patrick Tescher <patrick@outtherelabs.com>

ENV PHANTOMJS_VERSION 2.1.1

USER root

RUN yum install -y fontconfig bzip2 

RUN curl https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-${PHANTOMJS_VERSION}-linux-x86_64.tar.bz2 -L -o /tmp/phantomjs-${PHANTOMJS_VERSION}-linux-x86_64.tar.bz2 &&\
    tar jxvf /tmp/phantomjs-${PHANTOMJS_VERSION}-linux-x86_64.tar.bz2 &&\
    mv phantomjs-${PHANTOMJS_VERSION}-linux-x86_64/bin/phantomjs /usr/local/bin &&\
    rm -rf phantomjs-${PHANTOMJS_VERSION}-linux-x86_64

RUN curl -L https://github.com/openshift/origin/releases/download/v1.5.0/openshift-origin-client-tools-v1.5.0-031cbe4-linux-64bit.tar.gz | \
    tar -zx && \
    mv openshift*/oc /usr/local/bin && \
    rm -rf openshift-origin-client-tools-*

USER 1001
