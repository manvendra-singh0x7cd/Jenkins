resource "aws_ecs_task_definition" "jenkins-task" {
  family = "jenkins"
  container_definitions = "${file("container_defination.json")}"
  volume = {
      name = "jenkins_home"
      docker_volume_configuration = {
          scope = "shared"
          autoprovision = true
      }
  }

  volume = {
      name = "docker-daemon"
      host_path = "/var/run/docker.sock"
  }
}
