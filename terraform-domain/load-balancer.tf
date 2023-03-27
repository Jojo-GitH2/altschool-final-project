data "aws_lb" "sock-shop-loadbalancer" {
  arn = var.sock-shop-loadbalancer
}

data "aws_lb" "voting-app-loadbalancer" {
  arn = var.voting-app-loadbalancer
}
