FROM jenkins/jenkins:lts
LABEL maintainer="manvendra.singh@sourcefuse.com"

USER root
RUN mkdir /var/log/jenkins
RUN mkdir /var/cache/jenkins
RUN chown -R jenkins:jenkins /var/log/jenkins
RUN chown -R jenkins:jenkins /var/cache/jenkins
USER jenkins

COPY plugins.txt /tmp/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /tmp/plugins.txt


ENV JAVA_OPTS="-Xmx3072m"
ENV JENKINS_OPTS=" --handlerCountMax=300 --logfile=/var/log/jenkins/jenkins.log --webroot=/var/cache/jenkins/war -Djenkins.install.runSetupWizard=false"

