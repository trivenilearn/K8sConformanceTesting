# For ease of use, set this local environment variable so kubectl uses the downloaded file:
export KUBECONFIG=$(pwd)/kubeconfig

# Run this command to list all Kubernetes nodes
kubectl get nodes

# Installation of sonobuoy
# Download the latest release for your client platform
wget https://github.com/vmware-tanzu/sonobuoy/releases/download/v0.14.0/sonobuoy_0.14.0_linux_amd64.tar.gz
tar -xvf sonobuoy_0.14.0_linux_amd64.tar.gz
mv sonobuoy sonobuoy14
sudo cp sonobuoy14 /usr/bin
