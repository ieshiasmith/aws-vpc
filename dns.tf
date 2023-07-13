# Get the route53 zone
data "aws_route53_zone" "hashidemos" {
  name         = "daniel-fedick.sbx.hashidemos.io"
  private_zone = false
}

locals {
  apps = ["consul", "vault", "nomad", "terraform", "boundary"]
}

resource "aws_acm_certificate" "app_certs" {
  for_each = toset(local.apps)
  
  domain_name       = "${each.value}.daniel-fedick.sbx.hashidemos.io"
  validation_method = "DNS"

  tags = {
    Name = "${upper(each.value)}Certificate"
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "null_resource" "cert_validation_records" {
  for_each = {
    for app in local.apps : 
      for dvo in aws_acm_certificate.app_certs[app].domain_validation_options : "${app}-${dvo.domain_name}" => {
        name   = dvo.resource_record_name
        record = dvo.resource_record_value
        type   = dvo.resource_record_type
      }
  }

  provisioner "local-exec" {
    command = "aws route53 change-resource-record-sets --hosted-zone-id ${data.aws_route53_zone.hashidemos.zone_id} --change-batch '{\"Changes\":[{\"Action\":\"UPSERT\",\"ResourceRecordSet\":{\"Name\":\"${each.value.name}\",\"Type\":\"${each.value.type}\",\"TTL\":60,\"ResourceRecords\":[{\"Value\":\"${each.value.record}\"}]}}]}'"
  }
}

resource "aws_acm_certificate_validation" "app_cert" {
  for_each = toset(local.apps)

  certificate_arn         = aws_acm_certificate.app_certs[each.key].arn
  validation_record_fqdns = [for record in null_resource.cert_validation_records : record.triggers.name if contains(record.triggers.name, each.key)]
}
