#Create Subnets
module "subnetsModule" {
    source = "github.com/salma-ahmed20/aws-subnets-module-terraform.git" 
    private-subnets = var.private-subnets
    public-subnets = var.public-subnets
    vpc_id = var.vpc_id
    igw_id = var.igw_id
}

#Create RDS Instance
module "RDSInstance" {
  source    = "github.com/salma-ahmed20/aws-rds-instance-terraform.git"
  vpc_id = var.vpc_id
  private_subnet = module.subnetsModule.private_subnet_output
}

#Create Web Instance
module "ec2Instance" {
  source    = "github.com/salma-ahmed20/web-instance-module-terraform.git"
  vpc_id = var.vpc_id
  public_subnet_id= module.subnetsModule.public_subnet_output.id

}