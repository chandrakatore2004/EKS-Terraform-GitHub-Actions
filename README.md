# 🚀 Configuring Dev/Production-Ready EKS Clusters with Terraform and GitHub Actions..

Tearraform Commands:

terraform init -backend-config=../envs/dev/backend.config
terraform apply -var-file=../envs/dev/terraform.tfvars -auto-approve
terraform destroy -var-file=../envs/dev/terraform.tfvars -auto-approve
