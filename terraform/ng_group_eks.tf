
resource "aws_eks_node_group" "example" {
  cluster_name    = "eks-cluster-us-east-2-marcel-01"
  node_group_name = "ng-eks-cluster-us-east-2-marcel-01"
  node_role_arn   = "arn:aws:iam::092988563851:role/eks-node-role" # Your node role ARN
  subnet_ids      = [
    "subnet-0c25dc58c19ff194a",
    "subnet-0b858301b1f33a0ed"
  ]

  scaling_config {
    desired_size = 2
    min_size     = 1
    max_size     = 4
  }

  instance_types = ["t3.small"]

  # Optional: Set additional configurations as needed
  # depends_on = [aws_eks_cluster.example] # Uncomment if you have a resource for the EKS cluster
}

output "node_group_arn" {
  value = aws_eks_node_group.example.arn
}
