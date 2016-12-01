FROM jenkinsci/jenkins:2.30
MAINTAINER Pierre Beitz <PierreBtz@users.noreply.github.com>

USER root

RUN curl -sSL https://get.docker.com/ | sh

RUN usermod -a -G staff jenkins

RUN echo 2.31 > /usr/share/jenkins/ref/jenkins.install.UpgradeWizard.state && \
    echo 2.31 > /usr/share/jenkins/ref/jenkins.install.InstallUtil.lastExecVersion

RUN /usr/local/bin/install-plugins.sh docker-workflow blueocean

#USER jenkins

EXPOSE 8080
