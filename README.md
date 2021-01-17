# Terraform Demo

## About The Project
This repo contains the source code that I used to learn Terraform. It applies some Terraform best practice to provide the quick learning and understanding about Terraform. The reference for this repo is from the [A Comprehensive Guide to Terraform](https://blog.gruntwork.io/a-comprehensive-guide-to-terraform-b3d32832baca) series.


## Getting Started
### Structure
```
terraform-demo
├── live                # This will contain the tf files of the environments 
│   ├── prod            # Use module to resuable code
|   │   ├── main.tf
│   └── staging         # Do not use module, for testing purpose
|       ├── main.tf
|       └── variables.tf
├── modules             # This will contain the reusable modules 
│   └── simple-webserver
|       ├── main.tf
|       └── variables.tf
└── setup-s3-dynamodb-backend   # This will setup the S3 remote backend for all the tf states
       ├── main.tf
       └── variables.tf
```
### Usage
1. Install the Terraform CLI [here](https://learn.hashicorp.com/tutorials/terraform/install-cli)
2. Create the IAM user with neccessary permission, then fill the, `aws_access_key`, `aws_secret_key` in the `variables.tf` files.
3. Go to the `setup-s3-dynamodb-backend` folder and run `terraform apply` to create the backend first
4. Run `terraform init` and then `terraform apply` to test the code. Remember to run `terraform destroy` to avoid the charge from AWS


## License
Distributed under the MIT License. See [LICENSE](./LICENSE.txt) for more information.

## Contact
Bang Le - lecongbang314@gmail.com

