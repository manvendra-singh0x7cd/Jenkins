resource "aws_default_vpc" "default" {
}

module "ecs" {
  source = "./ecs"
  VPC_ID = "${aws_default_vpc.default.id}"
  SUBNET_LIST  = "${var.SUBNET_LIST}"
  AmiId = "${var.AMiID}"
  InstanceKeyPairName= "${var.InstanceKeyPairName}"
  AttachExtraPolicies = "${var.PolicyList}"
  AsgHealthCheckType = "${var.AsgHealthCheckType}"
  ELBSslArn = "${var.ELBSslArn}"
  ECS_CLUSTER_NAME = "${var.ECS_CLUSTER_NAME}"
}
