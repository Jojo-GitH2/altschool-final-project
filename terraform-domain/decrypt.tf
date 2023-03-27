# data "aws_kms_key" "altschool-kubernetes" {
#   key_id = "alias/eks/altschool-kubernetes"
# }

# data "aws_kms_secrets" "decrypt_dns" {
#   secret {
#     name                 = "sock-shop-dns"
#     payload              = var.encrypted-sock-shop-loadbalancer
#     # encryption_algorithm = "SYMMETRIC_DEFAULT"
#     # key_id               = data.aws_kms_key.altschool-kubernetes.key_id
#   }

#   secret {
#     name                 = "voting-app-dns"
#     payload              = var.encrypted-voting-app-loadbalancer
#     # encryption_algorithm = "SYMMETRIC_DEFAULT"
#     # key_id               = data.aws_kms_key.altschool-kubernetes.key_id
#   }
# }