# 📝 AWS S3 Static Resume

**Available at:** [resume.jeremeybingham.com](https://resume.jeremeybingham.com)
🌐 Currently served via **S3 + CloudFront distribution**.

A resume template in progress, inspired by the [Cloud Resume Challenge](https://cloudresumechallenge.dev/docs/the-challenge/aws/).

Also check out:
**Google Cloud Run** version of this resume: [gcp-resume.jeremeybingham.com](https://gcp-resume.jeremeybingham.com)

Coming soon:
1. 🦀 **Implementations in Go and Rust**.
2. 🌑 **Bonus day/night mode** (coming to this resume soon!).


## 🚀 To Deploy

What you need for this:
- 📝 Your own HTML and CSS resume files.
- 🌐 An AWS Route 53 Hosted Zone `example.com`.
- 🔒 A single valid SSL certificate covering that domain AND `*.example.com`.
- 🏷️ A subdomain you'd like to use, like: `resume.example.com`.
- 🌍 A globally-unique string to use as your bucket name.

Look at `variables.tf` for these settings.
All files should be in the same directory as `main.tf`.

## 📒 Log/Notes

### 📅 6/11/24
Finally got Terraform working more or less properly to provide more details of the current/initial deployment.

**Commit for this entry:** [f174e0](https://github.com/jeremeybingham/resume/commit/f174e02f38457e188c3bc40d8d2a97e3859de3e3)

### 📅 6/6/24
Initial commit, just adding the raw HTML for now as I've got the deployment corrected manually but need to fix some permissions to deploy via Terraform.

**Commit for this entry:** [215d13](https://github.com/jeremeybingham/resume/commit/215d1332a99510c9105b8c363066b09814529fd8)
