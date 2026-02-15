variable "app_name" {
  type = string
}

variable "ecs_cluster_id" {
  type = string
}

variable "target_group_arn" {
  type = string
}

variable "ecs_task_execution_role_arn" {
  type = string
}

variable "ecs_execution_role_policy" {
  type = string
}

variable "private_1_id" {
  type = string
}

variable "private_2_id" {
  type = string
}

variable "ecs_security_group_id" {
  type = string
}

variable "openai_api_key" {
  type      = string
  sensitive = true
}