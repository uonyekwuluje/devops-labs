# Storage for Persistent Volumes
For On-Premise kubernetes setup, dynamic provisioning is usually non-existent. This has to be accounted for
when considering the use of persistent volumes. This write-up shows how to use NFS and GlusterFs in accomplishing
these goals.

### NFS Setup
I'll be using CentOS 7 to setup the NFS server
```
sudo yum install -y nfs-utils
sudo systemctl start nfs-server rpcbind
sudo systemctl enable nfs-server rpcbind

sudo mkdir /nfs-share1
sudo chmod 777 /nfs-share1

vi /etc/exports
-->
/nfs-share1 *(rw,sync,no_root_squash)
```


## Operations
Generate MySQL Secret
```
echo -n "password" | base64
```
Update the manifest with the password

```
# Create Resource
kubectl apply -f nfs-mysql-deployment.yml
OR
kubectl apply -f glusterfs-mysql-deployment.yml
OR
kubectl delete -f local-mysql-deployment.yml

# Connect
kubectl exec -it svc/mysql-svc -n mysql -- mysql -ppassword
```

# Reference
https://blog.vikki.in/kubernetes-stateful-set-with-local-storage-persistent-volume/
https://medium.com/stakater/k8s-deployments-vs-statefulsets-vs-daemonsets-60582f0c62d4
https://www.howtoforge.com/create-a-statefulset-in-kubernetes/
