# Ubuntu-provisioning

Prerequisites
-----------

1 : Terraform Installed in your localmachine/server

2 : Ansible Installed in your localmachine/server

3 : AWS Access/Secret Keys

Working
------

(1) Terraform does, 
		provisioning an Ubuntu 16.04 server AWS environment

		Setting up the firewall to only allow ingress on the ssh port in AWS security group

(2) Ansible takes care of

		Allow login over ssh, 

		Securely and disable password based login

		Only to allow password-less (certificate) based login
		
		Display the MOTD including the text "Hello Assurity DevOps”.

Steps to execute
----------------

git clone https://github.com/cyrilmathew/Ubuntu-provisioning.git

cd Ubuntu-provisioning/terraform

ssh-keygen -f terraform/mykey

chmod 400 terraform/mykey

bash ubuntu.sh

