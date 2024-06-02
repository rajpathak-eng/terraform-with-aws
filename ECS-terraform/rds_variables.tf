variable "allocated_storage" {
  description = "The amount of storage to allocate to the DB instance"
  type        = number
  default     = 10
}

variable "engine_version" {
  description = "The version of the Postgres engine to use"
  type        = string
  default     = "14.7"
}

variable "instance_class" {
  description = "The instance class to use for the DB instance"
  type        = string
  default     = "db.t3.small"
}

variable "db_identifier" {
  description = "The identifier for the DB instance"
  type        = string
  default     = "mydb"
}

variable "db_username" {
  description = "The username for the DB instance"
  type        = string
  default     = "lynk_api"
}

variable "db_password" {
  description = "The password for the DB instance"
  type        = string
  default     = "lynk_api1234!"
}

variable "backup_retention_period" {
  description = "The number of days for which automated backups are retained"
  type        = number
  default     = 1
}

variable "backup_window" {
  description = "The preferred backup window"
  type        = string
  default     = "06:00-06:30"
}
