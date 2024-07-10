# Terraform AWS Infrastructure Project

This project uses Terraform to set up a basic AWS infrastructure, including a VPC, subnets, an Internet Gateway, a route table, security groups, an EC2 instance, and a network interface. The EC2 instance is configured to run a simple web server.

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) installed on your local machine
- An AWS account
- AWS CLI configured with appropriate credentials
- A public SSH key for accessing the EC2 instance

## Project Structure

- `main.tf`: Contains the main Terraform configuration for the resources.
- `variables.tf`: Defines the variables used in the project.
- `outputs.tf`: Specifies the outputs of the Terraform configuration.
- `terraform.tfvars`: Provides the values for the variables.

## Usage

1. **Clone the Repository**

   ```bash
   git clone <repository-url>
   cd <repository-directory>