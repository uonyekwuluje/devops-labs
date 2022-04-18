# Hashicorp Tools

## Build Image
Run the command below to build the image
```
docker build -t hashicorp-tools-image .
```

## List Image
List the images
```
docker image ls

REPOSITORY              TAG       IMAGE ID       CREATED          SIZE
hashicorp-tools-image   latest    83685c7ab9bc   21 seconds ago   112MB
alpine                  3.12      389fef711851   3 weeks ago      5.58MB
```

## Test Image
Create a container and test the image
```
docker run -ti hashicorp-tools-image bash

bash-5.0# terraform --version
Terraform v0.14.4
bash-5.0# packer --version
1.6.6
```
