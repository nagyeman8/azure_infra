variable "project_name" {
  type = string
}

variable "env_name" {
  type = string
}

variable "env_location" {
  type = string
}

variable "project_extension" {
  type = string
}

variable "app_owner" {
  type = string
}

variable "app_override_tags" {
  type    = map(string)
  default = {}
}