# AWS Configurations
variable "region" { type = string }
variable "tag_name" { type = string }
variable "env" { type = string }

# State Management Bucket
variable "bucket" { type = string }
variable "key" { type = string }

# Service Config
variable "service_name" { type = string }

variable "alb_protocol" { type = string }
variable "alb_port" { type = string }
variable "service_port" { type = string }
