### Vault

After the creation of the application with Argocd. We need to enter inside some pod and execute some things:

```
kubectl get pods --selector='app.kubernetes.io/name=vault' --namespace=' vault'

```

Initialize one Vault server with the default number of key shares and default key threshold:
```
kubectl exec --stdin=true --tty=true vault-0 -- vault operator init
```

The output displays the key shares and initial root key generated.
```
## Unseal the first vault server until it reaches the key threshold
kubectl exec --stdin=true --tty=true vault-0 -- vault operator unseal # ... Unseal Key 1
kubectl exec --stdin=true --tty=true vault-0 -- vault operator unseal # ... Unseal Key 2
kubectl exec --stdin=true --tty=true vault-0 -- vault operator unseal # ... Unseal Key 3

```

Create and enable the `development` `kv`.
Log into your vault pod and run the following commands:
```
vault login
vault secrets enable -path=development kv
```
