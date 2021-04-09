
FROM jenkins/jenkins:lts
USER root
RUN yum update && \
    yum -y install ca-certificates \
    curl \
    gnupg2 && \
    curl -fsSL https://download.docker.com/linux/$(. /etc/os-release) 
RUN yum update && yum install -y python \
    && yum clean all 
RUN yum install -y docker-ce
RUN usermod -a -G docker jenkins
USER jenkins
