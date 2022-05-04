# DevOps SRE Tools
This is a collection of Docker, Kubernetes, Container, Scripts etc. for DevOps/SRE related tasks

## Image Builds
List of custom docker images for select tools
* [GitHub Action Runner Image](/docker-image-builds/githubaction-runner)
* [Harshicorp Cloud Tools](/docker-image-builds/harshicorp-tools)
* [Java and Maven Build Tools](/docker-image-builds/java-build-tools)
* [Ubuntu Versions](/docker-image-builds/ubuntu-tools)


## Install Istio
Check `https://github.com/istio/istio` for the release of your choice. Also ensure you have kubernetes up and running
```
export ISTIO_VERSION="1.13.3"
curl -LOs https://github.com/istio/istio/releases/download/${ISTIO_VERSION}/istioctl-${ISTIO_VERSION}-linux-amd64.tar.gz
sudo tar zxvf istioctl-${ISTIO_VERSION}-linux-amd64.tar.gz -C /bin/
rm istioctl-${ISTIO_VERSION}-linux-amd64.tar.gz
sudo chmod a+x /bin/istioctl
# Check version
istioctl version
```
Install
```
istioctl x precheck
istioctl install
```
