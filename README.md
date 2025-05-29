# High-Level Design (HLD) – Azure Enterprise Application Modernization

## Overview

This document outlines the high-level design for migrating and modernizing a three-tier enterprise application to Microsoft Azure. The solution is designed for global access, high availability (99.99%), strong security controls, and compliance with regulations such as GDPR. Infrastructure will be provisioned using **Terraform** and automated through **GitHub Actions**.

---

## Architecture Diagram (Conceptual)

Client (Web/Mobile)
↓
Azure Front Door (Global Routing, SSL Offload, WAF)
↓
Azure App Service (Frontend)
↓
Azure Logic Apps (Business Logic)
↓
Azure SQL Database (Data Tier, Geo-Replication)


---

## Components

### 1. **Frontend**
- **Service**: Azure App Service (Standard or Premium tier)
- **Features**:
  - Autoscaling enabled
  - Deployment slots for blue-green releases
  - Private integration with VNet
  - TLS termination handled by Azure Front Door

### 2. **Business Logic**
- **Service**: Azure Logic Apps
- **Features**:
  - Stateless workflows for orchestrating backend tasks
  - Integrated with Azure services and APIs
  - Deployed in a dedicated integration service environment (ISE) if isolation is required

### 3. **Database Tier**
- **Service**: Azure SQL Database
- **Features**:
  - Geo-redundant with active geo-replication
  - Transparent Data Encryption (TDE) and Always Encrypted enabled
  - Private Endpoint access only
  - Long-term backup retention

---

## Networking

- **Virtual Network Design**:
  - Hub-and-spoke topology
  - Separate subnets for frontend, logic, and database tiers
  - UDRs to route traffic via the hub for inspection (if using NVA)
- **Private Endpoints**:
  - SQL Database and Logic Apps connected via Private Link
- **Global Load Balancing**:
  - Azure Front Door for global DNS-based routing, failover, and WAF
- **DNS**:
  - Azure Private DNS Zones for internal resolution of private endpoints

---

## Security and Compliance

- **Identity & Access**:
  - Azure Active Directory (AAD) for authentication
  - RBAC for role-based access control
  - Azure AD PIM for just-in-time privileged access
- **Secrets Management**:
  - Azure Key Vault for storing connection strings, secrets, and certificates
- **Network Security**:
  - NSGs applied at subnet level
  - WAF on Azure Front Door
  - Azure Firewall/NVA optional in hub for traffic inspection
- **Compliance Monitoring**:
  - Microsoft Defender for Cloud with built-in policies
  - Regulatory compliance dashboard (GDPR, ISO 27001, etc.)

---

## DevOps & Automation

- **Source Control**: GitHub
- **CI/CD Pipeline**: GitHub Actions
  - Code build, test, and deployment stages
  - Infrastructure provisioning via **Terraform**
- **Infrastructure as Code (IaC)**:
  - Modular Terraform configurations
  - State stored in Azure Storage backend with locking
  - Validated via `terraform plan`, deployed via `terraform apply` in pipeline
- **Testing**:
  - Unit tests for Logic Apps and custom code
  - Terraform validation and security checks

---

## High Availability & Disaster Recovery

- **Availability Zones**:
  - App Service and Logic Apps deployed in zone-redundant plans (if supported)
- **Disaster Recovery**:
  - All resources replicated to a secondary Azure region
  - Azure SQL Geo-Replication configured
  - Azure Front Door automatically fails over to healthy region

---

## Cost Optimization

- **Budgets & Alerts**:
  - Azure Cost Management budgets with notifications
- **Scaling**:
  - Autoscale rules for App Service
  - Consumption tier for Logic Apps where applicable
- **Reservations**:
  - Reserved capacity for App Service Plans and SQL DTUs
- **Advisor Integration**:
  - Azure Advisor recommendations reviewed regularly

---

## Assumptions

- DNS records are managed externally or via Azure DNS
- Users access services over HTTPS only
- Logic Apps are stateless; stateful workflows use Durable Functions if needed
- No hardcoded secrets; all configuration injected at runtime via Key Vault

---

## Future Enhancements

- Integrate Azure Monitor and Log Analytics for full observability
- Consider Azure API Management for managing APIs
- Evaluate use of Azure Container Apps or AKS for microservices evolution
- Enable Sentinel for SIEM integration and extended threat detection

---

## Authors

- Solution Architect: *Mike Biacsi*
- Date: *27/05/2025*

