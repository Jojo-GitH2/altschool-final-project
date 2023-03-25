
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
  name = "vote.altschool-demo.me"
  comment = "votingapp domain"
}

data "aws_elb_hosted_zone_id" "elb_zone_id" {
  depends_on = [
    aws_route53_zone.sock-shop-domain,
    aws_route53_zone.votingapp-domain
  ]
}
