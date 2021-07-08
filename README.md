# k8s-cluster



spin up three node cluster

* 192.168.33.13 master
* 192.168.33.14 worker-1
* 192.168.33.15 worker-2

see the corresponding post from [here](https://baykara.medium.com/setup-own-kubernetes-cluster-via-virtualbox-99a82605bfcc)

* requirements
```
vagrant
virtualbox
```

Fire up vms
``` 
vagrant up
```
To access each machine respectively via 
```
vagrant ssh master
```
in master node

```
1. set root password
2. switch root account
3. kubeadm init --apiserver-advertise-address 192.168.33.13 --pod-network-cidr=10.244.0.0/16
4. remove --port 0 from /etc/kubernetes/manifests/kube-[controller-api| scheduler].yaml
5. join workers to master node
```
for workers
```
vagrant ssh [worker1|worker2]
```


Series of Steps:

    
			   ## CLEAR STEPS on KUBENERNETES INSTALLATIO ##
			   # Reference URLs - 
			   https://acloudguru-content-attachment-production.s3-accelerate.amazonaws.com/1597958284283-01_03_Installing%20Docker.pdf
			   https://acloudguru-content-attachment-production.s3-accelerate.amazonaws.com/1597958299523-01_04_Installing%20Kubeadm%2C%20Kubelet%2C%20and%20Kubectl.pdf
			   https://acloudguru-content-attachment-production.s3-accelerate.amazonaws.com/1597958312912-01_05_Bootstrapping%20the%20Cluster.pdf
			   https://acloudguru-content-attachment-production.s3-accelerate.amazonaws.com/1597958324141-01_06_Configuring%20Networking%20with%20Flannel.pdf
PRE - Requisites 
    1)Vagrant and VirtualBox Must be installed on system	
    2) On windows OS instead of using CommandPRompt you can use gitBash
 	
step 1: Provision 3 ubuntu linux servers using Vagrant/VirtualBox(1 master and 2 worker nodes)
        on your Windows / MAC OS do a git checkout  // 
		BEST Reference by 1st priority : https://medium.com/swlh/setup-own-kubernetes-cluster-via-virtualbox-99a82605bfcc
		                  2nd Priority : https://developers.caffeina.com/a-kubernetes-cluster-on-virtualbox-20d64666a678
        
		> git clone git@github.com:amruthbomma/CompleteKubernetesInstallation_Vagrant_VirtualBox.git
		# or 
	    #> git clone https://github.com/amruthbomma/CompleteKubernetesInstallation_Vagrant_VirtualBox.git 
        > vagrant up
Step 2: Install Softwares (Docker,kubeclt,kubeadm,kubelet,control plane),
        Log in to each servers and run the scripts according to the script naming convension.
		> ./1_InstallOnAll3Nodes.ksh
		> ./2_InstallOnONLYMasterNode.ksh
		 after 2nd script YOU  have to copy the Kubeadm join command output from Master to the 2 Worker nodes MANUALLY
		> ./3_InstallOnAll3Nodes.ksh
		> ./4_InstallOnONLYMasterNode.ksh
		


