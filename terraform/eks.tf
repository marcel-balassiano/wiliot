resource "aws_eks_cluster" "eks_cluster" {
  name     = "eks-cluster-us-east-2-marcel-01"
  role_arn = aws_iam_role.eks_role.arn
  vpc_config {
    subnet_ids = [
      aws_subnet.subnet_public_us_east_2a_marcel_01.id,
      aws_subnet.subnet_public_us_east_2b_marcel_01.id
    ]
  }
  depends_on = [aws_vpc.vpc_us_east_2_marcel_01]
}
