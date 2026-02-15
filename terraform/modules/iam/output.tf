output "ecs_task_execution_role" {
  value = aws_iam_role.ecs_task_execution_role.arn # ✓ This is ARN
}

output "ecs_execution_role_policy" {
  description = "ID of the ecs_execution_role_policy"
  value       = aws_iam_role_policy_attachment.ecs_execution_role_policy.id
}
