# The network design will have three different layers: a public subnet range, an app layer, and a database layer.

Objective:

Build a three-tiered network architecture.

Build a VPC as part of this design.

Build the underlying subnets to make up the network.

Workflow:

Using Terraform modules, create a script that depicts the VPC and the subnets that Sam laid out in the network diagram.

This script must include the three identified availability zones.
For each availability zone, make sure to build two private subnets and one public subnet.
Enable DNS hostnames for the VPC that you are building.

Map public IP addresses on launch for all subnets that are marked public.

Display the VPC ID as the output of applying the changes to the infrastructure.

![alt text](https://github.com/ponnamnagesh/Koffeluvaws/blob/master/networklayout.png)]


#Routing and Gateways

1. Create three Elastic IPs (EIPs).
EIP: An Elastic IP address is a static public IPv4 address associated with your AWS account in a specific Region. Unlike an auto-assigned public IP address, an Elastic IP address is preserved after you stop and start your instance in a virtual private cloud (VPC)

2. Create three NAT gateways and associate the Elastic IPs with them.
NAT Gateway: A NAT gateway is a Network Address Translation (NAT) service. You can use a NAT gateway so that instances in a private subnet can connect to services outside your VPC but external services cannot initiate a connection with those instances.

Create three private routes so there is one for each availability zone.

Associate each private route with the respective NAT gateway.

Associate the app and DB layer subnet to each private route.

Associate the public subnets to the public route.

Create an internet gateway.

Attach the internet gateway to the VPC that you created earlier.

Associate the public route with the internet gateway.



Create modules to represent compute and security.

Create an AMI based on a free tier instance type.

Create a key pair to be used with the EC2 instances. Use PEM format for Linux or Mac machines and PPK for Windows.

Create three EC2 instances based on the AMI that you built in step 2.

Create three bastion hosts using the same AMI.

Allow only port 22 access to the bastion hosts.

Allow only bastions to gain access to the private app instances.

To test connectivity, first input SSH into the public bastion host. Run the command ping 1.1.1.1. You should get a response, proving the internet gateway setup is working.

Now SSH to an app layer instance within the same availability zone. Run the command ping 1.1.1.1. A positive response will show that the NAT gateway is working well. Now you can run the command sudo yum update for OS updates.



Modify the Terraform script and add the following changes:

Create a new module called “containers.”

Create a new ECR repository.

Now, under your main project folder, create an app directory and do the following:

Using the SDK of your choice, create a sample website that runs on the context root /KoffeeLuv and content The Future Home of Koffee Luv.


Test that the website is working from local.

Dockerize the website using Docker commands.
Note: If this is the first time you are using Docker, then remember that all you need to do is install it on your machine. Then, if you are unsure about the commands to use to create an image, visit the ECR dashboard. It has a “View Push Commands” button. All the commands you need are mentioned there. A simple copy and paste of those commands will help you build the image and complete the necessary steps for this milestone.

Use Terraform to create the ECR repository.

Create a new ECS cluster using Terraform.

Create an autoscaling group with the desired capacity of one, a min size of one, and a max capacity of three.

Create a data source to get the latest ECS AMI.

Create a launch configuration with EC2s built off the AMI that was selected.

Create an ecsInstanceRole service role.

Create a security group with access to port 22 from the bastion security group.
Note: If your load balancer is draining instances, use the article “How can I get my Amazon ECS tasks running using the Amazon EC2 launch type to pass the Application Load Balancer health check in Amazon ECS?” to troubleshoot your ECS cluster. The problem is most likely because the health check URL is unhealthy or the security group configuration is wrong at the ECR or the load balancer level.
