#!/bin/bash
# Installing terraform

binaries::installTerraform(){
    echo "Installing terraform version"
    terraform_version=terraform_1.2.4
    wget -q https://releases.hashicorp.com/terraform/${terraform_version}/terraform_${terraform_version}_linux_amd64.zip
    unzip terraform_${terraform_version}_linux_amd64.zip

    chmod +x terraform
    sudo cp terraform /usr/bin/terraform
    terraform version
    echo $PATH
}