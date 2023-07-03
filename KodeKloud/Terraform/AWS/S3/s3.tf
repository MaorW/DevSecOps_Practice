resource "aws_s3_bucket" "finance" {
  bucket = "finance-21092020"
  tags = {
    Description = "Finance and Payroll"
  }
}

resource "aws_s3_bucket_object" "finance-2020" {
  content = "/root/finance/fincnae-2020.doc"
  key = "finance-2020.doc"
  bucket = aws_s3_bucket.finance.id
}

data "aws_iam_group" "fincnae-data" {
  group_name = "finance-analysts"
}

resource "aws_s3_bucket_policy" "fincnae-policy" {
  bucket = aws_s3_bucket.finance.id
  policy = <<EOF
    {
        "Version": "2012-10-17",
        "Statement": [
            {
                "Action": "*",
                "Effect": "Allow",
                "Resource": ["arn:aws:s3:::${aws_s3_bucket.finance.id}/*"]
                "Principal": {
                    "AWS": [
                        "${data.aws_iam_group.finance-data.arn}"
                    ]
                }
            }
        ]
    }
  EOF
}


resource "aws_s3_object" "upload" {
  bucket = "pixar-studios-2020"
  key    = "woody.jpg"
  source = "/root/woody.jpg"
}
