#!/bin/bash

#install jenkins
sudo apt-get update -y
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt update -y
sudo apt install openjdk-11-jre -y
sudo apt install jenkins -y
sudo systemctl enable jenkins
sudo systemctl start jenkins

 #install docker
sudo apt update -y #Check if the system is up-to-date using the following command
sudo apt  install docker.io -y 
 
 #install aws cli 
 sudo apt install awscli -y
 
 #install terraform 
 wget https://releases.hashicorp.com/terraform/1.0.7/terraform_1.0.7_linux_amd64.zip 
 sudo apt-get install zip -y 
 unzip terraform*.zip
 sudo mv terraform /usr/local/bin/
 
 
 
 #hosts
# [Install]
#node1 ansible_host=44.203.199.0 ansible_user=ubuntu
#[all:vars]
#ansible_ssh_private_key_file=/home/ec2-user/exam1.pem

