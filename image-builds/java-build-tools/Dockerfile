FROM fedora:35

MAINTAINER Uchechukwu Onyekwuluje <uionyekwuluje@gmail.com>

ENV JAVA_VERSION=18
ENV MAVEN_VERSION=3.8.5

RUN dnf update -y && dnf upgrade -y
RUN dnf install -y unzip wget p7zip p7zip-plugins kernel-headers kernel-devel 
RUN dnf groupinstall -y "Development Tools"

RUN mkdir /opt/jdk-${JAVA_VERSION} && \
    wget https://download.oracle.com/java/${JAVA_VERSION}/latest/jdk-${JAVA_VERSION}_linux-x64_bin.tar.gz && \
    tar -zxvf jdk-${JAVA_VERSION}_linux-x64_bin.tar.gz -C /opt/jdk-${JAVA_VERSION} --strip-components=1 && \
    rm jdk-${JAVA_VERSION}_linux-x64_bin.tar.gz

RUN mkdir /opt/apache-maven && \
    wget https://dlcdn.apache.org/maven/maven-3/${MAVEN_VERSION}/binaries/apache-maven-${MAVEN_VERSION}-bin.tar.gz && \
    tar -zxvf apache-maven-${MAVEN_VERSION}-bin.tar.gz -C /opt/apache-maven --strip-components=1 && \
    rm apache-maven-${MAVEN_VERSION}-bin.tar.gz

ENV JAVA_HOME=/opt/jdk-18
ENV MAVEN_HOME=/opt/apache-maven
ENV PATH $PATH:$JAVA_HOME/bin:$PATH
ENV PATH $PATH:$MAVEN_HOME/bin:$PATH

CMD [""]
