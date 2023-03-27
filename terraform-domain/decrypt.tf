data "aws_kms_key" "altschool-kubernetes" {
  key_id = "alias/eks/altschool-kubernetes"
}

data "aws_kms_secrets" "decrypt_arn" {
  secret {
    name    = "sock-shop-arn"
    payload = var.encrypted-sock-shop-loadbalancer
    # encryption_algorithm = "SYMMETRIC_DEFAULT"
    # key_id               = data.aws_kms_key.altschool-kubernetes.key_id
  }

#   secret {
#     name    = "voting-app-arn"
#     payload = var.encrypted-voting-app-loadbalancer
#     # encryption_algorithm = "SYMMETRIC_DEFAULT"
#     # key_id               = data.aws_kms_key.altschool-kubernetes.key_id
#   }
}