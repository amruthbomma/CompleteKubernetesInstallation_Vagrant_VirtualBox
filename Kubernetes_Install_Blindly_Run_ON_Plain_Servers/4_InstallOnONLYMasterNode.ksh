# Install Flannel in the cluster by running this only on the Master node:
# If you see any issues with Flannel google search kube-flannel.yml
sudo kubectl apply -f https://raw.githubusercontent.com/mrlxxx/kube-flannel.yml/master/kube-flannel.yml
echo "  "
echo "  "
# Verify that all the nodes now have a STATUS of Ready :
echo " !!! SLEEPING for 40 Seconds to ensure the STATUS reflects to RUNNING !!!!"
sleep 40
kubectl get nodes
echo "  "
echo "  "
echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!   AFTER: The nodes are expected to have a STATUS of READY at this point     !!!!!!!!!!!!!!!!!!!!!!!!!!!!"    
echo "  "
echo "  "


echo "  "
echo "  "
echo "!!!!!!!!!!!!!!!!!!    It is also a good idea to verify that the Flannel pods are up and running. Run this command to get a list of system pods    !!!!!!!!!" 
kubectl get pods -n kube-system
echo "  "
echo "  "
echo "  "
echo "  "
echo "!!!!!!         You should have three pods with flannel in the name, and all three should have a status of Running .      !!!!!!!!!" 
