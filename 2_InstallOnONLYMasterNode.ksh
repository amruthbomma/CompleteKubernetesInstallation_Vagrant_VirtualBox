#On the Kube master node, initialize the cluster:

#Below command is used when not using a virtual Box form prosisionaing servers, means we will be having all three seperate Ubuntu servers. 
#Like in acloudGuru created
   #sudo kubeadm init --pod-network-cidr=10.244.0.0/16

echo "  "
echo "  "
echo "  "
#Below command may take a few minutes to complete.
sudo kubeadm init --apiserver-advertise-address 192.168.33.13 --pod-network-cidr=10.244.0.0/16
echo "  "
echo "  "
echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!    PLEASE COPY SOMEWHERE THE Kubectl JOIN command with Keys AND EXECUTE ON ONLY MASTER !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
echo "  "
echo "   !!!!  YOU WILL SEE SOMETHING LIKE THIS sudo kubeadm join $some_ip:6443 --token $some_token --discovery-token-ca-cert-hash $some_hash   "
echo "  "
echo "  "
echo "!!!!!!!!!!!!!!!!!!!!!! #After it is done, setting up the local kubeconfig  !!!!!!!!!!!!!!!!!!!!!!"
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
echo "  "
echo "  "
echo "  "
echo "!!!!!!!!!!!!!!!!!!!!!! #Verify that the cluster is responsive and that Kubectl is working: !!!!!!!!!!!!!!!!!!!!!!"
kubectl version
echo "  "
echo "  "
echo "  "
#You should get Server Version as well as Client Version . It should look something like this:
#The kubeadm init command should output a kubeadm join command containing a token and hash. Copy that
#command and run it with sudo on both worker nodes. It should look something like this:
echo "        EXAMPLE ONLY !!! kubeadm join 192.168.33.13:6443 --token 3ss7hf.wvo04g1n2d34o1i0 \  "
       echo "      --discovery-token-ca-cert-hash sha256:4e298e839f98dbfcf461f8d35fafb95dc1d2a6fcc57a838c0f938b39b5ba2635 !!! EXAMPLE ONLY "
echo "  "
echo "  "
echo "  "
echo "      SYNTAX looks :::        sudo kubeadm join $some_ip:6443 --token $some_token --discovery-token-ca-cert-hash $some_hash      "
#Verify that all nodes have successfully joined the cluster:
echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!    The nodes are expected to have a STATUS of NotReady at this point !!!!!!!!!!!!!!!!!!!!!!!!!!!!"    
kubectl get nodes

