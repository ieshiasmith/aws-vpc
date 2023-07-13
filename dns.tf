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

# /*
#   "flatten" the loop by creating a combined list of maps, 
#   with each map containing both the app name and its respective domain_validation_options value
# */
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

# # Now use the local.validation_options to generate records for each cert validation
# resource "aws_route53_record" "app_cert_validation" {
#   for_each = { for vo in local.validation_options : "${vo.app}-${replace(vo.name, ".", "-")}" => vo }

#   name    = each.value.name
#   type    = each.value.type
#   zone_id = data.aws_route53_zone.hashidemos.zone_id
#   records = [each.value.record]
#   ttl     = 60
# }

# resource "aws_acm_certificate_validation" "app_cert" {
#   for_each = toset(local.apps)
  
#   certificate_arn         = aws_acm_certificate.app_certs[each.key].arn
#   validation_record_fqdns = [for record in aws_route53_record.app_cert_validation : record.fqdn if contains(record.key, each.key)]
# }
