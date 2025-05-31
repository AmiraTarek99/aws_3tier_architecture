module "network"{
    source= "./modules/networking"
    cidr=var.cidr
    # pub-sub=var.sub-pub-cidr
    # priv-sub=var.sub-priv-cidr
    azs=var.azs56
    
}

module "security_groups" {
  source = "./modules/SG"
  vpc_id = module.network.vpc-id
}

module "DB" {
    source = "./modules/DB"
    private_subnet = module.network.priv-subnets
    DB_pass = var.db_pass
    db_security_group_ids = module.security_groups.db_sg
  
}

module "frontend" {
  source = "./modules/Frontend"
  instance_type = var.instance_type
  ami= data.aws_ami.ubuntu.id
  key_pair = module.keys.key_name 
  fe_sg = module.security_groups.fe_sg
  vpc_id = module.network.vpc-id
  ex_lb_sg = module.security_groups.ex_alb_sg
  public_subnet = module.network.pub-subnets
  backend_alb_dns= module.backend.be_alb_dns_name

}

module "backend" {
  source = "./modules/Backend"
  instance_type = var.instance_type
  ami= data.aws_ami.ubuntu.id
  key_pair = module.keys.key_name 
  be_sg = module.security_groups.be_sg
  vpc_id = module.network.vpc-id
  int_lb_sg = module.security_groups.int_alb_sg
  private_subnet = module.network.priv-subnets

}

module "ASG" {
    source = "./modules/ASG"
    fe_lt = module.frontend.fe_lt_id
    public_subnet = module.network.pub-subnets
    fe_aws_lb_target_group_arn = module.frontend.fe_aws_lb_target_group_arn
    private_subnet = module.network.priv-subnets
    be_lt = module.backend.be_lt_id
    be_aws_lb_target_group_arn = module.backend.be_aws_lb_target_group_arn
}

module "cloudWatch" {
  source                  = "./modules/cloudWatch"
  autoscaling_group_names = [module.AutoScaling.fe_autoscaling_group_names, module.AutoScaling.be_autoscaling_group_names]
  scale_out_arns          = [module.AutoScaling.fe_scale_out_arns, module.AutoScaling.be_scale_out_arns]
  scale_in_arns           = [module.AutoScaling.fe_scale_in_arns, module.AutoScaling.be_scale_in_arns]
}

module "keys" {
  source = "./modules/keys"
}

