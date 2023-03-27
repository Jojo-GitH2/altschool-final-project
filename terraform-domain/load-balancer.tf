data "aws_lb" "sock-shop-loadbalancer" {
  # arn = data.aws_kms_secrets.decrypt_arn.plaintext["sock-shop-arn"]
  dns_name = var.encrypted-sock-shop-loadbalancer
}

data "aws_lb" "voting-app-loadbalancer" {
  # arn = data.aws_kms_secrets.decrypt_arn.plaintext["voting-app-arn"]
  dns_name = var.encrypted-voting-app-loadbalancer
}
