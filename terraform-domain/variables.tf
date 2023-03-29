# variable "encrypted-sock-shop-loadbalancer" {
#   description = "The loadbalancer for the sock-shop"

# }

# variable "encrypted-voting-app-loadbalancer" {
#   description = "The loadbalancer for the votingapp"

# }

variable "loadbalancer-tags" {
  description = "The tags for the loadbalancer"
  type        = map(string)
  default = {
    "kubernetes.io/service-name"  = "sock-shop/front-end"
    "kubrernetes.io/service-name" = "voting-application/voting-service"
  }
}
variable "subdomains" {
  type = map(string)
  default = {
    "sock-shop/front-end"               = "sock-shop.altschool-demo.me"
    "voting-application/voting-service" = "vote.altschool-demo.me"
  }
}
variable "region" {
  description = "The region to deploy to"
  default     = "us-east-1"

}

