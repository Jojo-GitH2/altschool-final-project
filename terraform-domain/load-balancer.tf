data "aws_lbs" "loadbalancers" {
  for_each = var.loadbalancer-tags
  tags = {
    "kubernetes.io/service-name" = each.value
  }

}

output "loadbalancers" {
  value = data.aws_lbs.loadbalancers
}

# locals {
#   filtered_Loadbalancers = [for lb in data.aws_lb.loadbalancers: lb if ]
# }
# locals {
#     filtered_Loadbalancers = {for lb in data.aws_lb.loadbalancers: lb
#       if contains(keys(lb.tags), "kubernetes.io/service-name") && (lb.tags["kubernetes.io/service-name"] == "voting-application/voting-service" || lb.tags["kubernetes.io/service-name"] == "sock-shop/front-end") => lb
#     }
# }

#   name = "tag:kubernetes.io/service-name"
#   # values = ["voting-application/voting-service", "sock-shop/front-end"]
#   values = [each.value]
# }


# data "aws_lb" "voting-app-loadbalancer" {
#   # arn = data.aws_kms_secrets.decrypt_arn.plaintext["voting-app-arn"]
#   dns_name = var.encrypted-voting-app-loadbalancer
# }
