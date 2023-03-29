
# data "aws_elb_hosted_zone_id" "elb_zone_id" {
#   name = "sock-shop.altschool-demo.me"
#   depends_on = [

#   ]
# }

resource "aws_route53_zone" "altschool_demo_me" {
  name    = "altschool-demo.me"
  comment = "main domain"
}

resource "aws_route53_record" "loadbalancers" {
  for_each = { for lb in data.aws_lb.loadbalancers : lb.arn => lb.dns_name }
  zone_id  = aws_route53_zone.altschool_demo_me.zone_id
  name     = var.subdomains[each.value.tags.KubernetesServiceName]
  type     = "CNAME"
  ttl      = "300"
  records  = [each.value.dns_name]
}

# resource "aws_route53_zone" "votingapp-domain" {
#   name    = "vote.altschool-demo.me"
#   comment = "votingapp domain"
# }

# resource "aws_route53_record" "sock-shop" {
#   name    = "sock-shop.altschool-demo.me"
#   type    = "A"
#   zone_id = aws_route53_zone.altschool_demo_me.zone_id

#   alias {
#     name                   = data.aws_lb.sock-shop-loadbalancer.dns_name
#     zone_id                = data.aws_lb.sock-shop-loadbalancer.zone_id
#     evaluate_target_health = true
#   }
# }

# data "aws_elb_hosted_zone_id" "elb_zone_id" {
#   depends_on = [
#     data.aws_lb.sock-shop-loadbalancer,
#     data.aws_lb.voting-app-loadbalancer
#   ]
# }

# resource "aws_route53_record" "sock-shop" {
#   zone_id = aws_route53_zone.sock-shop-domain.zone_id
#   name    = "sock-shop.altschool-demo.me"
#   type    = "A"
#   alias {
#     name                   = "sock-shop.altschool-demo.me"
#     zone_id                = data.aws_elb_hosted_zone_id.elb_zone_id.id
#     evaluate_target_health = true
#   }
# }

# resource "aws_route53_record" "voting-app" {
#   zone_id = aws_route53_zone.altschool_demo_me.zone_id
#   name    = "vote.altschool-demo.me"
#   type    = "A"
#   alias {
#     name                   = data.aws_lb.voting-app-loadbalancer.dns_name
#     zone_id                = data.aws_lb.voting-app-loadbalancer.zone_id
#     evaluate_target_health = true
#   }
# }


