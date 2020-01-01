Docker-Yum-Repo-SSL
============================

docker-yum-repo-sll builds a yum repo server to run in a docker container. It is built
off of CentOS 7 and extends [dgutierrez1287/yum-repo:2.0.0](https://hub.docker.com/r/dgutierrez1287/yum-repo) .  It will update the repo automatically when an rpm is added or removed
courtesy of a custom repo scanner written in go using [rjeczalik/notify](https://github.com/rjeczalik/notify)

It you provide a mounted ssl certificate and ssl ceriticate key in pem format it will start up docker repo server on port 443.

* Cert must be mounted to /cert/cert.pem 
* Key must be mounted to /cert/cert.key 

# Install

```
docker pull vincentrussell/docker-yum-repo-ssl
``` 

# Development
## Install software
### homebrew (mac)
* brew install docker-machine
* brew install docker
* docker-machine create --driver virtualbox docker-yum-repo-ssl
* docker-machine env docker-yum-repo-ssl
* eval "$(docker-machine env docker-yum-repo-ssl)"


## build the docker container
Build and Run the docker container ...

```
docker build -t vincentrussell/docker-yum-repo-ssl .
docker run -p 8080:80 -p 8443:443 -it --rm vincentrussell/docker-yum-repo-ssl
```


# Use

This image was based on [dgutierrez1287/yum-repo:2.0.0](https://hub.docker.com/r/dgutierrez1287/yum-repo) so see [dgutierrez1287/docker-yum-repo](https://github.com/dgutierrez1287/docker-yum-repo) for detailed use instructions.

```
docker run -d -p 8443:443 -v /path/to/cert/cert.pem:/cert/cert.pem -v /path/to/cert/key.pem:/cert/cert.key -v /opt/repo:/repo vincentrussell/docker-yum-repo-ssl
```	

## ChangeLog

Version: 1.0.0, 2020-01-01

Initial Release