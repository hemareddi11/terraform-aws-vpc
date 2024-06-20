## Modules

The following modules are included in this repository

- VPC Module
- Subnet Module
- Security Group Module

## Usage

Create a module on based on requirement of resources

### Step 1: Clone the Repository
git clone <repository-url>
cd <repository-directory>

### Step 2: add requirent information based on below examples
## Example
####################   Creage a VPC using below module ###############################

module "vpc" {
  source          = "./modules/vpc"
  vpc_cidr        = "10.0.0.0/16"
  resource_prefix = "assignment"
}

###################   Create a Subnet using below module #############################

module "subnets" {
  source               = "./modules/subnets"
  vpc_id               = module.vpc.vpc_id
  public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnet_cidrs = ["10.0.3.0/24", "10.0.4.0/24"]
  resource_prefix      = "assignment"
}


#################### Create a Security Group using below module ######################

module "security_group" {
  source              = "./modules/security_group"
  vpc_id              = module.vpc.vpc_id
  resource_prefix     = "assignment"
  security_group_name = "assignment-sg"
  security_group_rules = {
    https-443 = {
      protocol    = "tcp"
      from_port   = 443
      to_port     = 443
      type        = "ingress"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}

## Backed file update

1) Update s3 bucket information for statefile 
2) Update location based on requirement
3) Update key based on the project

## Teraaform Operations
terraform init
terrform plan
terraform apply


