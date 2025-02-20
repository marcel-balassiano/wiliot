# VPC
variable "vpc_id" {
  description = "Marcel VPC ID"
  type        = string
  default     = "aws_vpc.vpc_us_east_2_marcel_01.id"
}

# Subnets
variable "public_subnet_ids" {
  description = "Public Subnet IDs"
  type        = list(string)
  default     = [
    "aws_subnet.subnet_public_us_east_2a_marcel_01.id",
    "aws_subnet.subnet_public_us_east_2b_marcel_01.id"
  ]
}

variable "private_subnet_ids" {
  description = "Private Subnet IDs"
  type        = list(string)
  default     = [
    "aws_subnet.subnet_private_us_east_2a_marcel_01.id",
    "aws_subnet.subnet_private_us_east_2b_marcel_01.id"
  ]
}

# RDS
variable "rds_instance_id" {
  description = "PostgreSQL RDS Instance ID"
  type        = string
  default     = "aws_db_instance.postgresql_marcel.id"
}

variable "rds_subnet_group_id" {
  description = "RDS Subnet Group ID"
  type        = string
  default     = "aws_db_subnet_group.rds_subnet_group.id"
}

# ECR
variable "ecr_repository_url" {
  description = "ECR Repository URL"
  type        = string
  default     = "aws_ecr_repository.ecr_repository_us_east_2_marcel_01.repository_url"
}

# EKS
variable "eks_cluster_id" {
  description = "EKS Cluster ID"
  type        = string
  default     = "aws_eks_cluster.eks_cluster.id"
}

# IAM
variable "eks_role_arn" {
  description = "EKS Role ARN"
  type        = string
  default     = "aws_iam_role.eks_role.arn"
}

variable "worker_instance_profile_arn" {
  description = "EKS Worker Instance Profile ARN"
  type        = string
  default     = "aws_iam_instance_profile.eks_worker_instance_profile.arn"
}

# Security Groups
variable "rds_security_group_id" {
  description = "RDS Security Group ID"
  type        = string
  default     = "aws_security_group.rds_sg.id"
}

# Networking
variable "internet_gateway_id" {
  description = "Internet Gateway ID"
  type        = string
  default     = "aws_internet_gateway.igw.id"
}

variable "public_route_table_id" {
  description = "Public Route Table ID"
  type        = string
  default     = "aws_route_table.public_rt.id"
}