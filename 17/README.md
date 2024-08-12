# AWS DNS to DB

This Terraform project provisions an AWS infrastructure that demonstrates the integration of DNS with a database (DB) setup. The architecture includes the following key components:

# Architecture Overview

1. **VPC (Virtual private cloud)** : The foundation of the infrastructure, providing isolation and security for the resources.
2. **Public Subnets** : Subnets with internet access, hosting the Application Load Balancer (ALB) and Bastion EC2 Instance.
3. **Private Subnets** : Subnets without direct internet access, hosting the Private EC2 Instances and Amazon RDS DB.
4. **Internet Gateway** : Enables communication between the VPC and the internet.
5. **NAT Gateway** : Allows instances in the private subnets to access the internet (for updates, etc.) without exposing them directly.
6. **Route53** : Manages DNS routing, including public DNS records for the ALB and potentially private records for internal resources.
7. **Application Load Balancer (ALB)** : Distributes incoming traffic across multiple EC2 instances, providing high availability and scalability.
8. **Bastion EC2 Instance** : A secure entry point into the private subnets for administrative access.
9. **Private EC2 Instances** : Compute resources running applications within the private subnets.
10. **Amazon RDS DB** : A managed relational database service for storing application data.
11. **AWS Certificate Manager (ACM)** :  Provides SSL/TLS certificates for secure communication (HTTPS) with the ALB.

# How it works: 

1. **Public Access**: Users access the applications via HTTPS through the ALB's public DNS name (e.g., http://dns-to-db.devopsincloud.com/app1).
2. **Load Balancing**: The ALB distributes traffic to the healthy Private EC2 Instances.
3. **Application Logic**: The Private EC2 Instances run the applications, which interact with the Amazon RDS DB for data storage and retrieval.
4. **Database Access**: The Private EC2 Instances connect to the Amazon RDS DB within the private subnets, ensuring secure data access.

# Terraform

This infrastructure is provisioned and managed using Terraform, enabling Infrastructure as Code (IaC) practices. The Terraform configuration files define the desired state of the AWS resources, allowing for consistent and repeatable deployments.

