I was experimenting if I could use a single repo for multiple modules by adding `create` variable as this (https://github.com/terraform-aws-modules/terraform-aws-rds). I haven't got it work yet. Probably leave it for now...

This doesn't work

```hcl
module "website_s3_bucket" {
  creates_static_web_bucket = true
  create_private_encrypted_with_lifecycle_bucket = false
  source      = "git@github.com:mydatahack/terraform-aws-examples.git"
  bucket_name = "mydatahack-blog-gatsby-site"
  tags = {
    Name        = "Playing with Terraform"
    Environment = "dev"
  }
}

module "bucket_with_life_cycle" {
  create_private_encrypted_with_lifecycle_bucket = true
  createstatic_web_bucket = false
  source                    = "git@github.com:mydatahack/terraform-aws-examples.git"
  bucket_name                = "terraform-learn-testing-bucket-with-life-cycle"
  glacier_ir_transition_days = 90
  deep_archive_transition_days = 180
  expiration_days            = 270
  tags = {
    Name        = "Playing with Terraform"
    Environment = "dev"
  }
}
```
