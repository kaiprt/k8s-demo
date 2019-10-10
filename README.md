# Kubernetes Demo
[![Build Status](https://travis-ci.org/kaiprt/k8s-demo.svg?branch=master)](https://travis-ci.org/kaiprt/k8s-demo)
## Purpose
This Kubernetes project was created to demonstrate [Moonrake LLC's](https://moonrake.it) technical understanding of DevSecOps.
NOTE: This project is a sub-module to the master project [DevSecOps Demo](https://github.com/MoonrakeOpen/DevSecOps-Demo).
## To start using this project.
1. For local environments please ensure you have kubectl and minikube installed. If not, you may find instructions [here](https://kubernetes.io/docs/tasks/tools/install-kubectl/).
2. Check to make sure you have at least the following versions
 - minikube version v1.4.0 `minikube version`
 - kubernetes client version v1.14.0 `kubectl version --client`
2. If you installed minishift please ensure it's off `minishift stop`
3. Start minikube `minikube start` (NOTE: This may take a few minutes.)
4. Navigate to your working directory on terminal.
5. Navigate into repository.
6. Apply namespace `apply -f namespaces/moonrake-namespace.yml`
7. Set current namespace context as moonrake `kubectl config set-context --current --namespace=moonrake-dev`
8. Note: We have configured our postgres database to use an encrypted secret. You will need to create your own secret that will hold your local postgres password (PGPASSWORD). Want to learn more? See [documentation](https://kubernetes.io/docs/concepts/configuration/secret/#overview-of-secrets)
- Format of secret `kubectl create secret generic pgpassword --from-literal PGPASSWORD=YOUR_PASSWORD_HERE`
9. Verify the secret was created: `kubectl get secrets | grep pgpassword`

## Container Hardening

### Setup
We have purposly left security vulnerabilities ranging in severity.
