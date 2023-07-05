resource "aws_iam_user" "admin-user" {
  name = "lucy"
  tags = {
    Description = "Technical Team Leader"
  }
}

resource "aws_iam_policy" "adminUser" {
  name = "AdminUsers"
  policy = <<EOF
  {
    "Version": "2012-10-17"
    "Statements": [
        {
            "Effect": "Allow"
            "Action": "*"
            "Resource": "*"
        }
    ]
  }
  EOF
}

##########################################
# We can also use the admin-policy.json file instead hardcoded the policies
esource "aws_iam_policy" "adminUser" {
  name = "AdminUsers"
  policy = file("admin-policy.json")
}
##########################################

resource "aws_iam_user_policy_attachment" "lucy-admin-access" {
  user = aws_iam_user.admin-user.name
  policy_arn = aws_iam_policy.adminUser.arn
}