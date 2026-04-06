terraform {
  backend "s3" {
    bucket       = "dung-s3-tfstate"
    key          = "nginx-project/terraform.tfstate"
    region       = "ap-southeast-1"
    encrypt      = true
    use_lockfile = true
  }
}