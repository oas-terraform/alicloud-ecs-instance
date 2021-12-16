output "this_ecs_instance_name" {
  value = var.ecs_instance_name
}
output "this_ecs_private_ip" {
  value = alicloud_instance.this.private_ip
}
output "this_ecs_instance_type" {
  value = var.ecs_instance_type
}
output "this_eip_id" {
  description = "The EIP ID."
  value       = alicloud_eip.this.id
}
output "this_eip_address" {
  description = "The elastic ip address."
  value       = alicloud_eip.this.ip_address
}