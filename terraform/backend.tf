terraform {
  backend "s3" {
    bucket       = "youtube-transcript-bucket"
    key          = "path/to/my/key"
    region       = "eu-west-2"
    use_lockfile = true
  }
}
