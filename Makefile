build-image:
	@docker build --build-arg uid=500 --build-arg gid=500 --build-arg docker_group_id=497 -t jenkins-master  jenkins-master/.
up:	push-image
	cd terraform && terraform init && terraform apply
push-image: build-image
	@docker image tag jenkins-master:latest 046078814158.dkr.ecr.us-east-1.amazonaws.com/jenkins-master:2 && docker image push 046078814158.dkr.ecr.us-east-1.amazonaws.com/jenkins-master:2
down: 
	cd terraform && terraform init && terraform destroy

