# Docker Github Runner

## Build Image
Run the command below to build the image
```
docker build -t github-runner-image .
```

## List Image
List the images
```
docker images

REPOSITORY            TAG       IMAGE ID       CREATED              SIZE
github-runner-image   latest    0802afd2374b   About a minute ago   1.06GB
ubuntu                18.04     2c047404e52d   6 weeks ago          63.3MB
```

## Test Image
Login to Image
```
docker run -ti augike101/githubrunner-ci bash
```
