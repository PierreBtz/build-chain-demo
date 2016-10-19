FROM jenkinsci/jenkins:2.26
MAINTAINER Pierre Beitz <PierreBtz@users.noreply.github.com>

USER root

RUN apt-get update && apt-get install -y docker.io && rm -rf /var/lib/apt/lists/*

RUN /usr/local/bin/install-plugins.sh blueocean
USER jenkins

EXPOSE 8080
