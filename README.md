
# Highly Available RDS Service on AWS for a MySQL-Compatible High-Profile E-commerce Website
## Task Description

This repository provides a solution for setting up a highly available RDS service on AWS for a MySQL-compatible high-profile e-commerce website. The solution incorporates AWS best practices for high availability, performance, and security, following the AWS Well-Architected Framework's recommendations. This README file provides you with a step-by-step guide to spin up all the resources accordingly.

The following sections provide more information on the prerequisites and usage of our solution. Let's begin!

## Table of Contents
- [Prerequisites](#prerequisites)
- [Usage](#usage)
- [Modules](#modules)
- [Conclusion](#conclusion)

## Prerequisites
The following sections provide more information on the prerequisites and usage of our solution. 
Before creating all the resources, we will need to make sure that we have Terraform and AWS CLI installed on the local system. Please refer to the official Terraform and AWS documentation to learn how to install and configure the tools.
- [Terraform (>= 0.13.1)](https://developer.hashicorp.com/terraform/downloads)  
- [AWS CLI](https://aws.amazon.com/cli/) 

Let’s configure our AWS credentials
- An AWS account with appropriate permission to following resources or admin access. 
- AWS credentials configured.
    ```
    aws configure
    ```
    ![Screenshot 2023-04-03 110751](https://user-images.githubusercontent.com/96380861/229499918-26ec985d-56ba-42cd-b2ca-b16c94f8d678.png)

## Setup
To use this solution to set up a highly available RDS service on AWS, follow these steps:

1. Clone the repository to your local machine:
    ```
    git clone https://github.com/ashraful-alam2k/cyber-duck-final.git
    ```
2. Navigate to the cloned directory:
    ```
    cd cyber-duck-final
    ```
3. Go to each  folder and run the below terraform commands:
    ```
    # This command initializes the configuration
    terraform init
    # Preview the changes 
    terraform plan
    # If the plan looks good
    terraform apply
   ```
4. Navigate to the `get-started` folder and run terraform commands, that’ll set up S3 remote backend and DynamoDB for state locking.
    ```
    cd 1.get-started
    ```

5. Navigate to the `network` folder and enter terraform commands to create the VPC, subnets, internet gateway, NAT gateways, NACLs, route tables, and other networking resources:
    ```
    cd ../2.network
    ```

6. Go to the `services` folder and run terraform commands to create the EC2 instances, autoscaling group, key pairs, bastion hosts, and relevant security groups for the fleet of instances and bastion instances:
    ```
    cd ../3.services
    ```

7. Navigate to the `database` folder and run the terraform commands to create the Aurora RDS instance in a multi-AZ deployment with two reader nodes:
    ```
    cd ../4.rds
    ```
8. Finally, head to the final folder and run terraform commands to create a set of bastion hosts and setup SSH agent forwarding. Upon finishing, it'll output a list of bastion hosts' public IPs, EC2 instances private IPs and command to connect to MySQL including necessary parameters like endpoint, username and password. 
    ```
    cd ../5.final
    ```
    Use the below commands with values retrieved from output to SSH into one of the bastion hosts and from there connect the EC2 instances, afterwards connecting to MySQL.

    ```
    ssh -A ubuntu@<public ip of bastion>
    ssh ubuntu@<private ip of EC2 instance>
    mysql -h <endpoint> -u <username> -p<password>
    ```


## Resource Details
The solution is modular, with loosely coupled folders for different functions. Here is a brief description of the resources create in this solution, They are reusable, extendable,:

- `get-started`: Initializes the configuration which sets up S3 remote backend and DynamoDB for state locking.
- `network`: Creates the VPC, subnets, internet gateway, NAT gateway, route tables, and other networking resources.
- `services`: Creates launch template, autoscaling group, key pairs, EC2 instances, bastion hosts, and relevant security groups.
- `rds`: Creates RDS, secrets manager secrets, DB subnet group, and relevant security group.
- `final`: Creates bastion hosts and outputs necessary information to connect DB.


## Conclusion
This repository provides a highly available and secure solution for setting up an RDS service on AWS for a MySQL-compatible e-commerce website. With easy-to-follow steps and modular design, users can quickly set up the service while incorporating AWS best practices for high availability and security. We hope this guide has been helpful and informative, enabling you to set up an RDS service with confidence.
