#!/bin/sh

# install
helm repo add argo https://argoproj.github.io/argo-helm --force-update
kubectl create ns argo-rollouts
helm upgrade --install argo-rollout argo/argo-rollouts -n argo-rollouts --values values.yaml --create-namespace
