variable "AWS_REGION" {
  default = "us-east-1"
}

variable "PolicyList" {
  default = ["arn:aws:iam::aws:policy/AmazonSSMFullAccess",
                        "arn:aws:iam::aws:policy/AmazonS3FullAccess",
                        "arn:aws:iam::aws:policy/AWSElasticBeanstalkFullAccess",
                        "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryPowerUser",
                        "arn:aws:iam::aws:policy/AmazonSSMReadOnlyAccess"]
}
