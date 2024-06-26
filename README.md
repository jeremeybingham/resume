# 🧾 AWS S3 Static Resume Via Terraform

This repository contains the code for: [resume.jeremeybingham.com](https://resume.jeremeybingham.com).

### Some other resume templates in progress, inspired by the [Cloud Resume Challenge](https://cloudresumechallenge.dev/docs/the-challenge/aws/):

🌤️ **Google Cloud Run/Docker/CI/CD** version: [gcp-resume.jeremeybingham.com](https://gcp-resume.jeremeybingham.com) 
repo/code: [gcp-resume](https://github.com/jeremeybingham/gcp-resume)

💽 **S3 Static with Github Actions CI/CD** version: [aws-s3-static.jeremeybingham.com](https://aws-s3-static.jeremeybingham.com) 
repo/code: [aws-s3-static](https://github.com/jeremeybingham/aws-s3-static)

Coming soon:
1. 🦀 **Implementations in Go and Rust**.
2. 🌙 **Day/night mode toggle** - (already on [gcp-resume](https://gcp-resume.jeremeybingham.com)!)


## 🚀 Deployment

This Terraform deployment creates a new bucket for your website content, adds the files to it and sets appropriate permissions, creates a Cloudfront Distribution to serve the content, handle DNS/SSL, and point the appropriate subdomain at the distribution. 

What you need for this:
- 📝 Your own HTML and CSS resume files.
- 🌐 An AWS Route 53 Hosted Zone `example.com`.
- 🔒 A single valid SSL certificate covering that domain AND `*.example.com`.
- 🏷️ A subdomain you'd like to use, like: `resume.example.com`.
- 🌍 A globally-unique string to use as your bucket name.

Look at `variables.tf` for these settings.
All files should be in the same directory as `main.tf`.


## 📒 Dev Log/Notes
Since this is my "primary resume" (the one resume.jeremeybingham.com points to,) I'll include some development notes on the various versions below as I go.

### 📅 6/25/24
Deployed a [new version](https://gcp-resume.jeremeybingham.com) on Google Cloud; includes CI/CD and Dockerized deployment; also deployed an [S3 static variant](https://github.com/jeremeybingham/aws-s3-static) featuring Github Actions-based deployment and secrets managment. Busy day! 

**Commits for this entry:** [bf8bc3](https://github.com/jeremeybingham/gcp-resume/commit/bf8bc31287f564be87867d3a8a67e9fc24bded66) & [06c41e](https://github.com/jeremeybingham/aws-s3-static/commit/06c41e7eb6bddbb0e185656cd88c16c8c642402c)

### 📅 6/11/24
Finally got Terraform working more or less properly to provide more details of the current/initial deployment.

**Commit for this entry:** [f174e0](https://github.com/jeremeybingham/resume/commit/f174e02f38457e188c3bc40d8d2a97e3859de3e3)

### 📅 6/6/24
Initial commit, just adding the raw HTML for now as I've got the deployment corrected manually but need to fix some permissions to deploy via Terraform.

**Commit for this entry:** [215d13](https://github.com/jeremeybingham/resume/commit/215d1332a99510c9105b8c363066b09814529fd8)
