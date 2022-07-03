#!/bin/bash
# Commands to install ansible inside the jenkins container
# Connect to it: docker exec -u 0 -it jenkins-docker bash

binaries::installAnsible(){
    ansible --version > /dev/null 2>&1
    if [ $? -ne 0 ]; then
        echo "Installing Python3, Pip3 and Ansible"
        apt update
        apt install software-properties-common
        add-apt-repository ppa:deadsnakes/ppa
        apt install python3.9

        # Installing pip
        apt-get -y install python3-pip

        # Installing ansible
        python3 -m pip install ansible

        # Confirm ansible is installed
        ansible --version
    else
        echo "Ansible is installed"
    fi
}
