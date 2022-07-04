KUBECONFIG :=$(HOME)/.kube/dev-config

nodes:
	@KUBECONFIG=$(KUBECONFIG) kubectl get nodes

create:
	@KUBECONFIG=$(KUBECONFIG) kubectl apply -f vault-storage.yaml
	@KUBECONFIG=$(KUBECONFIG) kubectl apply -f vault-deployment.yaml
	@KUBECONFIG=$(KUBECONFIG) kubectl apply -f vault-statefulset.yaml

delete:
	@KUBECONFIG=$(KUBECONFIG) kubectl delete -f vault-statefulset.yaml
	@KUBECONFIG=$(KUBECONFIG) kubectl delete -f vault-deployment.yaml
	@KUBECONFIG=$(KUBECONFIG) kubectl delete -f vault-storage.yaml
