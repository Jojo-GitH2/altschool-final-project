variable "sock-shop-loadbalancer" {
  description = "The loadbalancer for the sock-shop"

}

variable "voting-app-loadbalancer" {
  description = "The loadbalancer for the votingapp"

}

variable "region" {
  description = "The region to deploy to"
  default     = "us-east-1"

}

