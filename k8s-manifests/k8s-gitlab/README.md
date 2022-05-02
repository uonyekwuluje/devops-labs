# Deploy GitLab CI Runner
This manifests can be used to deploy GitLab Runners in your Kubernetes Cluster

## Get your GitLab Token
Log into Gitlab and get your registrtion token. Covert it into base64
```
echo YOUR_GITLAB_CI_TOKEN | base64 -w0
```
Update `runner-cms.yaml` and execute the YAMLs below
```
kubectl apply -f runner-cms.yaml
kubectl apply -f runner-deployment.yaml
```
Login to GitLab and verify it's there

## References
* https://edenmal.moe/post/2017/GitLab-Kubernetes-Running-CI-Runners-in-Kubernetes
