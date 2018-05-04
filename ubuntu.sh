#!/bin/bash

echo "------------------------------------"
echo "Welcome to Ubuntu 16.04 Provisioning"
echo "------------------------------------"

ROOT_DIR=$PWD
export ANSIBLE_HOST_KEY_CHECKING=False

terra_apply() {
cd $ROOT_DIR/terraform
terraform apply


ansible_configure() {
echo "Waiting for 300 seconds for the Ec2 box to come online"
sleep 300
ansible-playbook -i $ROOT_DIR/ansible/hosts $ROOT_DIR/ansible/index.yml -e 'ansible_python_interpreter=/usr/bin/python3'
}

while true; do
    read -p "Do you wish to prceed with server configurations? " yn
    case $yn in
        [Yy]* ) ansible_configure; break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;
    esac
done

}

terra_destroy() {
cd $ROOT_DIR/terraform
terraform destroy
}

while true; do
    read -p "Do you wish to proceed with server provisioning? " yn
    case $yn in
        [Yy]* ) terra_apply; break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;
    esac
done

while true; do
    read -p "Do you wish to prceed with terraform destroy? " yn
    case $yn in
        [Yy]* ) terra_destroy; break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;
    esac
done
