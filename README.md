# CI/CD Application Deployment on EKS

This repository contains a full-stack application setup with Docker, Kubernetes, and Terraform for deployment on AWS EKS. The application is accessible at:

[Access the App](http://a28e967b87b094a9aa8d1c3234a257d8-1265587635.us-east-1.elb.amazonaws.com/)

---

## Repository Structure
---

## Folder Details

### 1. `app/`
Contains the source code for both the backend and frontend applications. Each subfolder includes a `Dockerfile` for building container images.

- `backend/` – Backend API services  
- `frontend/` – Frontend web application  

### 2. `deployment/`
Contains Kubernetes manifests for deploying applications and database components:

- `back.yml` – Deployment for the backend service  
- `front.yml` – Deployment for the frontend service  
- `postgres.yml` – Deployment for Postgres database  
- `pv.yml` – Defines Persistent Volumes  
- `pvc.yml` – Defines Persistent Volume Claims  

These manifests are applied to the EKS cluster using `kubectl` and are part of the CI/CD pipeline.

### 3. `eks-terraform/`
Contains Terraform scripts to provision:

- EKS cluster  
- Node groups  
- IAM roles and policies  
- VPC, subnets, and networking components  

This enables automated infrastructure setup on AWS.

---

## CI/CD Pipeline

A GitHub Actions workflow builds Docker images for backend and frontend, pushes them to Docker Hub, and deploys them to the EKS cluster. The workflow ensures:

1. PV and PVC are created first.  
2. Postgres deployment is applied.  
3. Backend and frontend images are built, tagged, pushed, and deployed.  

---

## Accessing the Application

Once deployed, the application is available at:

[http://a28e967b87b094a9aa8d1c3234a257d8-1265587635.us-east-1.elb.amazonaws.com/](http://a28e967b87b094a9aa8d1c3234a257d8-1265587635.us-east-1.elb.amazonaws.com/)

---

## Notes

- Make sure AWS credentials are configured in GitHub secrets for the pipeline.  
- Docker Hub credentials should be stored in GitHub secrets to push images.  
- Kubernetes manifests may need adjustments for imagePullSecrets if using private Docker Hub repos.  
- Terraform in `eks-terraform/` must be applied before deploying applications if the cluster does not exist.  
