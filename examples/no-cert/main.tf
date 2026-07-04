module "test_website" {
  source      = "../../"
  name_prefix = "test-website"

  providers = {
    aws.main = aws.main
    aws.acm  = aws.acm
  }

  website_domain_name = "test.com"

  create_acm_certificate     = false
  acm_certificate_arn_to_use = "arn:aws:acm:us-east-1:123456789000:certificate/87654321-89g-bcde-d015-7456789abfde"

  create_route53_hosted_zone = true

  aws_accounts_with_read_view_log_bucket = ["mock_account"]
}
