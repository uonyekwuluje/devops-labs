# Ubuntu Base Image & Tools

## Build Image
Run the command below to build the image
```
docker build -t ubuntu-tools .
```

## List Image
List the images
```
docker images
```

## Upload Image
Login to Docker and Upload Image
```
docker tag ubuntu-tools augike101/ubuntu-tools
docker push augike101/ubuntu-tools:latest
```

## Test Image
```
docker run -ti ubuntu-tools bash
docker run -ti augike101/ubuntu-tools bash
```

## Inspect Image
```
docker inspect  ubuntu-tools
docker inspect --format "{{ index .Config.Labels \"build_version\" }}" ubuntu-tools-image
```
