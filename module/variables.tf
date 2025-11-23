variable "env" {
  type = string
}

variable "cluster_name" {
  type = string
}

variable "vpc_cidr_block" {
  type = string
}

variable "vpc_name" {
  type = string
}

variable "igw_name" {
  type = string
}

variable "pub_subnet_count" {
  type = number
}

variable "pub_cidr_block" {
  type = list(string)
}

variable "pub_availability_zones" {
  type = list(string)
}

variable "pub_sub_name" {
  type = string
}

variable "pri_subnet_count" {
  type = number
}

variable "pri_cidr_block" {
  type = list(string)
}

variable "pri_availability_zones" {
  type = list(string)
}

variable "pri_sub_name" {
  type = string
}

variable "public_rt_name" {
  type = string
}

variable "private_rt_name" {
  type = string
}

variable "eip_name" {
  type = string
}

variable "ngw_name" {
  type = string
}

variable "eks_sg" {
  type = string
}

# IAM toggles
variable "is_eks_role_enabled" {
  type = bool
  default = true
}

variable "is_eks_nodegroup_role_enabled" {
  type = bool
  default = true
}

# EKS toggles & settings
variable "is_eks_cluster_enabled" {
  type = bool
  default = true
}

variable "cluster_version" {
  type = string
}

variable "endpoint_private_access" {
  type = bool
  default = false
}

variable "endpoint_public_access" {
  type = bool
  default = true
}

variable "addons" {
  type = list(object({
    name    = string
    version = string
    resolve_conflicts = optional(string)
  }))
  default = []
}

variable "ondemand_instance_types" {
  type    = list(string)
  default = ["t3.medium"]
}

variable "spot_instance_types" {
  type    = list(string)
  default = []
}

variable "desired_capacity_on_demand" {
  type = number
}

variable "min_capacity_on_demand" {
  type = number
}

variable "max_capacity_on_demand" {
  type = number
}

variable "desired_capacity_spot" {
  type = number
}

variable "min_capacity_spot" {
  type = number
}

variable "max_capacity_spot" {
  type = number
}
