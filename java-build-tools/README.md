# Java Docker Build Tools

## Build Image
Run the command below to build the image
```
docker build -t jdk18-mvn-image .
```

## List Image
List the images `docker image ls`
```
REPOSITORY              TAG       IMAGE ID       CREATED          SIZE
jdk18-mvn-image         latest    56b89eab145f   14 seconds ago   1.87GB
fedora                  35        b97d90f26110   4 weeks ago      153MB
```

## Test Image
Create a container and test the image. `docker run -ti jdk18-mvn-image bash`
```
# java -version
java version "18" 2022-03-22
Java(TM) SE Runtime Environment (build 18+36-2087)
Java HotSpot(TM) 64-Bit Server VM (build 18+36-2087, mixed mode, sharing)

# mvn --version
Apache Maven 3.8.5 (3599d3414f046de2324203b78ddcf9b5e4388aa0)
Maven home: /opt/apache-maven
Java version: 18, vendor: Oracle Corporation, runtime: /opt/jdk-18
Default locale: en, platform encoding: UTF-8
OS name: "linux", version: "5.10.0-13-amd64", arch: "amd64", family: "unix"
```
