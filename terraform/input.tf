variable "AWS_REGION" {
  default = "us-east-1"
}

variable "PolicyList" {
  default = ["arn:aws:iam::aws:policy/AmazonSSMFullAccess",
                        "arn:aws:iam::aws:policy/AmazonS3FullAccess",
                        "arn:aws:iam::aws:policy/AWSElasticBeanstalkFullAccess",
                        "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryPowerUser",
                        "arn:aws:iam::aws:policy/AmazonSSMReadOnlyAccess",
                        "arn:aws:iam::aws:policy/AmazonDynamoDBFullAccess"]
}

variable "ELBSslArn" {
  description = "ACM Certificate for ELB SSL"
  default = "arn:aws:acm:us-east-1:046078814158:certificate/0fe7bd03-a221-4fa7-8c4b-f467a4b19b64"
}

