#VPC

variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "tenancy" {
  type    = string
  
}

variable "pub_sub" {
  type    = list(any)
  
}

variable "priv_sub" {
  type    = list(any)
  
}

variable "namespace" {
  type    = string
  
}

variable "vpc_rt_cidr" {
  type = string
 
}