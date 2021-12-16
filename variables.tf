variable "ecs_instance_name" {
	description = "instance name"
	type 		= string
}
variable "ecs_image_id" {
	description = "instance image id"
	type 		= string
}
variable "ecs_instance_type" {
	description = "instance type"
	type 		= string
}
variable "ecs_security_groups" {
	description = "instance security_groups"
}
variable "ecs_system_disk_category" {
	description = "instance system disk category"
	default		= "cloud_essd"
	type 		= string
}
variable "ecs_system_disk_size" {
	description = "instance system disk size"
	default		= 40
}
variable "ecs_system_disk_performance_level" {
	description = "instance system disk performance level"
	default		= "PL0"
	type 		= string
}
variable "ecs_internet_charge_type" {
	description = "internet charge type"
	default		= "PayByTraffic"
	type 		= string
}
variable "ecs_hostname" {
	description = "instance hostname"
	type 		= string
}
variable "ecs_vswitch_id" {
	description = "vpc vswitch id"
	type 		= string
}
variable "ecs_instance_charge_type" {
	description = "instance charge type"
	default		= "PostPaid"
	type 		= string
}
variable "ecs_resource_group_id" {
	description = "resource group id"
}
variable "tag_project" {
	description = "project name"
	type 		= string
}
variable "ecs_key_name" {
	description = "instance ssh key name"
	type 		= string
}
variable "ecs_deletion_protection" {
	description = "ecs_deletion_protection"
	default		= false
}
variable "ecs_status" {
	description = "install status"
	default		= "Running"
	type 		= string
}
variable "ecs_bandwidth" {
	description = "instance  bandwidth"
	default		= 200
}
variable "default_disk_size" {
	description = "instance data disk size"
	default		= 100
	type 		= string
}
variable "default_disk_type" {
	description = "instance data disk category"
	default		= "cloud_essd"
	type 		= string
}
variable "ecs_data_disk_performance_level" {
	description = "instance data disk performance level"
	default		= "PL0"
	type 		= string
}
variable "ecs_data_disk_delete_with_instance" {
	description = "instance data disk delete with instance"
	default		= false
}
variable "eip_payment_type" {
	description = "eip_payment_type"
	default 	= "PayAsYouGo"
}
variable "ecs_zone_id" {
	description = "disk zone id"
	type = string
}

variable "ecs_user_data" {
	description = "ecs_user_data"
	default 	= ""
}
variable "private_zone" {
	default 	= ""
}

variable "tag_host_type" {
}

variable "tag_host_id" {
}