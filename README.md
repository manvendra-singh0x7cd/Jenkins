## Prerequsite ##
- Install Docker (https://docs.docker.com/install/linux/docker-ce/ubuntu/)

- Install Terraform (https://learn.hashicorp.com/terraform/getting-started/install.html)

- Insall Make utility ( `apt-get install build-essential`)

- Make sure you have valid permissions to run the stack , if running from local then setup aws cli also (https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-install.html#install-tool-bundled)


### Steps to rollout infra ###

1. Run `make up` to roll out the infra
2. Wait for the Infra to be completely roll out
3. Get the Cname for DNS from the script output section.
4. Use the given cname to login to the Jenkins console
5. Jenkins username and password can be retrived from terraform/container-defination.json file, with the  JENKINS_USER and JENKINS_PASS env variable.

6. Destroy the Infra by running make down ( note this can cause dataloss for the jenkins)


### Parameters ###
1. PolicyList: List of policy that needs to be attached to jenkins instance


 ### *JENKINS Description*  ###  

- Master Node is configured to run inside Docker Container, the file  `jenkins-master/Dockerfile` is used to build the image for Jenkins

- Basic Bootstrapping are configured through groovy scripts, stored in jenkins-master/groovy/ directory
- The seed Job can be Changed by giving the git URL and Branch in `05_test_job.groovy` file

- plugins.txt is used to perform plugin installation 
- The build Job is performed inside docker containers
- Each Source repo must contain a `Jenkinsfile` and `Dockerfile` , these 2 files will be Used to build the slave image in which jobs will be executed. 


### **Known Issue:** ###    
It is to be understood that for the first time the Job will fail. This is due to the default design of Jenkinsfile pipeline as it is necessory for Jenkins to pick the required parameters during first job build and uses the same paraeters from second job. 
So once the job has failed for the first time, re-trigger the job again.