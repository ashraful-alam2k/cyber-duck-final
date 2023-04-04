
# Highly Available RDS Service on AWS for a MySQL-Compatible High-Profile E-commerce Website
## Task Description

This repository provides a solution for setting up a highly available RDS service on AWS for a MySQL-compatible high-profile e-commerce website. The solution incorporates AWS best practices for high availability, performance, and security, following the AWS Well-Architected Framework's recommendations. This README file provides you with a step-by-step guide to spin up all the resources accordingly.

The following sections provide more information on the prerequisites, setup and usage of my solution. Let's begin!

## Table of Contents
- [Prerequisites](#prerequisites)
- [Setup and usage](#setup-and-usage)
- [Resources](#resources)
- [Conclusion](#conclusion)


## Prerequisites
Before creating all the resources, we will need to make sure that you have Terraform and AWS CLI installed on the local system. Please refer to the official Terraform and AWS documentation to learn how to install and configure the tools.
- [Terraform (>= 0.13.1)](https://developer.hashicorp.com/terraform/downloads)  
- [AWS CLI](https://aws.amazon.com/cli/) 

Let’s configure our AWS credentials
- An AWS account with appropriate permission to the required resources or admin access. 
- AWS credentials configured.
    ```
    aws configure
    ```
    ![Screenshot 2023-04-04 151400](https://user-images.githubusercontent.com/96380861/229836651-ae6192fa-68dc-40c3-bfe2-fe54c77982a1.png)



## Setup and Usage
To use this solution to set up a highly available RDS service on AWS, follow these steps:

1. Clone the repository to your local machine:
    ```
    git clone https://github.com/ashraful-alam2k/cyber-duck.git
    ```
2. Navigate to the cloned directory:
    ```
    cd cyber-duck
    ```
4. Navigate to the `get-started` folder and run terraform commands, that’ll set up S3 remote backend and DynamoDB for state locking.
    ```
    cd 1.get-started
    terraform init  # This command initializes the configuration
    terraform plan  # Preview the changes 
    terraform apply # If the plan looks good
    ```

5. Navigate to the `network` folder and enter terraform commands to create the VPC, subnets, internet gateway, NAT gateways, route tables, and other networking resources:
    ```
    cd ../2.network
    terraform init  # This command initializes the configuration
    terraform plan  # Preview the changes 
    terraform apply # If the plan looks good
    ```

6. Go to the `services` folder and run terraform commands to create the launch template, key pairs, relevant security groups, autoscaling group and fleet of EC2 instances:
    ```
    cd ../3.services
    terraform init  # This command initializes the configuration
    terraform plan  # Preview the changes 
    terraform apply # If the plan looks good
    ```

7. Navigate to the `database` folder and run the terraform commands to create the Aurora RDS instance in a multi-AZ deployment with two reader nodes:
    ```
    cd ../4.rds
    terraform init  # This command initializes the configuration
    terraform plan  # Preview the changes 
    terraform apply # If the plan looks good
    ```
8. Finally, head to the final folder and run terraform commands to create a set of bastion hosts. Upon finishing, it'll output a list of bastion hosts' public IPs, EC2 instances private IPs and command to connect to MySQL including necessary parameters like endpoint, username and password. 
    ```
    cd ../5.final
    terraform init  # This command initializes the configuration
    terraform plan  # Preview the changes 
    terraform apply # If the plan looks good
    ```
    Use the below commands to setup SSH agent forwarding 
    ```
    eval "$(ssh-agent -s)"
    chmod 400 cyber-duck-key.pem 
    ssh-add cyber-duck-key.pem 
    ```
    After that enter below commands with values retrieved from output to SSH into one of the bastion hosts and from there connect the EC2 instances, afterwards             connecting to MySQL.
    ```
    ssh -A ubuntu@<public ip of bastion>
    ssh ubuntu@<private ip of EC2 instance>
    mysql -h <endpoint> -u <username> -p<password>
    ```

## Resource Details
The solution is divided into loosely coupled folders for different functions to make it reuseable, extendable. Here is a brief description of the resources created in this solution:

- `get-started`: Initializes the configuration which sets up S3 remote backend and DynamoDB for state locking.
- `network`: Creates the VPC, subnets, internet gateway, NAT gateway, route tables, and other networking resources.
- `services`: Creates launch template, autoscaling group, key pairs, EC2 instances, and relevant security groups.
- `rds`: Creates RDS, secrets manager secrets, DB subnet group, and relevant security group.
- `final`: Creates bastion hosts, SSH agent forwarding and outputs necessary information to connect DB.


## Conclusion
This repository provides a highly available and secure solution for setting up an RDS service on AWS for a MySQL-compatible e-commerce website. With easy-to-follow steps and loosley coupled design, users can quickly set up the service while incorporating AWS best practices for high availability and security. We hope this guide has been helpful and informative, enabling you to set up an RDS service with confidence.
