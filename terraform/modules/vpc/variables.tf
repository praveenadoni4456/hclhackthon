variable "vpcname" {
    type = string
}

variable "public_cidr" {
    type = list(string)
}

variable "private_cidr" {
    type = list(string)
}

variable "region" {
    type = list(string)
}