# Ubuntu-provisioning

Prerequisites
-----------

1 : Terraform Installed in your localmachine/server\n
2 : Ansible Installed in your localmachine/server\n
3 : AWS Access/Secret Keys\n

Working
------

(1)  Terraform does, 
	provisioning an Ubuntu 16.04 server AWS environment
	Setting up the firewall to only allow ingress on the ssh port in AWS security group

(2) Ansible takes care of
	Allow login over ssh, 
	Securely and disable password based login
	Only to allow password-less (certificate) based login
	Display the MOTD including the text "Hello Assurity DevOps”.

Steps to execute
----------------

git pull https://github.com/cyrilmathew/Ubuntu-provisioning.git
cd Ubuntu-provisioning/
ssh-keygen -f mykey
chmod 400 mykey 
bash ubuntu.sh


