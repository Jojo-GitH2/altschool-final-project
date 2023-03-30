# data "aws_lbs" "loadbalancers" {
#   for_each = var.loadbalancer-tags
#   tags = {
#     "kubernetes.io/service-name" = each.value
#   }

# }

data "aws_lb" "sock-shop-loadbalancer" {
  tags = {
    "kubernetes.io/service-name" = "sock-shop/front-end"
  }
}
data "aws_lb" "voting-app-loadbalancer" {
  tags = {
    "kubernetes.io/service-name" = "voting-application/voting-service"
  }
}
# output "loadbalancers" {
#   value = data.aws_lbs.loadbalancers
# }
# output "load_balancer_dns_names" {
#   value = {
#     for service_name, load_balancer in data.aws_lbs.loadbalancers : service_name => load_balancer.tags["kubernetes.io/service-name"]
#   }
# }
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


