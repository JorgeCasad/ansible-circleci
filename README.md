# Ansible Docker Image for CircleCI
This repository builds an Ansible container image for CircleCI with the next components:
 - Python 3.6.8
 - Ansible 2.11.7

Also contains the next CircileCI dependencies for the custom image:
bash (most likely already installed or available via your package manager)
 - git
 - ssh
 - tar
 - gzip
 - ca-certificates

 Circle CI builds the Docker image and pushes it in this docker hub repository : "DOCKERHUB_USER/ansible-circleci:TAG"
The variables DOCKERHUB_USER and DOCKERHUB_PASSWORD need to be added in the project configuration in CircleCI. The variable TAG is generated in the CircleCI workflow ( TAG=0.1.$CIRCLE_BUILD_NUM )


