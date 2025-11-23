# eks/dev.tfvars (refactored)
env        = "dev"
aws_region = "ap-south-1"

# VPC
vpc_cidr_block = "10.16.0.0/16"
vpc_name       = "vpc"
igw_name       = "igw"

pub_subnet_count       = 3
pub_cidr_block         = ["10.16.0.0/20", "10.16.16.0/20", "10.16.32.0/20"]
pub_availability_zones = ["ap-south-1a", "ap-south-1b", "ap-south-1c"]
pub_sub_name           = "subnet-public"

pri_subnet_count       = 3
pri_cidr_block         = ["10.16.128.0/20", "10.16.144.0/20", "10.16.160.0/20"]
pri_availability_zones = ["ap-south-1a", "ap-south-1b", "ap-south-1c"]
pri_sub_name           = "subnet-private"

public_rt_name  = "public-route-table"
private_rt_name = "private-route-table"
eip_name        = "elasticip-ngw"
ngw_name        = "ngw"

eks_sg = "eks-sg"

# EKS
is_eks_cluster_enabled  = true
cluster_version         = "1.32"
cluster_name            = "movie-prod-cluster"
endpoint_private_access = true
endpoint_public_access  = false

# --- Important: diversified instance types to avoid capacity shortages in ap-south-1 ---
# ondemand_instance_types should be a list of instance types so AWS has options.
# Start with a small family then fall back to larger families if needed.
ondemand_instance_types = ["t3.medium", "t3.large", "m5.large"]

# Spot types (diversified). Keep at least a few choices; remove spot entirely if you want max reliability.
spot_instance_types = ["t3.large", "m5.large", "c5.large"]

desired_capacity_on_demand = 1
min_capacity_on_demand     = 1
max_capacity_on_demand     = 5

desired_capacity_spot = 1
min_capacity_spot     = 1
max_capacity_spot     = 1

addons = [
  {
    name    = "vpc-cni"
    version = "v1.19.5-eksbuild.3"
  },
  {
    name              = "coredns"
    version           = "v1.11.4-eksbuild.2"
    resolve_conflicts = "OVERWRITE"
  },
  {
    name    = "kube-proxy"
    version = "v1.32.3-eksbuild.7"
  },
  {
    name    = "aws-ebs-csi-driver"
    version = "v1.44.0-eksbuild.1"
  }
]
