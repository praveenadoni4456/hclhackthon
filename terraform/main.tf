module "vpc" {
    source         = "./modules/vpc"
    vpcname = var.vpcname
    public_cidr = var.private_cidr[count.index]
    private_cidr = var.private_cidr[count.index]
    region = var.region[count.index]
}