# 🌐 3-Tier Web Application Infrastructure

This project demonstrates the deployment of a scalable and secure 3-tier web application architecture using Terraform on AWS. The infrastructure is designed to ensure high availability, scalability, and security, leveraging AWS services such as VPC, EC2, RDS, ASG and ALB.


## Tier Architecture explanation

- **Web Tier**: This is the frontend part of a web application that displays the website to users. It handles how the site looks and interacts with users, like showing product pages or allowing people to sign up.

- **Application Tier**: This middle part represents the backend part which manages the business logic and processes user actions. For example, it checks the inventory to see if a product is in stock or updates a user's account details.

- **Database Tier**: This is the data part that stores all the data for the application. It uses databases like MySQL or PostgreSQL to keep track of information.


## High-level overview of the project:
![Architecture](/diagram/aws-3tier-architecture-diagram.png)


## 🚀 Tools & Technologies 

- **AWS EC2**
- **Amazon RDS**
- **Auto Scaling Groups**
- **Elastic Load Balancing (ALB)**
- **VPC, Subnets, NAT Gateway, Internet Gateway**
- **Security Groups**
- **CloudWatch**
- **Terraform for (IAC)** 

## 🧱 Architecture Components

### 1️⃣ **Frontend Tier (Web Tier)**
- Consists of **2 EC2 instances** deployed across **2 different Availability Zones**.
- Instances are placed in **2 public subnets**.
- Managed using an **Auto Scaling Group** to handle traffic fluctuations.
- **Application Load Balancer (ALB)** distributes incoming web traffic across instances.

### 2️⃣ **Backend Tier (Application Tier)**
- Consists of **EC2 instances** in **private subnets** across multiple Availability Zones.
- Connected via an **internal ALB** to distribute traffic from the frontend tier.
- Also managed by an **Auto Scaling Group** for scalability.

### 3️⃣ **Database Tier**
- Uses **Amazon RDS** with **Multi-AZ** deployment for high availability and fault tolerance.
- Backend tier communicates securely with the database in private subnets.

---

## 🔒 Security Groups

Security is enforced using **five security groups**, each scoped to a specific component:

1. **External Load Balancer SG**
   - Allows HTTP traffic (port 80) from **anywhere (0.0.0.0/0)**.
   - Protects the public-facing application load balancer.

2. **Frontend Instances SG**
   - Allows inbound HTTP (port 80) traffic **only from the External Load Balancer**.
   - Prevents direct access from the internet.

3. **Internal Load Balancer SG**
   - Allows HTTP traffic (port 80) **only from Frontend Instances SG**.
   - Secures communication between the frontend and backend tiers.

4. **Backend Instances SG**
   - Allows traffic on port **3000** **only from the Internal Load Balancer SG**.
   - Ensures isolated communication within the private tier.

5. **Database SG**
   - Allows inbound **MySQL (port 3306)** traffic **only from Backend Instances SG**.
   - Restricts access to the database from any other sources.

---

## 🌐 Networking Configuration

- **VPC** with public and private subnets across multiple Availability Zones.
- **Internet Gateway (IGW)** attached to the VPC for outbound internet access (for public subnets).
- **NAT Gateway** to allow private instances to access the internet for updates without exposing them.
- **Route Tables** configured to route traffic appropriately between tiers.

---

## 📊 Monitoring

- **Amazon CloudWatch** is configured to monitor:
  - **Frontend instances**
  - **Backend instances**
- Alarms and metrics are set for performance tracking, health monitoring, and resource usage.

---
## 🚀 Getting Started

### Prerequisites 🛠️

Before you begin, ensure you have the following installed:

- Terraform 🏗️
- AWS CLI ☁️
- Git 🐙

### How To Configure AWS Credentials 🔑

1. Open a terminal window.
2. Run the following command:

    ```bash
    aws configure
    ```

3. Enter the following information:
    AWS Access Key ID
    AWS Secret Access Key
    Default region name (e.g., us-east-1)
    Default output format (e.g., JSON)

### How to Get AWS Access Key ID & AWS Secret Access Key 🔑

- Log in to your AWS account.
- Click on your account name in the top right corner.
- Hover over "Security Credentials."
- Find "Access keys" and click "Create Access key."
- Copy and paste the AWS Access Key ID & AWS Secret Access Key into the terminal after running 'aws configure'.

---- 🌟 ----

### Infrastructure Setup

- Clone the Repository:

```bash
    git https://github.com/AmiraTarek99/aws_3tier_architecture.git
```

- Initialize Terraform:

```bash
terraform init
```

- Plan the Deployment:

```bash
    terraform plan -var-file="variables.tfvars"
```

Apply the Configuration:

```bash
    terraform apply -var-file="variables.tfvars"
```

Review the plan output carefully before applying to ensure all changes are as expected.




