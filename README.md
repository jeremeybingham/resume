# 📝 resume

A resume template in progress.

### 📅 6/11/24
Finally got Terraform set up more or less properly to provide more details.

- 🌐 Currently served via S3 + Cloudfront distribution on a subdomain of `jeremeybingham.com`.
- 🔒 An SSL certificate is issued for the `*.jeremeybingham.com` namespace. That ARN, plus the Hosted Zone ID of the domain and some other values, are set in `variables.tf`.

**Commit for this entry:** 


### 📅 6/6/24
I'll be updating this as I build out a few different concepts, probably:

1. 🛠️ Lambda/API Gateway-served API to retrieve in PDF/DOCX/TXT and/or build from submitted JSON.
2. 🦀 Implementations in Go and Rust.

**Commit for this entry:** [215d13](https://github.com/jeremeybingham/resume/commit/215d1332a99510c9105b8c363066b09814529fd8)



**Current version available at:** [resume.jeremeybingham.com](https://resume.jeremeybingham.com)
