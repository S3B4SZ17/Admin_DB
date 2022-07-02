#!/bin/bash
# Install a dev Vault container

echo "Run a Dev Vault container"
docker run --name vault-docker --cap-add=IPC_LOCK -e 'VAULT_DEV_ROOT_TOKEN_ID=myroot' -e VAULT_ADDR='http://0.0.0.0:8200' -p 8200:8200 --network="jenkins" vault &
