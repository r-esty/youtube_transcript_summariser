variable "app_name" {
  type    = string
  default = "youtube-transcript"
}

variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "public_1_cidr" {
  type    = string
  default = "10.0.1.0/24"
}

variable "public_2_cidr" {
  type    = string
  default = "10.0.2.0/24"
}

variable "private_1_cidr" {
  type    = string
  default = "10.0.10.0/24"
}

variable "private_2_cidr" {
  type    = string
  default = "10.0.11.0/24"
}

variable "public_1_az" {
  type    = string
  default = "eu-west-2a"
}

variable "public_2_az" {
  type    = string
  default = "eu-west-2b"
}

variable "openai_api_key" {
  type      = string
  sensitive = true
}

variable "domain_name" {
  type = string
  default = "romeoesty.com"
}

variable "zone_id" {

  type = string
  
}