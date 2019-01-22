resource "aws_default_vpc" "default" {
}

module "ecs" {
  source = "./ecs"
  VPC_ID = "${aws_default_vpc.default.id}"
  SUBNET_LIST  = ["subnet-7bb5851e"]
  AmiId = "ami-06bec82fb46167b4f"
  InstanceKeyPairName= "Jenkins-master"
  AttachExtraPolicies = "${var.PolicyList}"
  AsgHealthCheckType = "EC2"
  ELBSslArn = "${var.ELBSslArn}"
}
