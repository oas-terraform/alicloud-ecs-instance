terraform {
  required_providers {
    alicloud = ">= 1.126.1"
  }
}
resource "alicloud_instance" "this" {
  instance_name                 = var.ecs_instance_name
  image_id                      = var.ecs_image_id
  instance_type                 = var.ecs_instance_type
  security_groups               = var.ecs_security_groups
  system_disk_category          = var.ecs_system_disk_category
  system_disk_size              = var.ecs_system_disk_size
  system_disk_name              = "${var.ecs_instance_name}_system"
  system_disk_description       = var.ecs_instance_name
  system_disk_performance_level = var.ecs_system_disk_performance_level
  internet_charge_type          = var.ecs_internet_charge_type
  host_name                     = var.ecs_hostname
  vswitch_id                    = var.ecs_vswitch_id
  instance_charge_type          = var.ecs_instance_charge_type
  resource_group_id             = var.ecs_resource_group_id
  tags                          = {
    Name                        = var.ecs_instance_name
    Project                     = var.tag_project
    HostType                    = var.tag_host_type
    HostId                      = var.tag_host_id
  }
  key_name                      = var.ecs_key_name
  deletion_protection           = var.ecs_deletion_protection
  status                        = var.ecs_status
  user_data                     = var.ecs_user_data != "" ? var.ecs_user_data: ""
}

variable "ecs_data_disk_info" {
  description = "ecs_data_disk_info"
  default = []
}
resource "alicloud_ecs_disk" "this" {
  count             = length(var.ecs_data_disk_info)
  zone_id           = var.ecs_zone_id
  disk_name         = "${var.ecs_instance_name}_data"
  description       = "${var.ecs_instance_name}_data"
  category          = var.ecs_data_disk_info[count.index].type !="" ? var.ecs_data_disk_info[count.index].type: var.default_disk_type
  size              = var.ecs_data_disk_info[count.index].size !="" ? var.ecs_data_disk_info[count.index].size: var.default_disk_size
  resource_group_id = var.ecs_resource_group_id
  tags              = {
    Name            = "${var.ecs_instance_name}_data"
    Project         = var.tag_project
  }
}

resource "alicloud_ecs_disk_attachment" "this" {
  count       = length(var.ecs_data_disk_info)
  disk_id     = alicloud_ecs_disk.this[count.index].id
  instance_id = alicloud_instance.this.id
}

resource "alicloud_eip" "this" {
  address_name          = var.ecs_instance_name
  description           = var.ecs_instance_name
  bandwidth             = var.ecs_bandwidth
  internet_charge_type  = var.ecs_internet_charge_type
  payment_type          = var.eip_payment_type
  tags                  = {
    Name                = var.ecs_instance_name
    Project             = var.tag_project
  }
  resource_group_id     = var.ecs_resource_group_id
}

resource "alicloud_eip_association" "this" {
  allocation_id = alicloud_eip.this.id
  instance_id   = alicloud_instance.this.id
}