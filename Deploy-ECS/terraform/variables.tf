# AWS Configurations
variable "region" { type = string }
variable "tf_bucket_name" { type = string }
variable "tag_name" { type = string }
variable "environment" { type = string }

# Service Config
variable "service_name" { type = string }

variable "alb_protocol" { type = string }
variable "alb_port" { type = string }
variable "service_port" { type = string }
