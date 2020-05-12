# NGINX container example build with Packer

## Description

This repo demonstrates a packer build that you can use to build an NGINX container using either ubuntu or centos depending on your preference.

## Instructions on how to use this repo

Build the containers by specifying a variable called "from"

### Ubuntu
```
packer build -var 'from=ubuntu' nginx.json
```

### Centos
```
packer build -var 'from=centos' nginx.json
```

Once the container is built and pushed to the docker hub account, it can be ran via docker:

### Ubuntu
```
docker run -v `pwd`/html:/html -p 8888:80 timmahoney/ubuntu-nginx:latest
```

### Centos
```
docker run -v `pwd`/html:/html -p 8888:80 timmahoney/centos-nginx:latest
```

Once the container is running, you can access the web page via the browser at http://localhost:8888

### Couple of comments

The package manager caches are cleaned up, resulting in smaller images

Packer's method of building a container is nice because it results in fewer layers, which is better for consistency, but you don't get to take advantage of the layers functionality inherent in docker, so each build takes the full amount of time to run.  

The logs are configured to output to /dev/stdout, which is best practice. 