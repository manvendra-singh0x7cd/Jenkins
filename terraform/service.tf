variable "JenkinsServiceTaskCount" {
  default = 1
}

variable "MinimumServiceHealthPercent" {
  default = 0
}


resource "aws_ecs_service" "jenkins-service" {
  name = "jenkins-service"
  task_definition = "${aws_ecs_task_definition.jenkins-task.arn}"
  desired_count = "${var.JenkinsServiceTaskCount}"
  launch_type = "EC2"
  cluster = "${module.ecs.ECS_CLUSTER_ID}"
  deployment_minimum_healthy_percent = "${var.MinimumServiceHealthPercent}"
}
