variable "project_id" {
  type        = string
  description = "default project id where you want to create resources"
}

variable "region" {
  type        = string
  default     = ""
  description = "default region to use"
}

variable "zone" {
  type        = string
  default     = ""
  description = "zone in the region"
}

variable "db_root_password" {
  type        = string
  default     = ""
  description = "root password for the database service"
}

variable "db_user_password" {
  type        = string
  default     = ""
  description = "user password for the database service"
}

variable "access_token" {
  type        = string
  description = "access token to authenticate google cloud"
  validation {
    condition     = length(var.access_token) > 0
    error_message = "access token is required"
  }
}

variable "service_account_email" {
  type        = string
  default     = ""
  description = "service account email for compute resources"
}



variable "my_name" {
  type        = string
  description = "your full name"
  default     = ""
}

variable "docker_image" {
  type        = string
  default     = ""
  description = "full path of the docker image if not using default registry"
}
