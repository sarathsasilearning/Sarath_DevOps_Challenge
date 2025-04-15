# Azure Web App Deployment & Management Repository

This repository contains the complete setup for deploying and managing a scalable Azure Web App. It includes infrastructure provisioning using Terraform, application deployment pipelines, and an API client utility for GitHub integration. The repository is structured into three main categories: **Infrastructure**, **Application**, and **API Client**.

---

## Table of Contents
1. [Infrastructure](#infrastructure)
   - Modules
   - Variables
   - Outputs
   - Deployment Instructions
   - Infrastructure Provisioning Pipeline
   - Terratest
2. [Application](#application)
   - Overview
   - Application Code
   - Application Deployment Pipelines
3. [API Client](#api-client)
   - Overview
   - API Client Files
   - API Client Workflow

---

## Infrastructure

### Root-Level Terraform Files

| File Name            | Description                                                                                     |
|----------------------|-------------------------------------------------------------------------------------------------|
| **`main.tf`**        | The main entry point for Terraform, orchestrating all modules.                                 |
| **`provider.tf`**    | Configures the Azure provider and backend for Terraform state storage.                         |
| **`variables.tf`**   | Defines all input variables for the infrastructure.                                            |
| **`terraform.tfvars`** | Contains environment-specific values for the input variables.                                 |
| **`outputs.tf`**     | Aggregates outputs from all modules for use in other workflows.                                |

### Modules

| Module                  | Path                          | Description                              | Outputs                                   |
|-------------------------|-------------------------------|------------------------------------------|------------------------------------------|
| **Resource Group**      | `./modules/resource_group`    | Creates an Azure Resource Group.         | `resource_group_name`, `location`        |
| **Log Analytics Workspace** | `./modules/log_analytics_workspace` | Creates a Log Analytics Workspace.      | `workspace_id`                           |
| **Application Insights** | `./modules/application_insights` | Creates an Application Insights resource. | `app_insights_id`, `app_insights_instrumentation_key`, `connection_string` |
| **Service Plan**         | `./modules/service_plan`     | Creates an Azure App Service Plan.       | `id`                                     |
| **Linux Web App**        | `./modules/linux_web_app`    | Deploys a Linux Web App.                 | `web_app_name`, `default_hostname`, `id` |
| **Azure Front Door**     | `./modules/azure_front_door` | Configures Azure Front Door.             | `cdn_frontdoor_profile_id`, `cdn_frontdoor_endpoint_id`, `cdn_frontdoor_origin_group_id`, `cdn_frontdoor_origin_id`, `cdn_frontdoor_route_id`, `cdn_frontdoor_firewall_policy_id`, `cdn_frontdoor_security_policy_id` |
| **Autoscale**            | `./modules/autoscale`        | Configures autoscaling for the Web App.  | `autoscale_id`                           |
| **Monitor Action Group** | `./modules/monitor_action_group` | Creates an Action Group for alert notifications. | `action_group_id`                        |
| **Metric Alerts**        | `./modules/monitor_metric_alerts` | Configures metric-based alerts.         | `metric_alert_id`                        |

### Variables

| Variable Name              | Description                                      | Type   | Default Value |
|----------------------------|--------------------------------------------------|--------|---------------|
| `subscription_id`          | Azure subscription ID.                          | string | -             |
| `location`                 | Azure region for resources.                     | string | -             |
| `resource_group_name`      | Name of the resource group.                     | string | -             |
| `service_plan_name`        | Name of the service plan.                       | string | -             |
| `web_app_name`             | Name of the Linux Web App.                      | string | -             |
| `app_insights_name`        | Name of the Application Insights resource.      | string | -             |
| `workspace_name`           | Name of the Log Analytics Workspace.            | string | -             |
| `autoscale_name`           | Name of the autoscale setting.                  | string | -             |
| `alerts`                   | Map of alert configurations.                   | map    | -             |

For a complete list of variables, refer to the `variables.tf` file.

### Outputs

| Output Name                | Description                                      |
|----------------------------|--------------------------------------------------|
| `resource_group_name`      | Name of the resource group.                     |
| `web_app_name`             | Name of the Linux Web App.                      |
| `default_hostname`         | Default hostname of the Web App.                |
| `app_insights_id`          | ID of the Application Insights resource.        |
| `autoscale_id`             | ID of the autoscale setting.                    |
| `cdn_frontdoor_profile_id` | ID of the Front Door profile.                   |

For a complete list of outputs, refer to the `outputs.tf` file.

### Deployment Instructions
#### Prerequisites
1. Install [Terraform](https://www.terraform.io/downloads.html).
2. Configure Azure CLI and authenticate:
   ```bash
   az login
   ```

#### Steps
1. Initialize Terraform:
   ```bash
   terraform init
   ```
2. Plan the deployment:
   ```bash
   terraform plan -var-file="terraform.tfvars"
   ```
3. Apply the deployment:
   ```bash
   terraform apply -var-file="terraform.tfvars" -auto-approve
   ```

### Infrastructure Provisioning Pipeline
The infrastructure provisioning is automated using the `infra_deploy.yml` GitHub Actions workflow. It performs the following steps:
1. **Terraform Init**: Initializes the Terraform backend.
2. **Terraform Plan**: Generates an execution plan.
3. **Approval Gate**: Requires manual approval for production deployments.
4. **Terraform Apply**: Applies the Terraform configuration to provision resources.
5. **Terratest**: Runs automated tests to validate the infrastructure.

### Terratest
The infrastructure includes automated tests using Terratest. To run the tests:
1. Navigate to the `tests` directory:
   ```bash
   cd tests
   ```
2. Run the tests:
   ```bash
   go test -v -timeout 30m
   ```

---

## Application

### Overview
The application is a static website hosted on Azure Linux Web App. It includes the following components:
- **Static Website Code**: HTML, JavaScript, and Node.js server files.
- **Unit Tests**: Jest tests for validating the static website.
- **Application Deployment Pipelines**: GitHub Actions workflows for building, testing, and deploying the application.

### Application Code
- **`my-static-website/index.html`**: The main HTML file for the static website.
- **`my-static-website/server.js`**: A Node.js server for serving the static website.
- **`my-static-website/package.json`**: Defines dependencies and scripts for the Node.js application.
- **`my-static-website/tests/index.test.js`**: Contains Jest tests for validating the static website.

### Application Deployment Pipelines
The following GitHub Actions workflows are used for application deployment:
1. **`build_and_test.yml`**:
   - Builds the static website.
   - Runs unit tests using Jest.
   - Packages the application for deployment.
2. **`webapp_deploy.yml`**:
   - Deploys the static website to the Linux Web App.
   - Includes approval gates for staging and production environments.
3. **`sonar_scan.yml`**:
   - Performs code quality checks using SonarQube.
4. **`deploy.yml`**:
   - Handles the deployment of the application to Azure Web App.
   - Downloads the build artifact and deploys it to the target environment.

---

## API Client

### Overview
The API client is a Python-based utility for fetching GitHub issues from a specified repository. It supports pagination and handles rate-limiting.

### API Client Files
- **`api_client/api_client.py`**: A Python script that uses the GitHub API to fetch issues.
- **`api_client/github_issues.json`**: Stores the fetched GitHub issues in JSON format.

### API Client Workflow
The `api_client.yml` GitHub Actions workflow automates the execution of the API client. It performs the following steps:
1. Sets up Python and installs dependencies.
2. Executes the `api_client.py` script to fetch GitHub issues.
3. Uploads the fetched issues as an artifact.

---

## Notes
- Ensure sensitive information like Azure credentials is securely stored in **GitHub Secrets**.
- Use the `terraform.tfvars` file to customize the deployment for different environments.
- For any issues, refer to the logs generated by the GitHub Actions workflows.

---