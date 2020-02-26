# Capstone

Develop a CI/CD pipeline for micro services applications with either blue/green deployment or rolling deployment. Develop Continuous Integration steps as you see fit, but must at least include typographical checking (linting).

## Extensions

Implementation of other checks such as security scanning, performance testing, integration testing.

# Steps

Step 1: Propose and Scope the Project
- Plan what your pipeline will look like.
- Decide which options you will include in your Continuous Integration phase.
- Pick a deployment type - either rolling deployment or blue/green deployment.

Step 2: Use Jenkins, and implement blue/green or rolling deployment.
- Create a Jenkins master box with either Jenkins and install the plugins you will need.
- Set up your environment to which you will deploy code.

Step 3: Pick AWS Kubernetes as a Service, or build your own Kubernetes cluster.
- Use Ansible or CloudFormation to build the  infrastructure
- It should create the EC2 instances, set the correct networking settings and deploy software to these instances.
- As a final step, the Kubernetes cluster will need to be initialized. The Kubernetes cluster initialization can either be done by hand or with Ansible/Cloudformation.

Step 4: Build your pipeline
- Construct the pipeline in the GitHub repository.
- Set up all the steps that the pipeline will include.
- Configure a deployment pipeline.

Step 5: Test your pipeline
- Perform builds on the pipeline.

