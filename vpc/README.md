# Terraform VPC Setup

This Terraform configuration sets up a Virtual Private Cloud (VPC) with the following resources:

- VPC
- Public and Private Subnets
- Internet Gateway
- Public and Main Route Tables
- Route Table Associations for Subnets

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) installed
- AWS credentials configured

## Usage

1. **Clone the repository:**

    ```sh
    git clone https://github.com/your_username/terraform_practice.git
    cd terraform_practice/static_website_hosting
    ```

2. **Initialize Terraform:**

    ```sh
    terraform init
    ```

3. **Plan the infrastructure:**

    ```sh
    terraform plan
    ```

4. **Apply the configuration:**

    ```sh
    terraform apply
    ```

5. **Confirm the apply step by typing `yes`.

## Variables

This configuration uses the following variables which need to be defined in a `variables.tf` file or passed in via the command line or a `.tfvars` file:

- `instance_tenancy_value`: Instance tenancy option for the VPC.
- `availability_zone_value_1`: The first availability zone to use for subnets.
- `availability_zone_value_2`: The second availability zone to use for subnets.

Example `variables.tf`:

```hcl
variable "instance_tenancy_value" {
  description = "The instance tenancy option for the VPC."
  type        = string
}

variable "availability_zone_value_1" {
  description = "The first availability zone to use for subnets."
  type        = string
}

variable "availability_zone_value_2" {
  description = "The second availability zone to use for subnets."
  type        = string
}
