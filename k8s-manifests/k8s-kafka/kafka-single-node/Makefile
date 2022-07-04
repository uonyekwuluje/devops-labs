KUBECONFIG :=$(HOME)/.kube/dev-config

nodes:
	@KUBECONFIG=$(KUBECONFIG) kubectl get nodes

create:
	@KUBECONFIG=$(KUBECONFIG) kubectl apply -f kafka-deployment.yaml
delete:
	@KUBECONFIG=$(KUBECONFIG) kubectl delete -f kafka-deployment.yaml

status:
	@KUBECONFIG=$(KUBECONFIG) kubectl get pods -n kafka-standalone
