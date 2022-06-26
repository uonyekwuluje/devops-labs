KUBECONFIG :=$(HOME)/.kube/config

nodes:
	@KUBECONFIG=$(KUBECONFIG) kubectl get nodes

build_backend:
	@KUBECONFIG=$(KUBECONFIG) kubectl apply -f namespace.yml
	@KUBECONFIG=$(KUBECONFIG) kubectl apply -f volume-deployment.yml
	@KUBECONFIG=$(KUBECONFIG) kubectl apply -f postgres-deployment.yml

destroy_backend:
	@KUBECONFIG=$(KUBECONFIG) kubectl delete -f postgres-deployment.yml
	@KUBECONFIG=$(KUBECONFIG) kubectl delete -f volume-deployment.yml
	@KUBECONFIG=$(KUBECONFIG) kubectl delete -f namespace.yml
	ssh ubuntu@192.168.1.24 sudo rm -Rf /data/sonarqube/postgres/pgdata

build_sonarqube: 
	@KUBECONFIG=$(KUBECONFIG) kubectl apply -f sonarqube-deployment.yml

destroy_sonarqube:
	@KUBECONFIG=$(KUBECONFIG) kubectl delete -f sonarqube-deployment.yml
	ssh ubuntu@192.168.1.24 sudo rm -Rf /data/sonarqube/data/*

destroy_all: destroy_sonarqube destroy_backend
