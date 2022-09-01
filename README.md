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

Create three Elastic IPs (EIPs).

Create three NAT gateways and associate the Elastic IPs with them.

Create three private routes so there is one for each availability zone.

Associate each private route with the respective NAT gateway.

Associate the app and DB layer subnet to each private route.

Associate the public subnets to the public route.

Create an internet gateway.

Attach the internet gateway to the VPC that you created earlier.

Associate the public route with the internet gateway.

