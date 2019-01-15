data "template_file" "container_defination" {
  template = "${file("container_defination.tpl")}"
  vars = {
    rexray-accesskey = "${aws_iam_access_key.rexray-user-accesskey.id}"
    rexray-secretkey = "${aws_iam_access_key.rexray-user-accesskey.secret}"
    rexray-region = "${var.AWS_REGION}"
  }
}


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
}



resource "aws_iam_user" "rexray-user" {
  name = "rexray"
  tags = "${var.TAGS}"

}

resource "aws_iam_user_policy" "rexray-user-policy" {
  name = "rex-ray-user-policy"
  user = "${aws_iam_user.rexray-user.name}"
  policy = "${file("rexray-user-policy.json")}"
}


resource "aws_iam_access_key" "rexray-user-accesskey" {
  user = "${aws_iam_user.rexray-user.name}"
}