FROM jenkinsci/jenkins:2.26
MAINTAINER Pierre Beitz <PierreBtz@users.noreply.github.com>

USER root

RUN apt-get update && apt-get install -y docker.io && rm -rf /var/lib/apt/lists/*

RUN usermod -a -G docker jenkins

RUN /usr/local/bin/install-plugins.sh blueocean

#we should get back to user jenkins but I have an issue with this for the moment:
# dial unix /var/run/docker/sock: permission denied. (despite the usermod line before).
USER jenkins

EXPOSE 8080
