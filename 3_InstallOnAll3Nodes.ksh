echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!    BEFORE: The nodes are expected to have a STATUS of NotReady at this point !!!!!!!!!!!!!!!!!!!!!!!!!!!!"    
kubectl get nodes
echo "  "
echo "  "
echo "  "
echo "  "
echo "net.bridge.bridge-nf-call-iptables=1" | sudo tee -a /etc/sysctl.conf
sudo sysctl -p

