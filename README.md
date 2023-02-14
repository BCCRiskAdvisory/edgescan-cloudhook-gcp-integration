
# Edgescan Cloudhook GCP Integration

A Terraform template to generate a GCP IAM Service Account for automated Edgescan onboarding.

This Terraform Template will:
- Enable the following APIs (**NOTE**: Service Usage API must be enabled):
	- Compute Engine API
	- Cloud Resource Manager API
	- Cloud DNS API

- Generate an IAM Service Account with the following project permissions:
	- Compute Network Viewer
	- DNS Reader

- Output a JSON keyfile for this IAM Service Account.

## Prerequisites

### 1. Installing Terraform  

The official instructions on installing Terraform can be found here: https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli

### 2. Installing GCP CLI

The official instructions on installing the GCP CLI can be found here: https://cloud.google.com/sdk/docs/install

## Instructions on running this template

1. Initialise the Terraform Template by running:

```
terraform init
```

2. Apply the template by running:

```
terraform apply
```

Alternatively, if you want to set the username of the GCP Service Account (to match company naming policies), you can instead apply the template with the command:

```
template apply -var="account_name=<your custom name>"
```

3. The apply command will ask for the google cloud project ID for which you want to generate the credentials.

4. Once provided, it will list the GCP resources that will be created, and prompt you to apply these changes with 'yes'.

5. At the end of the terraform apply, the **json_key_file** will be listed. Take note of the output and provide it to edgescan.
