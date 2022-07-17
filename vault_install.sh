#!/bin/bash
# Install a dev Vault container

install_Vault(){
    echo "Run a Dev Vault container"
    docker run --name vault-docker --cap-add=IPC_LOCK -e 'VAULT_DEV_ROOT_TOKEN_ID=myroot' -e VAULT_ADDR='http://0.0.0.0:8200' -p 8200:8200 --network="jenkins" vault &
}

configure_Vualt(){
    # In this case is we are hardcoding the token. JUST FOR DEV
    vault login -no-print myroot
    
    # Enable Approle for authentication between machines (Jenkins and Vault)
    vault auth enable approle
    
    # Create a new approle named jenkins that will last forever
    vault write auth/approle/role/jenkins \
    token_num_uses=0 \
    secret_id_num_uses=0 \
    policies="jenkins-policy"

    # Writing the jenkins-policy
    cat << EOF > jenkins-policy.hcl
    path "secret/*" {
        capabilities = ["read","create","update"]
    }"
    EOF

    # Applying the new policy
    vault policy write jenkins-policy jenkins-policy.hcl
}