output "arn" {
  description = "ARN of the bucket"
  value       = aws_s3_bucket.this.arn
}

output "name" {
  description = "Name (id) of the bucket"
  value       = aws_s3_bucket.this.id
}

output "life_cycle" {
  description = "Life cycle rule of the bucket"
  value       = aws_s3_bucket_lifecycle_configuration.s3_bucket_lifecycle.rule
}
