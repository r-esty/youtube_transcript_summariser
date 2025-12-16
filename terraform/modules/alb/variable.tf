variable "vpc_id" {
    type = string
}

variable "alb_security_group_id" {
    type = string
}

variable "public_1_id" {
    type = string
}

variable "public_2_id" {
    type = string
}

variable "app_name" {
    type = string
    description = "The name of application"
    default = "youtube_transcript"
}
