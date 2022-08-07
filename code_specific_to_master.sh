#  To use the systemd cgroup driver, 
#  in /etc/containerd/config.toml.
# This approach 
    # sudo rm /etc/containerd/config.toml
    # sudo systemctl restart containerd
# Or
    # sudo vi /etc/containerd/config.toml
    #Change below to true in [plugins."io.containerd.grpc.v1.cri".containerd.runtimes.runc.options]
        # i.e SystemdCgroup = true
    # sudo systemctl restart containerd



# Step 5: Initialize master node
# Enable kubelet service
sudo systemctl enable kubelet

sudo kubeadm init --apiserver-advertise-address=$(hostname -i)  --apiserver-cert-extra-sans=$(hostname -i)  --pod-network-cidr=172.31.31.4/16 --node-name $(hostname -s) --ignore-preflight-errors Swap
    # mkdir -p $HOME/.kube
    # sudo cp -f /etc/kubernetes/admin.conf $HOME/.kube/config
    # sudo chown $(id -u):$(id -g) $HOME/.kube/config

    # kubeadm join k8s-cluster.computingforgeeks.com:6443 --token sr4l2l.2kvot0pfalh5o4ik \
    # --discovery-token-ca-cert-hash sha256:c692fb047e15883b575bd6710779dc2c5af8073f7cab460abd181fd3ddb29a18

# kubectl cluster-info

# Step 6: Install network plugin on Master
kubectl create -f https://docs.projectcalico.org/manifests/calico.yaml 


# Add Worker Nodes To Kubernetes Master Node
# Execute joint command from previous output
# kubeadm join 172.31.31.4:6443 --token 3keor5.8zw1fjh6xj5helmd --discovery-token-ca-cert-hash sha256:91167ad67445627df7e7f41d73fb2c776cbba7018f94c826e63c177619466a03

# If you missed the join command, execute the following command in the master node to recreate the token with the join command.
# kubeadm token create --print-join-command



# kubectl get nodes

kubeadm join 172.31.22.74:6443 --token c4hf27.pq0ru9u8sqh6jlqv \
        --discovery-token-ca-cert-hash sha256:686919abd37bc190da1482535df42aa767436e7e4626802c21fef119b3940fed
