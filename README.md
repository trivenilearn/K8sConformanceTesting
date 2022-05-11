# For usage - please discuss with your faculty


# 1. Create AWS Account
  - Create your AWS account at https://aws.amazon.com by following the on-screen instructions. Part of the sign-up process involves receiving a phone call and entering a PIN using the phone keypad. 
  - Use the region selector in the navigation bar to choose the AWS Region where you want to deploy Kubernetes on AWS. 
  - Regions are dispersed and located in separate geographic areas. Each Region includes at least two Availability Zones that are isolated from one another but connected through low-latency links. 
  - Consider choosing an AWS Region closest to your data center or corporate network to reduce network latency between systems running on AWS and the systems and users on your corporate network.

# 2. Create a keyPair
  - Create a key pair in your preferred region. To do this, in the navigation pane of the Amazon EC2 console, choose **Key Pairs, Create Key Pair**, type a name, and then choose Create.

# 3. Launch a Kubernetes cluster 
  - Click on https://aws.amazon.com/quickstart/architecture/vmware-kubernetes/
  - Select **Deploy into a new VPC**
  - **Step 1 - Specify template** 
    - On the Select Template page, keep the default setting for the template URL, and then
choose Next.
    - 
    - Use default options and click on Next. Note – region is Oregon (us-west-2)

![image](https://user-images.githubusercontent.com/45666264/167770644-a03279c2-a5d1-4c5d-891d-94b5c1d882b0.png)

  - **Step 2 - Specify stack details** 
    - On the Specify Details page, change the stack name if needed. Review the parameters for the template. Provide values where input is required. For all other parameters, review the default settings and customize them as necessary. When all parameters are set, choose Next.








![image](https://user-images.githubusercontent.com/45666264/167769622-acb3f82e-115b-4e90-af95-b3786185b212.png)


Step 3 - Configure stack options - Use default options and click on Next
![image](https://user-images.githubusercontent.com/45666264/167769632-310a58c1-46c0-4a28-a215-da9404f9bb65.png)



Step 4 - Review – 
Use default options 
Select the two checkboxes for 
I acknowledge that AWS CloudFormation might create IAM resources with custom names.
I acknowledge that AWS CloudFormation might require the following capability: CAPABILITY_AUTO_EXPAND
and click on Create Stack 

![image](https://user-images.githubusercontent.com/45666264/167769642-2e3d1023-d147-4d26-afe3-eb2c83eb5e67.png)

Create ubuntu EC2- T2.Micro
Install kubectl as per 
https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" 
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl 
kubectl version --client 
kubectl version --client --output=yaml 
![image](https://user-images.githubusercontent.com/45666264/167769675-9a71a1b5-8a0b-4025-b182-bb7b50598329.png)


For ease of use, set this local environment variable so kubectl uses the downloaded file:
export KUBECONFIG=$(pwd)/kubeconfig

SSH_KEY="path/to/GP_Key_RSA.pem"; scp -i $SSH_KEY -o ProxyCommand="ssh -i \"${SSH_KEY}\" ubuntu@54.90.164.238 nc %h %p" ubuntu@10.0.17.223:~/kubeconfig ./kubeconfig
export KUBECONFIG=$(pwd)/kubeconfig
kubectl get nodes


![image](https://user-images.githubusercontent.com/45666264/167769693-334e6480-534c-49d7-b243-2ed6ce240473.png)

![image](https://user-images.githubusercontent.com/45666264/167769709-8ebd84ed-5603-41d6-b81e-7a9989a2b4d3.png)


Download an older version
https://github.com/vmware-tanzu/sonobuoy/releases/tag/v0.14.0
wget https://github.com/vmware-tanzu/sonobuoy/releases/download/v0.14.0/sonobuoy_0.14.0_linux_amd64.tar.gz

Extract the tarball
tar -xvf <RELEASE_TARBALL_NAME>.tar.gz 
Rename the file 
Mv sonobuoy sonobuoy14
Move the extracted sonobuoy executable to somewhere on your PATH.
sudo cp sonobuoy14 /usr/bin

![image](https://user-images.githubusercontent.com/45666264/167769728-14326a9c-e383-4023-8d86-b36586799356.png)

To launch conformance tests (ensuring CNCF conformance) and wait until they are finished run:
sonobuoy run --wait 

If required run the following commands again
SSH_KEY="path/to/GP_Key_RSA.pem"; scp -i $SSH_KEY -o ProxyCommand="ssh -i \"${SSH_KEY}\" ubuntu@54.90.164.238 nc %h %p" ubuntu@10.0.17.223:~/kubeconfig ./kubeconfig
export KUBECONFIG=$(pwd)/kubeconfig
kubectl get nodes

![image](https://user-images.githubusercontent.com/45666264/167769745-0184742f-520a-492d-a5f7-adb577263e73.png)
