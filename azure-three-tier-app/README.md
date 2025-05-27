# Azure Three-Tier Enterprise Application

This project implements a highly secure and resilient three-tier enterprise application architecture on Azure. It utilizes various Azure services and Terraform for infrastructure management, integrated with GitHub for automation.

## Architecture Overview

The application is structured into three main tiers:

1. **Frontend**: The user interface of the application, hosted on Azure App Service.
2. **Backend**: The business logic layer, implemented in Python and hosted on Azure App Service.
3. **Database**: The data storage layer, utilizing Azure SQL Database with geo-replication for high availability.

## Azure Services Used

- **Azure Front Door**: Provides global load balancing and application acceleration.
- **Azure App Service**: Hosts the frontend and backend applications.
- **Azure Logic Apps**: Automates workflows and integrates services.
- **Azure SQL Database**: Manages relational data with geo-replication for disaster recovery.

## Infrastructure Management

The infrastructure is defined using Terraform, with the following files:

- `infrastructure/main.tf`: Main configuration file for the overall infrastructure.
- `infrastructure/variables.tf`: Input variables for the Terraform configuration.
- `infrastructure/outputs.tf`: Outputs from the Terraform configuration.

### Modules

The project is organized into modules for better management:

- **Front Door**: Configuration for Azure Front Door.
- **App Service**: Configuration for Azure App Service.
- **Logic Apps**: Configuration for Azure Logic Apps.
- **SQL Database**: Configuration for Azure SQL Database.
- **Networking**: Configuration for Azure Virtual Network and subnets.

## Automation with GitHub Actions

The project includes GitHub Actions workflows for:

- **Terraform Deployment**: Automating the deployment of infrastructure.
- **CI/CD**: Automating the build and deployment process for the application.

## Setup Instructions

1. Clone the repository.
2. Navigate to the `infrastructure` directory.
3. Initialize Terraform:
   ```
   terraform init
   ```
4. Plan the deployment:
   ```
   terraform plan
   ```
5. Apply the configuration:
   ```
   terraform apply
   ```

## Usage Guidelines

- Update the input variables in `infrastructure/variables.tf` as needed.
- Modify the application code in the `src` directory.
- Use the GitHub Actions workflows for continuous integration and deployment.

## License

This project is licensed under the MIT License. See the LICENSE file for more details.