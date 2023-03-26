
# data "aws_elb_hosted_zone_id" "elb_zone_id" {
#   name = "sock-shop.altschool-demo.me"
#   depends_on = [

#   ]
# }

resource "aws_route53_zone" "sock-shop-domain" {
  name    = "sock-shop.altschool-demo.me"
  comment = "sock-shop domain"
}

resource "aws_route53_zone" "votingapp-domain" {
  name    = "vote.altschool-demo.me"
  comment = "votingapp domain"
}

data "aws_elb_hosted_zone_id" "elb_zone_id" {
  depends_on = [
    data.aws_lb.sock-shop-loadbalancer,
    data.aws_lb.votingapp-loadbalancer
  ]
}

resource "aws_route53_record" "sock-shop" {
  zone_id = aws_route53_zone.sock-shop-domain.zone_id
  name    = "sock-shop.altschool-demo.me"
  type    = "A"
  alias {
    name                   = var.sock-shop-loadbalancer
    zone_id                = data.aws_elb_hosted_zone_id.elb_zone_id.id
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "votingapp" {
  zone_id = aws_route53_zone.votingapp-domain.zone_id
  name    = "vote.altschool-demo.me"
  type    = "A"
  alias {
    name                   = var.votingapp-loadbalancer
    zone_id                = data.aws_elb_hosted_zone_id.elb_zone_id.id
    evaluate_target_health = true
  }
}


