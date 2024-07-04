# Terraform S3 Buckets Setup

This Terraform configuration sets up three Amazon S3 buckets with versioning and lifecycle policies. The buckets are used for state storage, artifact storage, and deployment context.

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

- `state_bucket_name`: Name of the state bucket.
- `artifact_bucket_name`: Name of the artifact bucket.
- `deployment_context_bucket_name`: Name of the deployment context bucket.
- `force_destroy_value`: Boolean to force destroy the buckets.
- `state_bucket_expiration_days`: Number of days after which objects in the state bucket expire.
- `noncurrent_version_expiration_days_for_state_bucket`: Number of days after which noncurrent versions in the state bucket expire.
- `artifact_bucket_expiration_days`: Number of days after which objects in the artifact bucket expire.
- `noncurrent_version_expiration_days_for_artifact_bucket`: Number of days after which noncurrent versions in the artifact bucket expire.
- `noncurrent_version_transition_artifact_bucket`: Number of days after which noncurrent versions in the artifact bucket transition to a different storage class.
- `deployment_context_expiration_days`: Number of days after which objects in the deployment context bucket expire.
- `noncurrent_version_expiration_days_for_deployment_context_bucket`: Number of days after which noncurrent versions in the deployment context bucket expire.
- `noncurrent_version_transition_deployment_context_bucket`: Number of days after which noncurrent versions in the deployment context bucket transition to a different storage class.
- `storage_class_value`: Storage class to which noncurrent versions transition.
- `tags`: Map of tags to assign to the buckets.

# Outputs

**State Bucket ID**
**Artifact Bucket ID**
**Deployment Context Bucket ID**

# Resources

`aws_s3_bucket.state_bucket`: Creates an S3 bucket for state storage.
`aws_s3_bucket_versioning.state_bucket_versioning`: Enables versioning for the state bucket.
`aws_s3_bucket_lifecycle_configuration.state_bucket_lifecycle`: Sets up lifecycle rules for the state bucket.
`aws_s3_bucket.artifact_bucket`: Creates an S3 bucket for artifact storage.
`aws_s3_bucket_versioning.artifact_bucket_versioning`: Enables versioning for the artifact bucket.
`aws_s3_bucket_lifecycle_configuration.artifact_bucket_lifecycle`: Sets up lifecycle rules for the artifact bucket.
`aws_s3_bucket.deployment_context`: Creates an S3 bucket for deployment context.
`aws_s3_bucket_versioning.deployment_context_bucket_versioning`: Enables versioning for the deployment context bucket.
`aws_s3_bucket_lifecycle_configuration.deployment_context_lifecycle`: Sets up lifecycle rules for the deployment context bucket.

# Notes

- Ensure your AWS credentials are correctly configured to allow Terraform to create resources in your AWS account. 
- Adjust the variable values as needed for your specific requirements.
