# Microservices Deployment Project

This project demonstrates an Infrastructure as Code (IaaC) approach using Terraform to deploy a microservices-based architecture on AWS Elastic Kubernetes Service (EKS). The primary goal is to provision a web application with a frontend proxy using nginx/httpd and a backend database (mongo, PostgreSQL) and deploy the Socks Shop example microservice application using Kubernetes. The CI/CD pipeline is set up using CircleCI. The emphasis is on readability, maintainability, and following DevOps methodologies.

## Table of Contents

- [Overview](#overview)
- [Setup Details](#setup-details)
- [Task Instructions](#task-instructions)
  - [Deploy Pipeline](#deploy-pipeline)
  - [Metrics](#metrics)
  - [Monitoring](#monitoring)
- [Technologies Used](#technologies-used)
- [Prerequisites](#prerequisites)
- [Getting Started](#getting-started)
- [HTTPS and Network Security**](#https-and-network-security**)
- [Sensitive Information Encryption**](#sensitive-information-encryption**)
- [Challenges Faced](#challenges-faced)

## Overview

In this project, we deploy a microservices-based architecture on AWS Elastic Kubernetes Service (EKS) using an Infrastructure as Code approach with Terraform. The deployment includes provisioning a web application with nginx/httpd frontend proxy and a backend database and deploying the Socks Shop microservice application. The CI/CD pipeline is managed using CircleCI.

## Setup Details

The project requires the following setup:

- Web application with nginx/httpd frontend proxy
- Backend database (mongo, PostgreSQL)
- Socks Shop microservice application (https://microservices-demo.github.io/)

## Task Instructions

### Deploy Pipeline 

> [config.yml](.circleci/config.yml)
> 
> [terraform-kubernetes](terraform-kubernetes/main.tf)

The deployment is orchestrated using Kubernetes and an IaaC approach with Terraform. The CI/CD pipeline is set up with CircleCI, ensuring automated and consistent implementations.

### Metrics

Metrics are collected and monitored using Prometheus. The monitoring setup helps in tracking the health and performance of the deployed services.

### Monitoring

Prometheus is used for monitoring the infrastructure and microservices. Grafana is integrated to create visual dashboards for monitoring and analysis of metrics.


## Technologies Used

- AWS Elastic Kubernetes Service (EKS)
- Terraform
- CircleCI
- Prometheus
- Grafana
- Nginx/Httpd
- MongoDB/PostgreSQL
- Socks Shop microservices
- Let’s Encrypt for HTTPS[Optional]

## Prerequisites

- AWS account set up
- Terraform installed
- Setup CircleCI account

## Getting Started

1. Clone this repository.
2. Set up AWS resources and EKS cluster.
3. Use Terraform to deploy the web application and backend database on EKS.
4. Deploy the Socks Shop microservices on EKS.

For Prometheus Deployment:
1. Run the following commands to install Helm and Prometheus:
```shell
curl https://baltocdn.com/helm/signing.asc | gpg --dearmor | sudo tee /usr/share/keyrings/helm.gpg > /dev/null
sudo apt-get install apt-transport-https --yes
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/helm.gpg] https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list
sudo apt-get update
sudo apt-get install helm
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
```
2. Update Helm repositories:
```shell
helm repo update
```
3. Install Prometheus
```shell
helm install prometheus prometheus-community/prometheus
```
4. Expose Prometheus service using LoadBalancer:
```shell
kubectl expose service prometheus-server --type=LoadBalancer --target-port=9090 --name=prometheus-server-ext
```
5. Check the external IP for Prometheus:
```shell
kubectl get service prometheus-server-ext
```

## HTTPS and Network Security**

Configure the web application to run on HTTPS with Let’s Encrypt certificates. Implement network security access rules to secure the infrastructure.

## Sensitive Information Encryption**

Utilize Terraform Vault or CircleCI context for encrypting sensitive information, ensuring secure management of credentials and secrets.

## Challenges Faced

During the course of the Sock Shop project, I encountered challenges that, unfortunately, I wasn't able to fully address due to billing constraints. These challenges highlight areas where technical limitations and budget considerations impacted the project:

### Voting App Not Displaying on Web Browser

I faced an issue where the voting app didn't display as expected on web browsers. Despite my efforts to troubleshoot and identify the issue, I wasn't able to allocate the necessary resources to resolve it due to the associated costs. I recognize the importance of delivering a functional application and apologize for any inconvenience this might cause to users.

### HTTPS Implementation

Implementing HTTPS for the deployed applications, including obtaining SSL/TLS certificates and configuring web servers, is crucial for security. However, due to the increasing project costs, I wasn't able to implement HTTPS at this time. Ensuring secure communication requires resources beyond the scope of the current project constraints.

I want to be transparent about these challenges and the decisions made. While these specific issues remain unresolved, I'm actively learning and considering options to address them in the future, possibly with more optimized resource allocation or alternative approaches.

Your understanding and input are greatly appreciated as I continue to refine and enhance the project within the given limitations.


**Optional
