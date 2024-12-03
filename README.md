# DevOps-Challenge
DevOps challenge for interns in Acklen Avenue.

Every CLI configuration is assumed to be done before starting, meaning AWS CLI, Terraform and Ansible.

Step 1

Run git clone https://github.com/B4rz99/DevOps-Challenge.git

Step 2

Navigate to the terraform directory of the repository

Run terraform init to initiate terraform and download what's necessary

Step 3

Run terraform plan

It will ask you for your public IP for SSH access. You can consult it here https://whatismyipaddress.com and type it in the console adding a "/32" at the end.  Check the plan to make sure everything is in order.

Step 4

Run terraform apply --auto-approve=true

It will ask you again for you public IP, enter it and they AWS infrastructure will start its deployment.

Step 5

After its deplyoment you will see the .pem file was saved in the terraform directory and will need to change its permissions to use it later.

Run chmod 400 "AcklenAvenueKeyPair.pem"

Step 6

Now navigate to the ansible directory
The key pair for EC2 SSH access will be in the terraform directory, you must modify the ansible parameter "private_key_file" from the ansible.cfg file with the .pem file path.
For example private_key_file = /Users/user1/Dev/Chat-App-using-Socket.io/terraform/AcklenAvenueKeyPair.pem.  
Our remote user is "ubuntu" since we are using an ubuntu instance.

Step 7

In the deploy_node_app.yml file go to the task "Copy Node.js app to EC2 instance" and in "src:" type you app directory path.
For example, src: /Users/user1/Dev/Chat-App-using-Socket.io/app/

Step 8

Friendly reminder to navigate to ansible directory.

Run ansible -i aws_ec2.yml all -m ping

This will ensure you have SSH access to EC2 instances

You will be asked twice to continue connecting to EC2 instances, simply type "yes" twice.

Step 9

Run ansible-playbook -i aws_ec2.yml deploy_node_app.yml

This will deploy the app in the EC2 instances.

Step 10

Navigate to terraform directory

Run terraform output

You will see the ALB DNS name, copy and paste it adding "http://" before the link.


After you're done remember running terraform destroy --auto-approve=true to shut down every AWS resource.
