variable "env" {}
variable "engine" {}
variable "backup_retention_period" {}
variable "preferred_backup_window" {}

variable "engine_version" {}
variable "subnet_ids" {}
variable "tags" {}

variable "database_name" {
  default = "dummy"
}

variable "no_of_instances" {}
variable "instance_class" {}
