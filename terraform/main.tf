module "networking" {
    source = "./modules/networking"

    vpc_cidr = var.vpc_cidr
    public_1_cidr = var.public_1_cidr
    public_2_cidr = var.public_2_cidr
    private_1_cidr = var.private_1_cidr
    private_2_cidr = var.private_2_cidr
    public_1_az = var.public_1_az
    public_2_az = var.public_2_az



  
}
module "ecs_cluster" {
  source = "./modules/ecs-cluster"
  app_name = var.app_name
}
module "iam" {

    source = "./modules/iam"

    app_name = var.app_name
  
}

module "alb" {
  source = "./modules/alb"
  
  app_name              = var.app_name
  vpc_id                = module.networking.vpc_id
  public_1_id           = module.networking.public_1_id
  public_2_id           = module.networking.public_2_id
  alb_security_group_id = module.networking.alb_security_group_id
  certificate_arn = "arn:aws:acm:eu-west-2:207567788282:certificate/8fa93397-8ccd-4bf1-a99f-990a0928a0f5"
}

module "ecs_service" {
  source = "./modules/ecs-service"
  
  app_name                    = var.app_name
  ecs_cluster_id              = module.ecs_cluster.ecs_cluster_id
  target_group_arn            = module.alb.target_group_arn
  ecs_task_execution_role_arn = module.iam.ecs_task_execution_role
  ecs_execution_role_policy   = module.iam.ecs_execution_role_policy
  private_1_id                = module.networking.private_1_id
  private_2_id                = module.networking.private_2_id
  ecs_security_group_id       = module.networking.ecs_security_group_id
  openai_api_key = var.openai_api_key
}

module "ecr" {

  source = "./modules/ecr"

  app_name = var.app_name
  


}