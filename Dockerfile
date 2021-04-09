
FROM jenkins/jenkins:lts
USER root
RUN apt-get -y update && \
    install ca-certificates \
    curl \
    curl -fsSL https://download.docker.com/linux/$(. /etc/os-release) 
RUN apt-get -y update && apt-get install -y python \
    && apt-get clean 
RUN apt-get install -y docker-ce
RUN usermod -a -G docker jenkins
USER jenkins
