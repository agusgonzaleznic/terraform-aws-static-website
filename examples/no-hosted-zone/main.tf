module "test_website" {
  source      = "../../"
  name_prefix = "test-website"

  providers = {
    aws.main = aws.main
    aws.acm  = aws.acm
  }

  website_domain_name = "test.com"

  create_acm_certificate = true

  create_route53_hosted_zone = false
  route53_hosted_zone_id     = "9876543210KJIHGFEDCBA"


  aws_accounts_with_read_view_log_bucket = ["mock_account"]
}
