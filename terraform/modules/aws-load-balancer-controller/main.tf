resource "aws_iam_policy" "this" {
  name        = "${local.name_prefix}-aws-load-balancer-controller"
  description = "IAM permissions for the AWS Load Balancer Controller"

  policy = file("${path.module}/iam_policy.json")

  tags = local.common_tags
}

data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    actions = [
      "sts:AssumeRoleWithWebIdentity"
    ]

    principals {
      type = "Federated"

      identifiers = [
        var.oidc_provider_arn
      ]
    }

    condition {
      test     = "StringEquals"
      variable = "${local.oidc_provider}:aud"
      values   = ["sts.amazonaws.com"]
    }

    condition {
      test     = "StringEquals"
      variable = "${local.oidc_provider}:sub"

      values = [
        "system:serviceaccount:${var.service_account_namespace}:${var.service_account_name}"
      ]
    }
  }
}

resource "aws_iam_role" "this" {
  name = "${local.name_prefix}-aws-load-balancer-controller"

  assume_role_policy = data.aws_iam_policy_document.assume_role.json

  tags = local.common_tags
}

resource "aws_iam_role_policy_attachment" "this" {
  role       = aws_iam_role.this.name
  policy_arn = aws_iam_policy.this.arn
}
