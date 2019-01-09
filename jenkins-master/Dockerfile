FROM jenkins/jenkins:2.157
LABEL maintainer="manvendra.singh@sourcefuse.com"


ARG docker_group_id=999
ARG docker_group_name=docker

USER root
RUN mkdir /var/log/jenkins
RUN mkdir /var/cache/jenkins
RUN chown -R jenkins:jenkins /var/log/jenkins
RUN chown -R jenkins:jenkins /var/cache/jenkins
RUN wget --quiet https://download.docker.com/linux/static/stable/x86_64/docker-18.09.0.tgz \
    && tar -xzf ./docker-18.09.0.tgz \
    && mv docker/docker /usr/bin/docker \
    && chmod +x /usr/bin/docker

RUN groupadd -g ${docker_group_id} ${docker_group_name} \
    && usermod -aG docker jenkins
USER jenkins

COPY plugins.txt /tmp/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /tmp/plugins.txt


ENV JAVA_OPTS="-Xmx3072m"
ENV JENKINS_OPTS=" --handlerCountMax=300 --logfile=/var/log/jenkins/jenkins.log --webroot=/var/cache/jenkins/war -Djenkins.install.runSetupWizard=false"

