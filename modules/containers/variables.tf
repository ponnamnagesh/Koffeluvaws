variable "app_name" {
  type        = string
  description = "Application Name"
  default     = "kluv"
}

variable "app_environment" {
  type        = string
  description = "Application Environment"
  default     = "QA"
}

variable "key_name" {
  type        = string
  description = "KeyName for precreated SSH Key in AWS"
  default     = "kluvkey"
}

variable "EcsSG" {
  type        = string
  description = "security group name"
  default     = "EcsSG"
}