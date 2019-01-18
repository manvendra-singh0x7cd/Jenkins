variable "InstanceType" {
  default = "t2.large"
  description = "type of ec2 instance"
}

variable "InstanceRootBlockSize" {
  default =  30
}
variable "AttachPublicIp" {
  default = true
}


resource "aws_launch_configuration" "ecs_launch_config" {
  name_prefix = "ecs-launch-config"
  image_id = "${var.AmiId}"
  instance_type = "${var.InstanceType}"
  iam_instance_profile = "${aws_iam_instance_profile.ecs-instance-profile.id}"
  key_name = "${var.InstanceKeyPairName}"

  root_block_device = {
      volume_type = "gp2"
      volume_size = "${var.InstanceRootBlockSize}"
      delete_on_termination = true
  }
  associate_public_ip_address = "${var.AttachPublicIp}"

  security_groups = ["${aws_security_group.instance_port.id}"]
  user_data  = <<EOF
                #!/bin/bash
                set -x
                echo ECS_CLUSTER=${var.ECS_CLUSTER_NAME} >> /etc/ecs/ecs.config
                stop ecs 
                start ecs
                until curl -s http://localhost:51678/v1/metadata
                do
                  sleep 1
                done
                docker plugin install rexray/ebs REXRAY_PREEMPT=true EBS_REGION=${var.AWS_REGION} EBS_ACCESSKEY=${var.AWS_ACCESS_KEY}  EBS_SECRETKEY=${var.AWS_SECRET_KEY}  --grant-all-permissions
               EOF

  lifecycle = {
    create_before_destroy = true
  }
}
