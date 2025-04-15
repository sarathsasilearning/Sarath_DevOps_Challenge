# Sarath DevOps Challenge - Infrastructure Documentation

This repository contains the Terraform configuration for deploying a production-ready Azure infrastructure. The infrastructure includes a Linux Web App, Application Insights, Log Analytics Workspace, Azure Front Door, Autoscaling, and monitoring configurations.

---

## Table of Contents
1. [Overview](#overview)
2. [Modules](#modules)
3. [Variables](#variables)
4. [Outputs](#outputs)
5. [Deployment Instructions](#deployment-instructions)
6. [Testing](#testing)
7. [CI/CD Pipelines](#ci-cd-pipelines)

---

## Overview

The infrastructure is designed to deploy and manage a Linux Web App in Azure with the following features:
- **Resource Group**: Centralized resource management.
- **Log Analytics Workspace**: Centralized logging and monitoring.
- **Application Insights**: Application performance monitoring.
- **Linux Web App**: A secure and scalable web application.
- **Azure Front Door**: Global load balancing and content delivery.
- **Autoscaling**: Dynamic scaling based on CPU and memory usage.
- **Monitoring and Alerts**: Real-time alerts for critical metrics.

---

## Modules

The infrastructure is modularized for reusability and scalability. Below are the modules used:

### 1. **Resource Group**
- **Path**: `./modules/resource_group`
- **Description**: Creates an Azure Resource Group.
- **Outputs**:
  - `resource_group_name`: Name of the resource group.
  - `location`: Location of the resource group.

### 2. **Log Analytics Workspace**
- **Path**: `./modules/log_analytics_workspace`
- **Description**: Creates a Log Analytics Workspace for centralized logging.
- **Outputs**:
  - `workspace_id`: ID of the Log Analytics Workspace.

### 3. **Application Insights**
- **Path**: `./modules/application_insights`
- **Description**: Creates an Application Insights resource for monitoring.
- **Outputs**:
  - `app_insights_id`: ID of the Application Insights resource.
  - `app_insights_instrumentation_key`: Instrumentation key for Application Insights.
  - `connection_string`: Connection string for Application Insights.

### 4. **Service Plan**
- **Path**: `./modules/service_plan`
- **Description**: Creates an Azure App Service Plan.
- **Outputs**:
  - `id`: ID of the Service Plan.

### 5. **Linux Web App**
- **Path**: `./modules/linux_web_app`
- **Description**: Deploys a Linux Web App with secure configurations.
- **Outputs**:
  - `web_app_name`: Name of the Web App.
  - `default_hostname`: Default hostname of the Web App.
  - `id`: ID of the Web App.

### 6. **Azure Front Door**
- **Path**: `./modules/azure_front_door`
- **Description**: Configures Azure Front Door for global load balancing.
- **Outputs**:
  - `cdn_frontdoor_profile_id`: ID of the Front Door profile.
  - `cdn_frontdoor_endpoint_id`: ID of the Front Door endpoint.
  - `cdn_frontdoor_origin_group_id`: ID of the Front Door origin group.
  - `cdn_frontdoor_origin_id`: ID of the Front Door origin.
  - `cdn_frontdoor_route_id`: ID of the Front Door route.
  - `cdn_frontdoor_firewall_policy_id`: ID of the Front Door firewall policy.
  - `cdn_frontdoor_security_policy_id`: ID of the Front Door security policy.

### 7. **Autoscale**
- **Path**: `./modules/autoscale`
- **Description**: Configures autoscaling for the Web App based on CPU and memory usage.
- **Outputs**:
  - `autoscale_id`: ID of the autoscale setting.

### 8. **Monitor Action Group**
- **Path**: `./modules/monitor_action_group`
- **Description**: Creates an Action Group for alert notifications.
- **Outputs**:
  - `action_group_id`: ID of the Action Group.

### 9. **Metric Alerts**
- **Path**: `./modules/monitor_metric_alerts`
- **Description**: Configures metric-based alerts for monitoring.

---

## Variables

The infrastructure uses the following variables defined in `variables.tf`:

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

---

## Outputs

The following outputs are available at the root level:

| Output Name                | Description                                      |
|----------------------------|--------------------------------------------------|
| `resource_group_name`      | Name of the resource group.                     |
| `web_app_name`             | Name of the Linux Web App.                      |
| `default_hostname`         | Default hostname of the Web App.                |
| `app_insights_id`          | ID of the Application Insights resource.        |
| `autoscale_id`             | ID of the autoscale setting.                    |
| `cdn_frontdoor_profile_id` | ID of the Front Door profile.                   |

For a complete list of outputs, refer to the `outputs.tf` file.

---

## Deployment Instructions

### Prerequisites
1. Install [Terraform](https://www.terraform.io/downloads.html).
2. Configure Azure CLI and authenticate:
   ```bash
   az login
   ```

### Steps
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

---

## Testing

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

### SonarQube
The repository includes a SonarQube scan workflow to ensure code quality. Trigger the workflow manually or on a push to the `main` branch.

---

## CI/CD Pipelines

The repository includes the following GitHub Actions workflows:

1. **Build and Test**:
   - Path: `.github/workflows/build_and_test.yml`
   - Runs Node.js tests and builds the static website.

2. **Infrastructure Deployment**:
   - Path: `.github/workflows/infra_deploy.yml`
   - Deploys the infrastructure using Terraform.

3. **SonarQube Scan**:
   - Path: `.github/workflows/sonar_scan.yml`
   - Scans the codebase for quality and security issues.

4. **WebApp Deployment**:
   - Path: `.github/workflows/webapp_deploy.yml`
   - Deploys the static website to the Linux Web App.

5. **API Client**:
   - Path: `.github/workflows/api_client.yml`
   - Fetches GitHub issues using a Python script.

---

## Notes

- Ensure sensitive information like Azure credentials is stored securely in GitHub Secrets.
- Use the `terraform.tfvars` file to customize the deployment for different environments.
- For any issues, refer to the logs generated by the GitHub Actions workflows.

--- 

## License

This project is licensed under the MIT License. See the `LICENSE` file for details.
