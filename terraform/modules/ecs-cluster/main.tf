resource "aws_ecs_cluster" "ecs_cluster" {
  name = "${var.app_name}_ecs_cluster"
}
#r