provider "aws" {
  region = var.region
}

# bucket
resource "aws_s3_bucket" "bucket_name" {
  bucket = var.bucket_unique_string
}

resource "aws_s3_bucket_ownership_controls" "bucket_name" {
  bucket = aws_s3_bucket.bucket_name.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_cloudfront_origin_access_identity" "origin_access_identity" {
  comment = "access Identity for S3 bucket"
}

resource "aws_s3_bucket_public_access_block" "bucket_name" {
  bucket                  = aws_s3_bucket.bucket_name.id
  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_policy" "bucket_name_policy" {
  bucket = aws_s3_bucket.bucket_name.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          AWS = aws_cloudfront_origin_access_identity.origin_access_identity.iam_arn
        }
        Action   = "s3:GetObject"
        Resource = "${aws_s3_bucket.bucket_name.arn}/*"
      }
    ]
  })
}

resource "aws_s3_bucket_acl" "bucket_name" {
  depends_on = [
    aws_s3_bucket_ownership_controls.bucket_name,
    aws_s3_bucket_public_access_block.bucket_name,
  ]
  bucket = aws_s3_bucket.bucket_name.id
  acl    = "public-read"
}

resource "aws_s3_object" "index_html" {
  bucket       = aws_s3_bucket.bucket_name.bucket
  key          = "index.html"
  source       = "index.html"
  content_type = "text/html"
}

resource "aws_s3_object" "styles_css" {
  bucket       = aws_s3_bucket.bucket_name.bucket
  key          = "styles.css"
  source       = "styles.css"
  content_type = "text/css"
}

resource "aws_s3_object" "favicon_ico" {
  bucket       = aws_s3_bucket.bucket_name.bucket
  key          = "favicon.ico"
  source       = "favicon.ico"
  content_type = "image/x-icon"
}

resource "aws_s3_object" "Jeremey_Bingham_resume_pdf" {
  bucket       = aws_s3_bucket.bucket_name.bucket
  key          = "Jeremey_Bingham_resume.pdf"
  source       = "Jeremey_Bingham_resume.pdf"
  content_type = "application/pdf"
}

resource "aws_cloudfront_distribution" "distribution_name" {
  depends_on = [
    aws_s3_bucket.bucket_name
  ]
  origin {
    domain_name = aws_s3_bucket.bucket_name.bucket_domain_name
    origin_id   = "s3-origin"

    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.origin_access_identity.cloudfront_access_identity_path
    }
  }

  enabled             = true
  is_ipv6_enabled     = true
  aliases             = [var.subdomain]
  default_root_object = "index.html"

  default_cache_behavior {
    allowed_methods  = ["GET", "HEAD"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = "s3-origin"

    forwarded_values {
      query_string = false
      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "redirect-to-https"
  }

  viewer_certificate {
    acm_certificate_arn      = var.certificate_arn
    ssl_support_method       = "sni-only"
    minimum_protocol_version = "TLSv1.2_2021"
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }
}

# route 53
resource "aws_route53_record" "cloudfront_alias" {
  zone_id = var.hosted_zone_id
  name    = var.subdomain
  type    = "A"

  alias {
    name                   = aws_cloudfront_distribution.distribution_name.domain_name
    zone_id                = aws_cloudfront_distribution.distribution_name.hosted_zone_id
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "cloudfront_alias_ipv6" {
  zone_id = var.hosted_zone_id
  name    = var.subdomain
  type    = "AAAA"

  alias {
    name                   = aws_cloudfront_distribution.distribution_name.domain_name
    zone_id                = aws_cloudfront_distribution.distribution_name.hosted_zone_id
    evaluate_target_health = false
  }
}
