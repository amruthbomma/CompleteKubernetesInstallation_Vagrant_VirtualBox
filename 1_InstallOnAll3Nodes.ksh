# Install Docker on ALL nodes 
# Reference https://acloudguru-content-attachment-production.s3-accelerate.amazonaws.com/1597958284283-01_03_Installing%20Docker.pdf
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository \
"deb [arch=amd64] https://download.docker.com/linux/ubuntu \
$(lsb_release -cs) \
stable"
sudo apt-get -y update
sudo apt-get install -y docker-ce=18.06.1~ce~3-0~ubuntu
 ## Apt-mark will prvent from docker getting upgraded
sudo apt-mark hold docker-ce
#You can verify that docker is working by running this command:
sudo docker version

# Install Kubernetes on All nodes kubeclt,kubeadm,kubelet and control plane on only Master
# Reference https://acloudguru-content-attachment-production.s3-accelerate.amazonaws.com/1597958299523-01_04_Installing%20Kubeadm%2C%20Kubelet%2C%20and%20Kubectl.pdf
# Need to Disable swap comamnd >swapoff -a
sudo swapoff -a
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
cat << EOF | sudo tee /etc/apt/sources.list.d/kubernetes.list
deb https://apt.kubernetes.io/ kubernetes-xenial main
EOF
sudo apt-get -y update
echo "  "
echo "  "
echo "  # Installing kubeclt, kubeadm, kubelet "
sudo apt-get install -y kubelet=1.15.7-00 kubeadm=1.15.7-00 kubectl=1.15.7-00
sudo apt-mark hold kubelet kubeadm kubectl
echo "  "
echo "  "
echo "  #After installing these components, verify that Kubeadm is working by getting the version info by command kubeadm version. "
kubeadm version

#restarting the kubectl service and validating the Kubectl service
rm -R /etc/systemd/system/kubelet.service.d && rm -rf /etc/systemd/system/kubelet.service
sudo systemctl daemon-reload && sudo systemctl restart kubelet && sudo systemctl status kubelet
exit
