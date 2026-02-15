variable "vpc_cidr" {

  type        = string
  description = "The variable for the value of the vpc cidr"
  default     = "10.0.0.0/16"


}

variable "public_1_cidr" {

  type        = string
  description = "The variable for the value of the public_1 cidr"
  default     = "10.0.1.0/24"


}

variable "public_2_cidr" {

  type        = string
  description = "The variable for the value of the public_2 cidr"
  default     = "10.0.2.0/24"


}

variable "private_1_cidr" {

  type        = string
  description = "The variable for the value of the private_1 cidr"
  default     = "10.0.3.0/24"


}

variable "private_2_cidr" {

  type        = string
  description = "The variable for the value of the private_2 cidr"
  default     = "10.0.4.0/24"


}

variable "public_1_az" {

  type        = string
  description = "The variable for the value of the public_1 availabity zone"
  default     = "eu-west-2a"


}

variable "public_2_az" {

  type        = string
  description = "The variable for the value of the public_2 availabity zone"
  default     = "eu-west-2b"


}

variable "app_name" {
  type        = string
  description = "The name of application"
  default     = "youtube_transcript"

}




