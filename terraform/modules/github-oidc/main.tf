data "aws_iam_policy_document" "github_assume_role" {

  statement {

    effect = "Allow"

    actions = [
      "sts:AssumeRoleWithWebIdentity"
    ]

    principals {

      type = "Federated"

      identifiers = [
        aws_iam_openid_connect_provider.github.arn
      ]
    }

    condition {

      test = "StringEquals"

      variable = "token.actions.githubusercontent.com:aud"

      values = [
        "sts.amazonaws.com"
      ]
    }

    condition {

      test = "StringLike"

      variable = "token.actions.githubusercontent.com:sub"

      values = [
        for repo in var.github_repositories :
        "repo:${var.github_owner}/${repo}:*"
      ]
    }

  }

}

resource "aws_iam_openid_connect_provider" "github" {
  url = "https://token.actions.githubusercontent.com"

  client_id_list = [
    "sts.amazonaws.com"
  ]

  tags = local.common_tags
}

resource "aws_iam_role" "github_actions" {

  name = local.role_name

  assume_role_policy = data.aws_iam_policy_document.github_assume_role.json

  tags = local.common_tags

}

resource "aws_iam_policy" "ecr_push" {

  name = "${local.role_name}-ecr"

  policy = jsonencode({

    Version = "2012-10-17"

    Statement = [

      {

        Effect = "Allow"

        Action = [

          "ecr:GetAuthorizationToken"

        ]

        Resource = "*"

      },

      {

        Effect = "Allow"

        Action = [

          "ecr:BatchCheckLayerAvailability",
          "ecr:CompleteLayerUpload",
          "ecr:InitiateLayerUpload",
          "ecr:PutImage",
          "ecr:UploadLayerPart",
          "ecr:BatchGetImage"

        ]

        Resource = "*"

      }

    ]

  })

  tags = local.common_tags

}

resource "aws_iam_role_policy_attachment" "github_actions" {

  role = aws_iam_role.github_actions.name

  policy_arn = aws_iam_policy.ecr_push.arn

}
