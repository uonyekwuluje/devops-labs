KUBECONFIG :=$(HOME)/.kube/config

nodes:
	@KUBECONFIG=$(KUBECONFIG) kubectl get nodes

build:
	ssh root@192.168.1.22 sudo mkdir -p /data/nexus
	ssh root@192.168.1.22 sudo chmod 777 /data/nexus
	@KUBECONFIG=$(KUBECONFIG) kubectl apply -f nexus-deployment.yml

destroy:
	@KUBECONFIG=$(KUBECONFIG) kubectl delete -f nexus-deployment.yml
	ssh root@192.168.1.22 sudo rm -Rf /data/nexus
