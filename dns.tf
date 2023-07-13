# # Get the route53 zone

# data "aws_route53_zone" "hashidemos" {
#   name         = "daniel-fedick.sbx.hashidemos.io"
#   private_zone = false
# }

# locals {
#   apps = ["consul", "vault", "nomad", "terraform", "boundary"]
# }

# resource "aws_acm_certificate" "app_certs" {
#   for_each = toset(local.apps)
  
#   domain_name       = "${each.value}.daniel-fedick.sbx.hashidemos.io"
#   validation_method = "DNS"

#   tags = {
#     Name = "${upper(each.value)}Certificate"
#   }

#   lifecycle {
#     create_before_destroy = true
#   }
# }

# locals {
#   validation_options = flatten([
#     for app in local.apps : [
#       for dvo in aws_acm_certificate.app_certs[app].domain_validation_options : {
#         app    = app
#         name   = dvo.resource_record_name
#         record = dvo.resource_record_value
#         type   = dvo.resource_record_type
#       }
#     ]
#   ])
# }


# output "validation_options" {
#   value = local.validation_options
# }
