KUBECONFIG :=$(HOME)/.kube/config

nodes:
	@KUBECONFIG=$(KUBECONFIG) kubectl get nodes

build_backend:
	ssh ubuntu@192.168.1.23 sudo mkdir -p /data/sonarqube/postgres
	ssh ubuntu@192.168.1.23 sudo chmod 777 /data/sonarqube/
	@KUBECONFIG=$(KUBECONFIG) kubectl apply -f namespace.yml
	@KUBECONFIG=$(KUBECONFIG) kubectl apply -f volume-deployment.yml
	@KUBECONFIG=$(KUBECONFIG) kubectl apply -f postgres-deployment.yml

destroy_backend:
	@KUBECONFIG=$(KUBECONFIG) kubectl delete -f postgres-deployment.yml
	@KUBECONFIG=$(KUBECONFIG) kubectl delete -f volume-deployment.yml
	@KUBECONFIG=$(KUBECONFIG) kubectl delete -f namespace.yml

build_sonarqube:
	ssh ubuntu@192.168.1.23 sudo mkdir -p /data/sonarqube/{data,extensions}
	ssh ubuntu@192.168.1.23 sudo mkdir -p /data/sonarqube/extensions/plugins
	ssh ubuntu@192.168.1.23 sudo chmod 777 /data/sonarqube/
	@KUBECONFIG=$(KUBECONFIG) kubectl apply -f sonarqube-deployment.yml

destroy_sonarqube:
	@KUBECONFIG=$(KUBECONFIG) kubectl delete -f sonarqube-deployment.yml
	ssh ubuntu@192.168.1.23 sudo rm -Rf /data/sonarqube/{data,extensions}

destroy_all:
	@KUBECONFIG=$(KUBECONFIG) kubectl delete -f sonarqube-deployment.yml
	@KUBECONFIG=$(KUBECONFIG) kubectl delete -f postgres-deployment.yml
	@KUBECONFIG=$(KUBECONFIG) kubectl delete -f volume-deployment.yml
	@KUBECONFIG=$(KUBECONFIG) kubectl delete -f namespace.yml
	ssh ubuntu@192.168.1.23 sudo rm -Rf /data/sonarqube/
	@KUBECONFIG=$(KUBECONFIG) kubectl delete pv local-data-storage-pv local-extension-storage-pv
