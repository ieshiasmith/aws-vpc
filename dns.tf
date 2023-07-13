# Get the route53 zone

data "aws_route53_zone" "hashidemos" {
  name         = "daniel-fedick.sbx.hashidemos.io"
  private_zone = false
}

# resource "aws_acm_certificate" "cert" {
#   domain_name       = "vault.daniel-fedick.sbx.hashidemos.io"
#   validation_method = "DNS"

#   tags = {
#     Name = "VaultCertificate"
#   }

#   lifecycle {
#     create_before_destroy = true
#   }
# }


# resource "aws_route53_record" "cert_validation" {
#   for_each = {
#     for dvo in aws_acm_certificate.cert.domain_validation_options : dvo.domain_name => {
#       name   = dvo.resource_record_name
#       record = dvo.resource_record_value
#       type   = dvo.resource_record_type
#     }
#   }

#   name    = each.value.name
#   type    = each.value.type
#   zone_id = data.aws_route53_zone.hashidemos.zone_id
#   records = [each.value.record]
#   ttl     = 60
# }

# resource "aws_acm_certificate_validation" "cert" {
#   certificate_arn         = aws_acm_certificate.cert.arn
#   validation_record_fqdns = [for record in aws_route53_record.cert_validation : record.fqdn]
# }
