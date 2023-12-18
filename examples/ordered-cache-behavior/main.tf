module "test_website" {
  source      = "../../"
  name_prefix = "test-website"

  providers = {
    aws.main = aws.main
    aws.acm  = aws.acm
  }

  website_domain_name = "test.com"

  create_acm_certificate = true

  create_route53_hosted_zone = true

  cloudfront_additional_origins = [
    {
      domain_name = "api.test.com"
      origin_id   = "api"
      custom_origin_config = {
        http_port              = 80
        https_port             = 443
        origin_protocol_policy = "https-only"
        origin_ssl_protocols   = ["TLSv1.2"]
      }
    }
  ]

  cloudfront_ordered_cache_behaviors = [
    {
      allowed_methods          = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
      cached_methods           = ["GET", "HEAD", "OPTIONS"]
      cache_policy_id          = "5135ea2d-6df8-44a3-9df3-7b5a85be39ac"
      origin_request_policy_id = "c689b0a8-63d1-40ab-baf2-98738f2966ad"
      path_pattern             = "api/*"
      target_origin_id         = "api"
      viewer_protocol_policy   = "redirect-to-https"
    }
  ]
}
