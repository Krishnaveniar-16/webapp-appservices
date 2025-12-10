
variable "dockerhub_user" {
  type        = string
  default     = "kveni16"
}

variable "dockerhub_pass" {
  type        = string
  sensitive   = true
}


variable "db_host" {
  type        = string
  default     = "cicd-postgres.postgres.database.azure.com"
}

variable "db_user" {
  type        = string
  default     = "dbadmin"
}

variable "db_password" {
  type        = string
  sensitive   = true
}

variable "db_name" {
  type        = string
  default     = "appdb"   # You can change this later
}
