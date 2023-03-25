data "aws_lb" "sock-shop-loadbalancer" {
  arn = var.sock-shop-loadbalancer
}

data "aws_lb" "votingapp-loadbalancer" {
  arn = var.votingapp-loadbalancer
}
