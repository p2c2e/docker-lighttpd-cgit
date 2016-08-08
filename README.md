This repo contains files to create your own Docker image consisting of lighttpd and cgit.

Usually, you would just need to point and use the docker image uploaded to github. Use "sudhan/lighttpd_cgit" image.

 # How to build the Docker image

Clone and build:
```
git clone https://github.com/p2c2e/docker-lighttpd-cgit.git
cd docker-lighttpd-cgit
docker build . -t lighttpd_cgit
```

 # Using the docker image

 ## Conventions used in the image

If you are planning to use existing image on hub.docker.com, try to get the image via pull (to check if you are able to get it)
```
docker pull sudhan/lighttpd_cgit
```
To successfully use the image, you will need to:
   1. Point the container port to some valid host port
   1. Override the path to git repositories - mount your volume over /var/git directory
   1. Override the /etc/cgitrepos file to your own copy. This file gets included by the default /etc/cgitrc file

 ## Running the image
Assuming this is all done, run the image as follows. This example assumes that there is a cgitrepos file in /tmp and /tmp/localrepos has the repositories to display.
```
docker run -v /tmp/localrepos:/var/git -v /tmp/cgitrepos:/etc/cgitrepos -p 8888:80 -d lighttpd_cgit
```
As a sample, the above command uses /tmp/cgitrepos that contains the following:

```
# Non bare repo - hence pointing explicitly to .git folder. Read the cgit docs.
repo.url=My Repo 1
repo.path=/var/git/myrepo/.git
repo.desc=This repo is at /tmp/localrepos/myrepo in local machine. It is a normal (non-bare) repo
```
