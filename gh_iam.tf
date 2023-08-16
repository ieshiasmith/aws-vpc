
#https://docs.prod.secops.hashicorp.services/doormat/gha/#configure-your-github-action-workflow-for-doormat-authorization
resource "aws_iam_role" "doormat_packer_role" {
  name = "doormat_packer_role"
  tags = {
    hc-service-uri = "github.com/demoland/packer@main"
  }
  max_session_duration = 43200 # THE GHA will create a session up to 7200
  assume_role_policy   = data.aws_iam_policy_document.assume_dfedick.json
  inline_policy {
    name   = "PackerRepoPolicyPermissions"
    policy = data.aws_iam_policy_document.assume_dfedick.json
  }
}

data "aws_iam_policy_document" "assume_dfedick" {
  statement {
    actions = [
      "sts:AssumeRole",
      "sts:SetSourceIdentity",
      "sts:TagSession"
    ]
    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::548514454989:user/aws_daniel.fedick_test-developer/daniel.fedick@hashicorp.com"]
    }
  }
}

# The following is just for completeness 
data "aws_iam_policy_document" "describe_resources" {
  statement {
    actions   = ["ec2:DescribeRegions"]
    resources = ["*"]
  }
}
