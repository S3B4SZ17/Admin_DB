#!/bin/bash
# Installing terraform

binaries::installTerraform(){
    terraform version > /dev/null 2>&1
    if [ $? -ne 0 ]; then
        echo "Installing terraform version"
        terraform_version=1.2.4
        curl https://releases.hashicorp.com/terraform/${terraform_version}/terraform_${terraform_version}_linux_amd64.zip --output terraform_${terraform_version}_linux_amd64.zip
        unzip terraform_${terraform_version}_linux_amd64.zip

        chmod +x terraform
        cp terraform /usr/local/bin/terraform
        terraform version
        echo $PATH
    else
        echo "Terraform already installed"
    fi

}