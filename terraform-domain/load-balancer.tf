data "aws_lb" "sock-shop-loadbalancer" {
  arn = data.aws_kms_secrets.decrypt_arn.plaintext["sock-shop-arn"]
  # arn = var.encrypted-sock-shop-loadbalancer
}

data "aws_lb" "voting-app-loadbalancer" {
  arn = data.aws_kms_secrets.decrypt_arn.plaintext["voting-app-arn"]
  # arn = var.encrypted-voting-app-loadbalancer
}
