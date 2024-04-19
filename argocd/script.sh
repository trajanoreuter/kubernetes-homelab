#!/bin/sh

# install
helm repo add argo https://argoproj.github.io/argo-helm --force-update
kubectl create ns argocd

helm upgrade --install argocd argo/argo-cd -n argocd --values values.yaml

# get initial secret
#kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d
