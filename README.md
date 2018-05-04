# Ubuntu-provisioning

Prerequisites
-----------

==>Terraform Installed in your localmachine/server
==>Ansible Installed in your localmachine/server
==>AWS Access/Secret Keys

Working
------

(i)  Terraform does, 
	provisioning an Ubuntu 16.04 server AWS environment
	Setting up the firewall to only allow ingress on the ssh port in AWS security group

(ii) Ansible takes care of
	Allow login over ssh, 
	Securely and disable password based login
	Only to allow password-less (certificate) based login
	Display the MOTD including the text "Hello Assurity DevOps”.

Steps to execute
----------------

	git pull
	cd Ubuntu-provisioning/
        ssh-keygen -f mykey
 	chmod 400 mykey 
	bash ubuntu.sh


