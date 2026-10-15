# AZ-104 Hands-on Lab 03

## NSG, Network Watcher and Terraform

Hands-on Microsoft Azure AZ-104 lab focused on networking troubleshooting combined with Infrastructure as Code practices.

## Architecture

- VNet: vnet-eastus-1 - 172.16.0.0/16
- VM: vm-az104-pe - 172.16.0.4
- Subnet: snet-app - 172.16.2.0/24
- VM: VM-AZ104-APP - 172.16.2.4
- NSG: nsg-snet-app
- Nginx serving HTTP on TCP/80
- Azure Private Endpoint and Private DNS from previous lab

## AZ-104 concepts practiced

- Virtual Networks and Subnets
- Network Security Groups
- NSG rule priorities
- AllowVnetInBound
- DenyAllInBound
- IP Flow Verify
- Network Watcher
- Private Endpoints
- Private DNS
- VM networking

## Infrastructure as Code workflow

1. Existing Azure resources exported with Azure Export for Terraform (aztfexport)
2. Terraform state synchronized with existing Azure infrastructure
3. terraform fmt and terraform validate
4. terraform plan used before infrastructure changes
5. Fault introduced through Terraform
6. Failure diagnosed using Azure Network Watcher
7. Configuration restored through Terraform
8. Final terraform plan returned No changes

## Troubleshooting exercise

Baseline:
vm-az104-pe 172.16.0.4 -> TCP/80 -> VM-AZ104-APP 172.16.2.4 -> HTTP 200

Fault injection:
Terraform created Deny-HTTP-From-PE with priority 110.

Observed symptom:
HTTP connection timed out.

Diagnosis:
Azure IP Flow Verify returned Access denied and identified Deny-HTTP-From-PE in nsg-snet-app.

Remediation:
The deny rule was removed through Terraform and HTTP connectivity returned to HTTP 200.

## Reusable failure scenarios

The scenarios directory contains Terraform examples that can be reused to reproduce troubleshooting exercises.

## Final state

terraform plan -> No changes. Your infrastructure matches the configuration.
