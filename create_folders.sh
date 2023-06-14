#!/bin/bash

# List of folder names
folders=(
    "01-EKS-Create-Cluster-using-eksctl"
    "02-Docker-Fundamentals"
    "03-Kubernetes-Fundamentals"
    "04-EKS-Storage-with-EBS-ElasticBlockStore"
    "05-Kubernetes-Important-Concepts-for-Application-Deployments"
    "06-EKS-Storage-with-RDS-Database"
    "07-ELB-Classic-and-Network-LoadBalancers"
    "08-ELB-Application-LoadBalancers"
    "09-NEW-ELB-Application-LoadBalancers"
    "10-EKS-Workloads-on-Fargate"
    "11-ECR-Elastic-Container-Registry-and-EKS"
    "12-DevOps-with-AWS-Developer-Tools"
    "13-Microservices-Deployment-on-EKS"
    "14-Microservices-Distributed-Tracing-using-AWS-XRay-on-EKS"
    "15-Microservices-Canary-Deployments"
    "16-EKS-HPA-Horizontal-Pod-Autoscaler"
    "17-EKS-VPA-Vertical-Pod-Autoscaler"
    "18-EKS-Autoscaling-Cluster-Autoscaler"
    "19-EKS-Monitoring-using-CloudWatch-Container-Insights"
    "20-ELB-Network-LoadBalancers-with-LBC"
)

# Loop through the list and create each folder
for folder in "${folders[@]}"; do
    mkdir "$folder"
done

# Create additional files
touch README.md
mkdir presentation
mkdir others
