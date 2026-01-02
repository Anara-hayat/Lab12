# Lab 12: Terraform Provisioners, Modules & Nginx Reverse Proxy/Load Balancer

**Course:** Cloud Computing Lab  
**Instructor:** Engr. Mohammad Shoaib  
**Student:** Anara Hayat  
**Registration:** 2023-BSE-008

## Overview

This lab demonstrates advanced Terraform concepts including provisioners, modular infrastructure design, and Nginx configuration for reverse proxy and load balancing scenarios. You'll build a complete web infrastructure with SSL/TLS support and high availability features.

## Prerequisites

- AWS Account with appropriate permissions
- GitHub Codespace or local development environment
- Basic understanding of Terraform, AWS, and Linux
- SSH key pair for instance access

## Lab Structure

### Task 0: Lab Setup
- Create and configure GitHub Codespace
- Set up development environment
- Install necessary tools (Terraform, AWS CLI, GH CLI)

### Task 1: Organize Terraform Code
Learn best practices for structuring Terraform projects by splitting monolithic configurations into:
- `variables.tf` - Input variable definitions
- `outputs.tf` - Output value declarations
- `locals.tf` - Local value calculations
- `terraform.tfvars` - Variable value assignments
- `main.tf` - Primary resource definitions
- `entry-script.sh` - Instance initialization script

### Task 2: Remote-Exec Provisioner
Replace `user_data` with the `remote-exec` provisioner to:
- Install Nginx on EC2 instances
- Configure web server remotely
- Understand provisioner execution flow

### Task 3: File and Local-Exec Provisioners
Expand provisioner usage to include:
- **File provisioner**: Upload scripts to remote instances
- **Local-exec provisioner**: Execute commands locally for logging
- Combine multiple provisioners in a single resource

### Task 4: Subnet Module
Create reusable infrastructure modules:
- Build a custom subnet module
- Organize VPC, subnet, route table, and internet gateway resources
- Implement module best practices

### Task 5: Webserver Module
Develop a comprehensive webserver module including:
- Security group configuration
- SSH key pair management
- EC2 instance provisioning
- Modular architecture for scalability

### Task 6: HTTPS Configuration
Secure your web infrastructure:
- Generate self-signed SSL certificates
- Configure Nginx for HTTPS
- Implement HTTP to HTTPS redirection
- Handle browser security warnings

### Task 7: Nginx Reverse Proxy
Transform Nginx into a reverse proxy:
- Deploy Apache backend servers
- Configure Nginx to proxy requests
- Route traffic to backend services
- Understand proxy architecture patterns

### Task 8: Load Balancing
Implement load balancing across multiple backends:
- Deploy multiple backend web servers
- Configure Nginx upstream blocks
- Distribute traffic evenly
- Test round-robin load distribution

### Task 9: High Availability
Configure failover and backup mechanisms:
- Designate primary and backup servers
- Implement automatic failover
- Test high availability scenarios
- Switch between primary servers

### Task 10: Nginx Caching
Optimize performance with caching:
- Configure Nginx cache zones
- Set cache headers and policies
- Verify cache behavior using browser dev tools
- Monitor cache hit/miss ratios

## Key Concepts Covered

- **Infrastructure as Code (IaC)**: Terraform configuration management
- **Modularity**: Creating reusable Terraform modules
- **Provisioners**: remote-exec, file, and local-exec
- **Web Server Configuration**: Nginx and Apache setup
- **Security**: SSL/TLS certificate management
- **Load Balancing**: Traffic distribution strategies
- **High Availability**: Failover and backup configurations
- **Performance Optimization**: Caching mechanisms

## Common Commands

```bash
# Initialize Terraform
terraform init

# Plan infrastructure changes
terraform plan

# Apply configuration
terraform apply -auto-approve

# Display outputs
terraform output

# Destroy resources
terraform destroy -auto-approve

# SSH into instance
ssh -i ~/.ssh/terra-key ubuntu@<public-ip>
```

## Project Files

```
.
├── main.tf                    # Main infrastructure definitions
├── variables.tf               # Variable declarations
├── outputs.tf                 # Output definitions
├── locals.tf                  # Local values
├── terraform.tfvars          # Variable values
├── entry-script.sh           # Nginx initialization script
├── apache.sh                 # Apache backend script
└── modules/
    ├── subnet/               # Subnet module
    │   ├── main.tf
    │   ├── variables.tf
    │   └── outputs.tf
    └── webserver/            # Webserver module
        ├── main.tf
        ├── variables.tf
        └── outputs.tf
```

## Testing

Each task includes testing steps:
1. Verify resources are created successfully
2. Test web server accessibility via browser
3. Check HTTPS connectivity and certificates
4. Validate load balancing behavior
5. Confirm high availability failover
6. Monitor caching performance

## Cleanup

Always destroy resources after completing the lab to avoid unnecessary AWS charges:

```bash
terraform destroy -auto-approve
```

Verify all resources are removed by checking the AWS Console.

## Learning Outcomes

By completing this lab, you will:
- Master Terraform module development
- Understand infrastructure provisioning patterns
- Configure production-ready web servers
- Implement load balancing and high availability
- Optimize web application performance
- Follow infrastructure best practices

## Troubleshooting

- **Connection timeout**: Check security group rules and SSH key permissions
- **Provisioner failures**: Verify script syntax and instance connectivity
- **SSL warnings**: Expected with self-signed certificates
- **Cache not working**: Check Nginx configuration and cache directory permissions

## Resources

- [Terraform Documentation](https://www.terraform.io/docs)
- [Nginx Documentation](https://nginx.org/en/docs/)
- [AWS EC2 Documentation](https://docs.aws.amazon.com/ec2/)

---
