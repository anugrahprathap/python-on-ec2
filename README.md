
# Web App Deployment with CI/CD on AWS EC2

## Overview

This repository contains a Python Flask web app Dockerized for consistency, deployed on AWS EC2 via a CI/CD pipeline using Amazon CodePipeline and AWS CodeDeploy. Infrastructure is set up with Terraform.

## Technologies

- **Web Framework:** Python Flask
- **Containerization:** Docker
- **Cloud Provider:** AWS
- **IaC:** Terraform
- **CI/CD:** AWS CodePipeline and CodeDeploy
- **Deployment OS:** Ubuntu on AWS EC2

## Project Structure

- `dockerfiles/`: Python Flask web app.
- `Dockerfile`: Docker image configuration.
- `scripts/`: AWS CodeDeploy setup scripts.
- `terraform/`: Terraform configs for AWS infrastructure.
- `appspec.yml`: CodeDeploy deployment config.
- `scripts/start_app.sh`: Start Flask app script.
- `scripts/stop_app.sh`: Stop Flask app script.

## Getting Started

1. **Clone the Repository:**
   ```bash
   git clone https://github.com/anugrahprathap/python-on-ec2.git
   cd python-on-ec2
   ```

2. **Dockerize & Run Locally:**
   ```bash
   docker build -t web-app .
   docker run -p 5000:5000 web-app
   ```

3. **Access Web App:**
   Open http://localhost:5000 in your browser.

## AWS Setup with Terraform

1. **Install Terraform:**
   [Terraform installation guide](https://learn.hashicorp.com/tutorials/terraform/install-cli).

2. **Set Up AWS Credentials:**
   Ensure AWS credentials are configured.

3. **Initialize & Apply Terraform:**
   ```bash
   cd terraform/
   terraform init
   terraform apply
   ```

4. **Check AWS Resources:**
   Verify created resources in AWS Console.

## CI/CD with CodePipeline and CodeDeploy

1. **Create CodePipeline:**
   - Configure GitHub as source.
   - Set up deployment using AWS CodeDeploy.

2. **Trigger CI/CD:**
   Make changes, push to GitHub, and watch the pipeline in AWS CodePipeline.

## AWS CodeDeploy Configuration

1. **`appspec.yml`:**
   ```yaml
   version: 0.0
   os: linux
   files:
     - source: /
       destination: /home/ubuntu/
   permissions:
     - object: /
       pattern: "**"
       owner: ubuntu
       group: ubuntu
   hooks:
     ApplicationStart:
       - location: scripts/start_app.sh
         timeout: 40
         runas: ubuntu
     ApplicationStop:
       - location: scripts/stop_app.sh
         timeout: 20
         runas: ubuntu
   ```

2. **`scripts/start_app.sh`:**
   ```bash
   #!/bin/bash
   cd /home/ubuntu/app
   docker-compose up -d
   ```

3. **`scripts/stop_app.sh`:**
   ```bash
   #!/bin/bash
   cd /home/ubuntu/app
   docker-compose down
   ```

## EC2 Instance Deployment

1. **Connect to EC2:**
   ```bash
   ssh -i your-key.pem ubuntu@your-ec2-ip
   ```

2. **Install Dependencies:**
   ```bash
   sudo apt install docker.io
   sudo apt install -y python3-pip
   sudo pip install awscli
   ```

3. **Install CodeDeploy Agent:**
   Follow provided script in `scripts/`.

4. **Deploy Web App:**
   Use AWS CodeDeploy to update deployment group.

## Contributing

Contributions are welcome through issues or pull requests.

## License

This project is licensed under the MIT License. See [LICENSE](LICENSE) for details.
