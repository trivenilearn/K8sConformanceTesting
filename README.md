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

![image](https://user-images.githubusercontent.com/45666264/167782287-e16c9e6a-4e88-4231-99a1-5508beb97812.png)


  - **Step 1 - Specify template** 
    - On the Select Template page, keep the default setting for the template URL, and then choose **Next**.
    
![image](https://user-images.githubusercontent.com/45666264/167770644-a03279c2-a5d1-4c5d-891d-94b5c1d882b0.png)

  - **Step 2 - Specify stack details** 
    - On the Specify Details page, change the stack name if needed. 
    - Review the parameters for the template. 
    - Provide values where input is required. 
    - For all other parameters, review the default settings and customize them as necessary. 
    - When all parameters are set, choose **Next**.

![image](https://user-images.githubusercontent.com/45666264/167771461-a63e8a7d-d611-4143-bd6f-6599eab78b2b.png)

Availability Zone (AvailabilityZone) - The Availability Zone for this cluster. Generally, we recommend that you run one cluster per Availability Zone and use tooling to coordinate across zones.

Admin Ingress Location (AdminIngressLocation) - CIDR block (IP address range) to allow SSH access to the bastion host and HTTPS access to the Kubernetes API. Use **0.0.0.0/0** to allow access from all locations.

SSH Key (KeyName) - The name of an existing Amazon EC2 key pair, to enable SSH access to the instances. When you created an AWS account, this is the key pair you created in your preferred region.

  - **Step 3 - Configure stack options** 
    - Use default options and click on **Next**

  - **Step 4 - Review –** 
    - Use default options 
    - Select the two checkboxes for 
      - I acknowledge that AWS CloudFormation might create IAM resources with custom names.
      - I acknowledge that AWS CloudFormation might require the following capability: CAPABILITY_AUTO_EXPAND
      - and click on Create Stack 

![image](https://user-images.githubusercontent.com/45666264/167772955-a22847cd-34da-4279-b532-e214fda185c7.png)


**The deployment takes about 10 to 15 minutes.**

![image](https://user-images.githubusercontent.com/45666264/167774193-2203bc61-773f-492e-aee6-e99a35d10810.png)

**After the deployment is complete **

![image](https://user-images.githubusercontent.com/45666264/167778290-a579d4a2-1e2b-48e6-b9f8-76af5bd4ea75.png)



# (Optional) Test Your Kubernetes Cluster
  - Create ubuntu EC2- T2.Micro
    - **sudo apt update** 


    - **Install kubectl** as per https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/
      - kubectl is a command-line cluster management tool for Kubernetes

- The following steps would install kubectl
  - **curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"**
  - **sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl**
  - **kubectl version --client**
  - **kubectl version --client --output=yaml**

**Configure the kubectl environment**

  - If we are running this command on a cloud EC2 machine – we would need to bring the key to the machine. 
  - Upload your key to a new repo on Github and use git clone
  - Example 
    - **git clone https://github.com/JeeKayPee/Keys**
  - Run **chmod 400 keyname**

  ![image](https://user-images.githubusercontent.com/45666264/167778822-5b5b336a-9696-4362-ac52-e948a3384c32.png)


  - Use the GetKubeConfigCommand in the Outputs tab for the VPC stack to configure your local kubectl environment so you can connect to the resources that were created. 

![image](https://user-images.githubusercontent.com/45666264/167778506-95c6c4a6-6bce-4352-bd10-f8b2ceef6ce1.png)

![image](https://user-images.githubusercontent.com/45666264/167779171-5917a104-1bc3-44a4-ad10-29c41f886454.png)


  - For ease of use, set this local environment variable so kubectl uses the downloaded file:
    - **export KUBECONFIG=$(pwd)/kubeconfig**

  - Run this command to list all Kubernetes nodes
    - **kubectl get nodes**
  
  ![image](https://user-images.githubusercontent.com/45666264/167780044-0517ca11-e826-4d56-ab73-a71b1a9c308d.png)


# Installation of sonobuoy
  - Download the latest release for your client platform. 
    - (We are installing v14 - https://github.com/vmware-tanzu/sonobuoy/releases/tag/v0.14.0)
    - **wget https://github.com/vmware-tanzu/sonobuoy/releases/download/v0.14.0/sonobuoy_0.14.0_linux_amd64.tar.gz**
  - Extract the tarball:
    - tar -xvf <RELEASE_TARBALL_NAME>.tar.gz
    - Example - **tar -xvf sonobuoy_0.14.0_linux_amd64.tar.gz**
  - Rename the file
  ``` 
  mv sonobuoy sonobuoy14
  ```
  - Move the extracted sonobuoy executable to somewhere on your PATH.
  ``` 
  sudo cp sonobuoy14 /usr/bin
  ```
   

  ![image](https://user-images.githubusercontent.com/45666264/167779374-537d045d-edc4-48cc-badb-2f02f7e475dc.png)


# To launch conformance tests (ensuring CNCF conformance) and wait until they are finished run:

``` 
sonobuoy14 run --wait
```

**The test will take several hours to provide results**  
  
  ![image](https://user-images.githubusercontent.com/45666264/167780284-6224e577-42cc-4a44-beab-cd9ac3492379.png)

# Delete the stack

Select the cluster and click on the delete button
This will delete the EC2 machines as well


![image](https://user-images.githubusercontent.com/45666264/167834940-99a683b8-4544-4398-976e-2d7989ce62c7.png)
