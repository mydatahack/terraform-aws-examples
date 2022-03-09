# (1) AWS Configurations
variable "aws_region" {
  type    = string
}

variable "tag_name" {
  type    = string
}

variable "env" {
  type    = string
}

# (2) State Management Bucket - need to be created
variable "state_bucket" {
  description = "Bucket to manage state"
  type        = string
}

variable "state_bucket_key" {
  description = "Key in the bucket to manage state"
  type        = string
}

# (3) CodePipeline
variable "codepipeline_name" {
  description = "Name of the codepipeline we're deploying"
  type        = string
}

variable "codepipeline_role_name" {
  description = "Name of the codepipeline role"
  type        = string
}

variable "codepipeline_policy_name" {
  description = "Name of the codepipeline policy"
  type        = string
}

# This need to be created before runnig this
variable "artifact_bucket_name" {
  description = "ARN for the bucket where we push our artifact"
  type        = string
}

# This need to be created before runnig this
variable "codestar_connection_arn" {
  description = "ARN for the codestar connection"
  type        = string
}

variable "full_repository_id" {
  type    = string
}

variable "branch_name" {
  type    = string
  default = "main"
}

# (4) CodeBuild
variable "codebuild_role_name" {
  description = "Name of the codebuild role"
  type        = string
}

variable "codebuild_build_project_name" {
  description = "Name of the build project"
  type        = string
}