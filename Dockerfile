
FROM jenkins/jenkins:lts
USER root
RUN yum update && \
yum -y install apt-transport-https \
    ca-certificates \
    curl \
    gnupg2 \
    software-properties-common && \
curl -fsSL https://download.docker.com/linux/$(. /etc/os-release) 
RUN yum update && apt-get install --no-install-recommends -y python \
 && yum clean all 
RUN yum install -y docker-ce
RUN usermod -a -G docker jenkins
USER jenkins
