# AWS Network Load Balancer (NLB) with TCP & TLS Listeners using Terraform

This Terraform project provisions an AWS Network Load Balancer (NLB) with both TCP and TLS listeners. The architecture is designed to handle both SSL-terminated and non-SSL traffic, and it incorporates features like Auto Scaling Groups and private subnets for enhanced security and scalability.

# Key Components

1. Network Load Balancer (NLB): The central component, distributing traffic across multiple EC2 instances based on TCP or TLS protocols.

2. TCP & TLS Listeners: The NLB is configured with listeners for both TCP (non-SSL) and TLS (SSL) traffic.

3. SSL Termination: The NLB can optionally terminate SSL connections, allowing backend instances to handle plain HTTP traffic.

4. Auto Scaling Groups (ASGs): Dynamically scale the number of EC2 instances based on demand, ensuring optimal performance and cost efficiency.

5. Private Subnets: The EC2 instances are placed in private subnets for enhanced security, accessible only through the NLB.

6. AWS Certificate Manager (ACM): Manages SSL/TLS certificates for secure communication.

7. Amazon SNS: Sends email notifications for events related to the infrastructure.

8. Terraform: Infrastructure as Code (IaC) tool used to define and provision the entire architecture.

# Prerequisites

1. AWS Account: An active AWS account is required to deploy the infrastructure.
2. Terraform: Install Terraform on your local machine.
3. AWS CLI: Configure the AWS CLI with your credentials.


