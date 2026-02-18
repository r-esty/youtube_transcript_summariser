# YouTube AI Transcript Summariser with AWS ECS, Terraform, and GitHub Actions

> Paste a YouTube link, get an AI-generated summary in seconds. Built to demonstrate full-stack DevOps on AWS.

## Overview

The application runs in a Docker container hosted on Amazon ECS Fargate. The infrastructure is defined using Terraform and deployed through automated workflows in GitHub Actions. DNS is managed via Route 53, and HTTPS is enabled through ACM. The web application takes a YouTube video link, fetches its transcript, and uses OpenAI's API to generate a concise summary.

**Important:** YouTube blocks transcript API requests from cloud provider IPs (AWS, GCP, Azure). The app works perfectly locally but has limited functionality when deployed to AWS ECS. This project showcases infrastructure as code and CI/CD automation skills.

## Architecture Diagram

<img width="810" height="742" alt="image" src="https://github.com/user-attachments/assets/7a008ffc-2527-48ef-a5ea-81b92f3bb688" />



## Skills Demonstrated

- Infrastructure as Code with Terraform (modular design)
- CI/CD automation with GitHub Actions
- AWS cloud architecture (ECS, ALB, VPC, Route 53)
- Multi-AZ high availability deployment
- Container orchestration with Docker and ECS Fargate
- Secure secrets management
- DNS and SSL/TLS configuration

## Getting Started

### Prerequisites

- Python 3.8 or higher
- Docker (optional)
- AWS account (for deployment)
- OpenAI API key from [OpenAI Platform](https://platform.openai.com)

### Local Development Setup

**Clone the repository**
```bash
git clone https://github.com/r-esty/youtube_transcript.git
cd youtube_transcript
```

**Set up Python environment**
```bash
python3 -m venv venv
source venv/bin/activate
```

**Install dependencies**
```bash
pip install -r requirements.txt
```

**Set your API key**
```bash
export OPENAI_API_KEY="your-openai-api-key-here"
```

**Run app**
```bash
python3 transcript_scrape.py
```

**Open browser**
```
http://localhost:5000
```

### Running with Docker

**Build the Docker Image**
```bash
docker build -t youtube-transcript .
```

**Run the Docker Container**
```bash
docker run \
  --name youtube_transcript_container \
  -p 5000:5000 \
  -e OPENAI_API_KEY="your-openai-api-key-here" \
  youtube-transcript
```

**Open browser**
```
http://localhost:5000
```

## Key Components

### Terraform

- ECS Fargate for serverless container hosting
- Application Load Balancer for HTTPS traffic distribution
- VPC with public/private subnets across 2 availability zones (eu-west-2a, eu-west-2b)
- NAT gateways for private subnet internet access
- Route 53 for DNS management
- ACM certificate for SSL/TLS
- Security Groups restricting traffic between components
- CloudWatch Logs for monitoring
- ECR for Docker image repository

### CI/CD (GitHub Actions)

- Builds Docker image on push to main
- Pushes image to Amazon ECR
- Updates ECS service for automatic deployment
- Zero-downtime rolling updates
- Terraform plan workflow for infrastructure preview
- Terraform apply workflow for automated deployment
- Manual destroy workflow for safe teardown

## Directory Structure
```
├── README.md
├── Dockerfile
├── requirements.txt
├── transcript_scrape.py
├── test_transcript.py
├── templates
│   └── index.html
└── terraform
    ├── backend.tf
    ├── main.tf
    ├── modules
    │   ├── alb/
    │   ├── ecr/
    │   ├── ecs-cluster/
    │   ├── ecs-service/
    │   ├── iam/
    │   └── networking/
    ├── output.tf
    ├── provider.tf
    └── variables.tf
```

## Screenshots


**App Locally**

<img width="1914" height="974" alt="image" src="https://github.com/user-attachments/assets/78b6468c-292f-440f-9580-6dd4f69a5cc3" />

**App On Docker Container**

<img width="1914" height="974" alt="image" src="https://github.com/user-attachments/assets/0a187e28-670b-42dc-bdc9-96b3abf341ea" />

**GitHub Actions CI/CD Pipeline**

<img width="1920" height="925" alt="image" src="https://github.com/user-attachments/assets/b815a4fa-074e-48e2-a65e-d357da7eaa08" />



<img width="1920" height="698" alt="image" src="https://github.com/user-attachments/assets/8bc5cb5a-0479-4850-be6f-43148df630a1" />



<img width="1919" height="738" alt="image" src="https://github.com/user-attachments/assets/516f190c-825e-4062-a317-aaa0c3b244ef" />



<img width="1919" height="738" alt="image" src="https://github.com/user-attachments/assets/fe010b38-26f1-4c98-9368-2a92baa82ff8" />

**Domain Name**

<img width="1914" height="974" alt="Screenshot From 2026-02-16 13-29-45" src="https://github.com/user-attachments/assets/493216c3-dd14-494e-8ec2-5838c420836e" />

**SSL Certificate**

<img width="1914" height="974" alt="image" src="https://github.com/user-attachments/assets/7190ec47-6a10-41b0-b737-a55d592a5bf1" />

**Trivy Scanner**

<img width="1913" height="847" alt="image" src="https://github.com/user-attachments/assets/339729ff-ab2b-4018-bf49-935cad7a9e88" />

**CODEQL**

<img width="1913" height="832" alt="image" src="https://github.com/user-attachments/assets/fea4da4f-6c16-494a-8941-3d5dd087e6b2" />






