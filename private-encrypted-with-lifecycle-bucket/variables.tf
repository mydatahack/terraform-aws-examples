variable "create" {
  description = "Set to true if you want to use this module"
  type = bool
  default = false
}

variable "bucket_name" {
  description = "Name of the s3 bucket. Must be unique."
  type        = string
}

variable "tags" {
  description = "Tags to set on the bucket."
  type        = map(string)
  default     = {}
}

variable "glacier_ir_transition_days" {
  description = "Days for transitioning to Glacier IR"
  type = number
}

variable "deep_archive_transition_days" {
  description = "Days for transitioning to Deep Archive"
  type = number
}

variable "expiration_days" {
  description = "Days to keep the file until it gets deleted"
  type = number
}