variable "vpcname" {
    type = string
    description = "vpc name"
}

variable "public_cidr" {
    type = list(string)
    description = "public cidr"
}

variable "private_cidr" {
    type = list(string)
    description = "private_cidr"
}

variable "region" {
    type = list(string)
    description = "region vpc to be created"
  
}