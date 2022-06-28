KUBECONFIG :=$(HOME)/.kube/config

list_apps:
	argocd app list

create_sonarqube:
	@KUBECONFIG=$(KUBECONFIG) kubectl apply -f argocd-apps/argo-sonarqube-deploy.yml
destroy_sonarqube:
	argocd app delete sonarqube9-app-stack -y

create_nexus:
	@KUBECONFIG=$(KUBECONFIG) kubectl apply -f argocd-apps/argo-nexus-deploy.yml
destroy_nexus:
	argocd app delete nexus3-app-stack -y
