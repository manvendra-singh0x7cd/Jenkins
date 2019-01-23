variable "AWS_REGION" {
  description = "Region in which Jenkins Must Be Deployed"
}

variable "PolicyList" {
  type = "list"
  description = "Extra Policies that needs to be attached to Jenkins"
}

variable "ELBSslArn" {
  description = "ACM Certificate for ELB SSL"
}


variable "SUBNET_LIST" {
  type = "list"
  description = "List of Subnets in which ASG and ELB will be deployed"
}

variable "AMiID" {
  description = "AMI to use for ECS Instances"
}
variable "InstanceKeyPairName" {
  description = "Key-pair to use for ECS Instances"
}

variable "AsgHealthCheckType" {
  description = "Healthcheck Type for AutoScaling Group, Valid values are EC2/ELB"
}

variable ECS_CLUSTER_NAME {
  description = "name of the ecs Cluster "
}

