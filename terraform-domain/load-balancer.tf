data "aws_elb" "loadbalancers" {
  for_each = var.loadbalancer-tags
  filter{
    name = "tag:kubernetes.io/service-name"
    # values = ["voting-application/voting-service", "sock-shop/front-end"]
    values = [each.value]
  }
}

# data "aws_lb" "voting-app-loadbalancer" {
#   # arn = data.aws_kms_secrets.decrypt_arn.plaintext["voting-app-arn"]
#   dns_name = var.encrypted-voting-app-loadbalancer
# }
