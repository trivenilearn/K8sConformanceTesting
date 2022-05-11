# For usage - please discuss with your faculty

- Create your AWS account at https://aws.amazon.com by following the on-screen instructions. Part of the sign-up process involves receiving a phone call and entering a PIN using the phone keypad. 

- Use the region selector in the navigation bar to choose the AWS Region where you want to deploy Kubernetes on AWS. 
- Regions are dispersed and located in separate geographic areas. Each Region includes at least two Availability Zones that are isolated from one another but connected through low-latency links. 
- Consider choosing an AWS Region closest to your data center or corporate network to reduce network latency between systems running on AWS and the systems and users on your corporate network.

# Create a keyPair
- Create a key pair in your preferred region. To do this, in the navigation pane of the Amazon EC2 console, choose Key Pairs, Create Key Pair, type a name, and then choose Create.

![image](https://user-images.githubusercontent.com/45666264/167769439-66b773a4-1d0d-49f7-857e-dd05d9bc9386.png)

Use this Quick Start to set up the following components on AWS:
A virtual private cloud (VPC) in a single Availability Zone.*
Two subnets, one public and one private.*
One EC2 instance acting as a bastion host in the public subnet.*
One EC2 instance with automatic recovery for the master node in the private subnet.
1-20 EC2 instances in an Auto Scaling group for additional nodes in the private subnet.
One Elastic Load Balancing (ELB) load balancer for HTTPS access to the Kubernetes API.
Ubuntu 18.04 LTS for all nodes.
kubeadm for bootstrapping Kubernetes on Linux.
Docker for the container runtime, which Kubernetes depends on.
Calico or Weave for pod networking. The default is Calico.
CoreDNS or KubeDNS for cluster DNS. The default is CoreDNS. KubeDNS is being replaced by CoreDNS and is provided only for environments that cannot support CoreDNS.
One stack-only security group that allows port 22 for SSH access (to the bastion host or directly to the stack, depending on configuration), port 6443 for HTTPS access to the API, and inter-node connectivity on all ports.
* The template that deploys the Quick Start into an existing VPC skips the tasks marked by asterisks and prompts you for your existing VPC configuration.

![image](https://user-images.githubusercontent.com/45666264/167769491-b1f33f2e-7318-4ebe-9a5d-b0d661e62516.png)

