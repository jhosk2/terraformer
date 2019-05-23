#!/bin/sh
echo ${TF_VERSION}
wget "https://releases.hashicorp.com/terraform/${TF_VERSION}/terraform_${TF_VERSION}_linux_amd64.zip"
unzip terraform_${TF_VERSION}_linux_amd64.zip 
mv terraform /bin/terraform_${TF_VERSION}
rm terraform_${TF_VERSION}_linux_amd64.zip 