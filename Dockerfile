FROM alpine:3.5

LABEL MAINTAINER Cristòfol Torrens Morell "piffall@gmail.com"

# Install required packages
RUN \
    apk update && \
    apk add openjdk8 wget bash tar gzip

WORKDIR /opt

# Install SBT
ENV SBT_VERSION 0.13.15
ENV SBT_HOME /opt/sbt
RUN \
    mkdir -p /opt && \
    wget https://github.com/sbt/sbt/releases/download/v${SBT_VERSION}/sbt-${SBT_VERSION}.tgz && \
    tar -zvxf sbt-${SBT_VERSION}.tgz -C /opt && \
    rm sbt-${SBT_VERSION}.tgz

# Add sbt bin path to PATH
ENV PATH $PATH:${SBT_HOME}/bin

# Install Zeppelin
ENV ZEPPELIN_VERSION 0.7.1
ENV ZEPPELIN_HOME /usr/zeppelin-${ZEPPELIN_VERSION}
RUN \
    mkdir ${ZEPPELIN_HOME} && \
    wget http://apache.uvigo.es/zeppelin/zeppelin-${ZEPPELIN_VERSION}/zeppelin-${ZEPPELIN_VERSION}-bin-all.tgz && \
    tar vxzf zeppelin-${ZEPPELIN_VERSION}-bin-all.tgz --strip 1 -C ${ZEPPELIN_HOME} && \
    rm zeppelin-${ZEPPELIN_VERSION}-bin-all.tgz

# Add zeppelin bin path to PATH
ENV PATH $PATH:${ZEPPELIN_HOME}/bin

# Set Java HOME
ENV JAVA_HOME /usr/lib/jvm/java-1.8-openjdk

