variable "env" {}
variable "service_name" {}
variable "service_type" {}
variable "identifier" {}

variable "allocated_storage" {
  default = "20"
}

variable "engine" {
  default = "postgres"
}

variable "engine_version" {
  default = "9.6.3"
}

variable "instance_class" {
  default = "db.t2.small"
}

variable "name" {}
variable "username" {}
variable "password" {}

variable "count" {
  default = "1"
}

variable "multi_az" {
  default = "false"
}

variable "publicly_accessible" {
  default = "false"
}

variable "storage_encrypted" {
  default = "true"
}

variable "storage_type" {
  default = "gp2"
}

variable "database_port" {
  default = "5432"
}

variable "db_subnet_group_name" {}
variable "zone_id" {}

variable "subnet_ids" {
  type = "list"
}

variable "availability_zones" {
  default = ["ap-southeast-1a", "ap-southeast-1b"]
}

variable "skip_final_snapshot" {
  default = "false"
}

variable "rds_vpc_id" {}
variable "domain_name" {}
variable "domain_sub_name" {}
variable "app_security_group" {}
variable "db_security_group" {}

variable "backup_retention_period" {
  default = "1"
}

variable "maintenance_window" {
  default = "Sun:20:00-Sun:23:00"
}

variable "monitoring_interval" {
  default = "1"
}

variable "monitoring_role_arn" {}

variable "auto_minor_version_upgrade" {
  default = "false"
}

variable "apply_immediately" {
  default = "true"
}
