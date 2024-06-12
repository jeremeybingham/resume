variable "region" {
  type        = string
  default     = "us-east-1"
}

variable "hosted_zone_id" {
  type        = string
  default     = "YOUR_HOSTED_ZONE_ID"
}

variable "subdomain" {
  description = "subdomain to use, including domain"
  type        = string
  default     = "subdomain.example.com"
}

variable "certificate_arn" {
  description = "ARN of the domain's certificate (must cover *.)"
  type        = string
  default     = "YOUR_DOMAIN_CERT_ARN"
}

variable "bucket_unique_string" {
  description = "globally unique string/name for bucket"
  type        = string
  default     = "ANY_GLOBALLY_UNIQUE_STRING"
}
