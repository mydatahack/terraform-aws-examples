resource "aws_codebuild_project" "codebuild_project_build" {
  name          = var.codebuild_build_project_name
  description   = "codebuild_project_for_build"
  build_timeout = "5"
  service_role  = aws_iam_role.codebuild_role.arn

  artifacts {
    type = "CODEPIPELINE"
  }

  cache {
    type  = "LOCAL"
    modes =  ["LOCAL_DOCKER_LAYER_CACHE", "LOCAL_SOURCE_CACHE"]
  }

  environment {
    compute_type                = "BUILD_GENERAL1_SMALL"
    image                       = "aws/codebuild/standard:5.0"
    type                        = "LINUX_CONTAINER"
    image_pull_credentials_type = "CODEBUILD"

  }
  source {
    type      = "CODEPIPELINE"
    buildspec = file("specs/buildspec.yml")
  }

  tags = {
    Name        = var.tag_name
    Environment = var.env
  }

}