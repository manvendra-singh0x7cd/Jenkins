AWS_REGION = "us-east-1"
SUBNET_LIST = ["subnet-7bb5851e"]
AMiID = "ami-06bec82fb46167b4f"
InstanceKeyPairName = "Jenkins-master"
PolicyList = ["arn:aws:iam::aws:policy/AmazonSSMFullAccess",
                        "arn:aws:iam::aws:policy/AmazonS3FullAccess",
                        "arn:aws:iam::aws:policy/AWSElasticBeanstalkFullAccess",
                        "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryPowerUser",
                        "arn:aws:iam::aws:policy/AmazonSSMReadOnlyAccess",
                        "arn:aws:iam::aws:policy/AmazonDynamoDBFullAccess"]
AsgHealthCheckType = "EC2"
ELBSslArn= "arn:aws:acm:us-east-1:046078814158:certificate/0fe7bd03-a221-4fa7-8c4b-f467a4b19b64"
ECS_CLUSTER_NAME = "foobar"
