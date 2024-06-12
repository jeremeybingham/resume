# 📝 resume

A resume template in progress, inspired by the Cloud Resume Challenge https://cloudresumechallenge.dev/docs/the-challenge/aws/

I'll be updating this as I build out a few different concepts, probably:

1. 🛠️ Lambda/API Gateway-served API to retrieve in PDF/DOCX/TXT and/or build from submitted JSON.
2. 🦀 Implementations in Go and Rust.
3. DynanmoDB is overkill for the counter, I expiermented with a purely static implementation where `DuckDB` read/wrote a JSON file inside a lambda function, but I'll land on something equally dumb eventually.

🌐 Currently served via S3 + Cloudfront distribution
available at:** [resume.jeremeybingham.com](https://resume.jeremeybingham.com)

## to deploy

what you need for this: 
your own html and css resume files
an AWS route 53 Hosted Zone `example.com`
a single valid SSL certificate covering that domain AND `*.example.com`
a subdonain you'd like to use, like: `resume.example.com`
A globally-unique string to use as your bucket name

Look at `variables.tf for these settings.# 📝 Resume

A resume template in progress, inspired by the [Cloud Resume Challenge](https://cloudresumechallenge.dev/docs/the-challenge/aws/).

I'll be updating this as I build out a few different concepts, probably:

1. 🛠️ Lambda/API Gateway-served API to retrieve in PDF/DOCX/TXT and/or build from submitted JSON.
2. 🦀 Implementations in Go and Rust.
3. ⛓️ While DynamoDB seemed like overkill for the counter, I experimented with a purely static implementation where `DuckDB` read/wrote a JSON file inside a Lambda function. Not elegant enough, will probably jsut use Redis.

🌐 Currently served via S3 + Cloudfront distribution.
**Available at:** [resume.jeremeybingham.com](https://resume.jeremeybingham.com)

## 🚀 To Deploy

What you need for this:
- 📝 Your own HTML and CSS resume files.
- 🌐 An AWS Route 53 Hosted Zone `example.com`.
- 🔒 A single valid SSL certificate covering that domain AND `*.example.com`.
- 🏷️ A subdomain you'd like to use, like: `resume.example.com`.
- 🌍 A globally-unique string to use as your bucket name.

Look at `variables.tf` for these settings.
All files should be in the same directory as `main.tf`.

as always, to deploy:
```
terraform init
terraform plan
terraform apply
```

## 📒 Log/Notes

### 📅 6/11/24
Finally got Terraform working more or less properly to provide more details of the current/initial deployment.

**Commit for this entry:** [f174e0](https://github.com/jeremeybingham/resume/commit/f174e02f38457e188c3bc40d8d2a97e3859de3e3)

### 📅 6/6/24
Initial commit, just adding the raw HTML for now as I've got the deployment corrected manually but need to fix some permissions to deploy via Terraform.

**Commit for this entry:** [215d13](https://github.com/jeremeybingham/resume/commit/215d1332a99510c9105b8c363066b09814529fd8)
All files should be in the same directory as `main.tf`


## log/notes

### 📅 6/11/24
Finally got Terraform working more or less properly to provide more details of the current/initial deployment. 

**Commit for this entry:** [f174e0](https://github.com/jeremeybingham/resume/commit/f174e02f38457e188c3bc40d8d2a97e3859de3e3)


### 📅 6/6/24
Initial commit, just adding the raw HTML for now as I've got the deployment corrected manually but need to fix some permissions to deploy via terraform.

**Commit for this entry:** [215d13](https://github.com/jeremeybingham/resume/commit/215d1332a99510c9105b8c363066b09814529fd8)
