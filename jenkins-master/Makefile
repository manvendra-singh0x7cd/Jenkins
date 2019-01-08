build:
	@docker build -t myjenkins .

create-data:
	@docker volume create jenkins-data
	@docker volume create jenkins-log

run: create-data
	@docker container run -p 8081:8080 --mount source=jenkins-log,target=/var/log/jenkins/ --mount source=jenkins-data,target=/var/jenkins_home --name jenkins-master -d myjenkins


stop:
	-docker container stop jenkins-master

clean: stop
	-docker container rm jenkins-master

clean-data: clean
	-docker volume rm jenkins-log
	-docker volume rm jenkins-data


