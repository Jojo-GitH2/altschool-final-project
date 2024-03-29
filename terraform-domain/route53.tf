
# data "aws_elb_hosted_zone_id" "elb_zone_id" {
#   name = "sock-shop.altschool-demo.me"
#   depends_on = [

#   ]
# }

# resource "aws_route53_zone" "altschool_demo_me" {
#   name    = "altschool-demo.me"
#   comment = "main domain"
# }

# locals {
#   zone_id = aws_route53_zone.altschool_demo_me.id
# }

# resource "aws_route53_record" "loadbalancers" {
#   for_each = var.subdomains
#   name     = each.value
#   zone_id  = local.zone_id
#   type     = "A"
#   # ttl      = "300"
#   alias {
#     name                   = data.aws_lbs.loadbalancers[each.value].dns_name
#     zone_id                = data.aws_lbs.loadbalancers[each.value].zone_id
#     evaluate_target_health = true
#   }
# }

resource "aws_route53_zone" "sock-shop-domain" {
  name = "sock-shop.altschool-demo.me"
}
resource "aws_route53_zone" "voting-app-domain" {
  name = "vote.altschool-demo.me"
}

data "aws_elb_hosted_zone_id" "elb_zone_id" {

}

resource "aws_route53_record" "sock-shop-record" {
  zone_id = aws_route53_zone.sock-shop-domain.zone_id
  name    = "sock-shop.altschool-demo.me"
  type    = "A"

  alias {
    name                   = data.aws_lbs.loadbalancers["sock-shop/frontend"].arns
    zone_id                = data.aws_elb_hosted_zone_id.elb_zone_id.id
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "voting-app-record" {
  zone_id = aws_route53_zone.voting-app-domain.zone_id
  name    = "vote.altschool-demo.me"
  type    = "A"

  alias {
    name                   = data.aws_lbs.loadbalancers["voting-application/voting-service"].arns
    zone_id                = data.aws_elb_hosted_zone_id.elb_zone_id.id
    evaluate_target_health = true
  }
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


