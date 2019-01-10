FROM jenkins/jenkins:2.157
LABEL maintainer="manvendra.singh@sourcefuse.com"

ARG jenkins_version="2.157"
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

RUN curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip" \
    && unzip awscli-bundle.zip \
    && ./awscli-bundle/install -i /usr/bin/aws -b /usr/local/bin/aws


RUN groupadd -g ${docker_group_id} ${docker_group_name} \
    && usermod -aG docker jenkins
USER jenkins

COPY plugins.txt /tmp/plugins.txt
COPY groovy/* $JENKINS_HOME/init.groovy.d/
RUN echo ${jenkins_version} > /usr/share/jenkins/ref/jenkins.install.UpgradeWizard.state  \
    && echo ${jenkins_version} > /usr/share/jenkins/ref/jenkins.install.InstallUtil.lastExecVersion
RUN /usr/local/bin/install-plugins.sh < /tmp/plugins.txt


#ENV JAVA_OPTS="-Xmx3072m"
ENV JENKINS_OPTS=" --logfile=/var/log/jenkins/jenkins.log --webroot=/var/cache/jenkins/war -Djenkins.install.runSetupWizard=false"
COPY jenkins.sh /usr/local/bin/jenkins.sh
ENTRYPOINT ["/sbin/tini", "--", "/usr/local/bin/jenkins.sh"]

