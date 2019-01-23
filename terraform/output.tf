output "Jenkins_DNS" {
  value = "${module.ecs.ELB_ENDPOINT}"
  description = "DNS Endpoint for the Jenkins ELB"
}
