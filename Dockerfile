
FROM jenkins/jenkins:lts
USER root
RUN apt update && \
    apt install ca-certificates \
    curl \
    gnupg2 && \
    curl -fsSL https://download.docker.com/linux/$(. /etc/os-release) 
RUN apt update && yum install -y python \
    && apt clean 
RUN apt install -y docker-ce
RUN usermod -a -G docker jenkins
USER jenkins
