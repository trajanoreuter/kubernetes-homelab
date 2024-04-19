#!/bin/sh

# install CloudNativePG Operator
# ref: https://cloudnative-pg.io/documentation/current/installation_upgrade/

kubectl apply --server-side -f \
  https://raw.githubusercontent.com/cloudnative-pg/cloudnative-pg/release-1.22/releases/cnpg-1.22.2.yaml
