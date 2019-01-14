output "Jenkins_DNS" {
  value = "${module.ecs.ELB_ENDPOINT}"
}
