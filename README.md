# Train Ticket Reservation – CI/CD Pipeline Using Docker, Amazon ECR & Amazon ECS

## 📌 Project Overview

This project implements an automated CI/CD pipeline for a Train Ticket Reservation web application using GitHub Actions, Maven, Docker, Trivy, Amazon ECR, and Amazon ECS with AWS Fargate.

The pipeline automates application building, security scanning, Docker image creation, image storage, and deployment to Amazon ECS.

## 🎯 Objectives

* Automate application builds using Maven.
* Containerize the application using Docker.
* Scan source files and Docker images using Trivy.
* Store Docker images in Amazon ECR.
* Deploy the application using Amazon ECS and AWS Fargate.
* Automate the deployment process using GitHub Actions.
* Manage AWS credentials securely using GitHub Secrets.

## 🛠️ Technologies Used

| Technology        | Purpose                                    |
| ----------------- | ------------------------------------------ |
| Java 17           | Application build environment              |
| Apache Maven      | Build and package the application          |
| Git & GitHub      | Version control and source code management |
| GitHub Actions    | CI/CD pipeline automation                  |
| Docker            | Application containerization               |
| Trivy             | Security vulnerability scanning            |
| Amazon ECR        | Docker image registry                      |
| Amazon ECS        | Container orchestration                    |
| AWS Fargate       | Serverless container execution             |
| AWS IAM           | Access and permission management           |
| Amazon CloudWatch | Container logging and monitoring           |
| Apache Tomcat     | Java web application server                |

## 🏗️ Architecture

```text
Developer
    |
    v
GitHub Repository
    |
    v
GitHub Actions
    |
    v
Maven Build
    |
    v
Generate WAR File
    |
    v
Trivy Filesystem Scan
    |
    v
Docker Image Build
    |
    v
Trivy Image Scan
    |
    v
Amazon ECR
    |
    v
Amazon ECS Service
    |
    v
AWS Fargate
    |
    v
Tomcat Application
```

## ⚙️ Implementation Steps

### 1. Source Code Management

Created a GitHub repository to maintain the Train Ticket Reservation application source code, Maven configuration, Dockerfile, and CI/CD workflow.

### 2. Application Build

Configured Java 17 and Maven in GitHub Actions to compile the application and generate the WAR file.

```bash
mvn clean package -DskipTests
```

### 3. Docker Image Creation

Created a Dockerfile to package the application and its Tomcat runtime environment into a Docker image.

GitHub Actions automatically builds the image using the Dockerfile.

### 4. Security Scanning

Integrated Trivy into the CI/CD pipeline to scan project files and Docker images for High and Critical severity vulnerabilities.

### 5. Amazon ECR Configuration

Created an Amazon ECR repository named `project` in the `ap-southeast-2` region.

Configured GitHub Actions to authenticate with AWS, tag the Docker image, and push it to ECR.

### 6. Amazon ECS Configuration

Created an ECS cluster and configured the task definition with the container image, port mappings, CPU, memory, IAM execution role, and CloudWatch logging.

### 7. AWS Fargate Deployment

Configured an ECS service using AWS Fargate to run the application container without managing EC2 instances.

### 8. CI/CD Automation

Integrated the complete build, scan, image push, and ECS deployment process into a GitHub Actions workflow.

The pipeline deploys the updated application image to ECS after a successful build and image push.

### 9. IAM and Security Configuration

Configured the necessary AWS IAM permissions for ECR image uploads and ECS deployment. Stored AWS credentials and deployment configuration in GitHub repository secrets.

### 10. Application Verification

Verified the GitHub Actions workflow, confirmed that the Docker image was available in ECR, and checked that the ECS task reached the `RUNNING` state.

Tested application accessibility through the configured network endpoint.

## 🔐 GitHub Secrets

The following repository secrets are used by the workflow:

| Secret                  | Description                |
| ----------------------- | -------------------------- |
| `AWS_ACCESS_KEY_ID`     | AWS access key             |
| `AWS_SECRET_ACCESS_KEY` | AWS secret access key      |
| `AWS_REGION`            | AWS deployment region      |
| `ECR_REPOSITORY`        | Amazon ECR repository name |
| `ECS_CLUSTER`           | ECS cluster name           |
| `ECS_SERVICE`           | ECS service name           |

Never store AWS credentials directly in the source code or commit them to the repository.

## 🐳 Docker Image

Amazon ECR repository:

```text
423351912961.dkr.ecr.ap-southeast-2.amazonaws.com/project
```

The CI/CD pipeline builds and pushes Docker images to this repository. Unique image tags can be used to identify individual builds and support version tracking.

## 📊 Project Outcomes

* Automated application builds using Maven.
* Automated Docker image creation.
* Security scanning using Trivy.
* Centralized Docker image storage using Amazon ECR.
* Automated container deployment using Amazon ECS and Fargate.
* Reduced manual deployment effort.
* Improved deployment consistency and repeatability.

## 📚 Conclusion

This project demonstrates the implementation of a DevOps CI/CD pipeline for a Train Ticket Reservation application using GitHub Actions, Maven, Docker, Trivy, Amazon ECR, and Amazon ECS with AWS Fargate.

The automated workflow simplifies application delivery by integrating build automation, security scanning, containerization, image management, and deployment into a single pipeline.
