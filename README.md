# Java CI/CD Pipeline on Kubernetes

A hands-on DevOps project demonstrating an automated delivery path for a Java web application using Maven, Jenkins, Docker, Amazon ECR Public, and Kubernetes.

## What this repository demonstrates

- Maven-based unit testing and packaging
- Multi-stage Docker image build
- Jenkins declarative pipeline triggered by GitHub pushes
- Container publishing to Amazon ECR Public
- Kubernetes rolling deployments
- Readiness and liveness probes
- CPU and memory requests/limits
- Automated rollout verification

## Delivery flow

```text
GitHub push
   |
   v
Jenkins
   |
   +--> Maven unit tests
   +--> Maven package
   +--> Docker build
   +--> Push image to Amazon ECR Public
   +--> kubectl set image
   +--> Kubernetes rollout status
   +--> Deployment / pod / service verification
```

## Repository structure

```text
.
├── Jenkinsfile          # CI/CD pipeline
├── Dockerfile           # Multi-stage Maven + Tomcat image
├── deploymentjava.yaml  # Kubernetes Deployment
├── servicelb.yaml       # Kubernetes Service
├── pom.xml              # Maven project configuration
└── src/                 # Java application source
```

## Kubernetes design

The deployment runs two replicas and uses a RollingUpdate strategy with `maxUnavailable: 0` and `maxSurge: 1`. HTTP readiness and liveness probes target the deployed application, and resource requests/limits are defined for the container.

## Jenkins pipeline stages

1. Checkout the `main` branch.
2. Run Maven unit tests.
3. Package the Java application.
4. Authenticate Docker to Amazon ECR Public.
5. Build a uniquely tagged image using the Jenkins build number.
6. Push the image.
7. Verify Kubernetes access.
8. Update the deployment image.
9. Wait for rollout completion.
10. Verify deployment, pods, and service state.

## Jenkins agent requirements

The Jenkins agent needs Maven, Docker, AWS CLI, `kubectl`, access to the Docker daemon, AWS/ECR permissions, and a valid Kubernetes kubeconfig at the path expected by the pipeline.

## Deployment

The manifests define the `java-app` workload and a NodePort service. Before using them in another environment, review the image URI, namespace, service type, resource limits, probe paths, and kubeconfig handling.

## Engineering focus

This repository is intended as a practical CI/CD and Kubernetes automation lab. It emphasizes repeatable builds, immutable image tags, rolling deployment behavior, health checks, resource controls, and post-deployment verification.
