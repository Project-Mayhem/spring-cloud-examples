#!/bin/bash
# Inspiration for this script from:
# https://docs.docker.com/machine/get-started/
# https://linuxconfig.org/remove-all-containners-based-on-docker-image-name

BOXNAME=default
DRIVER=virtualbox

# This script requires virtualbox installed.
# Could have done with vagrant, I guess

# create a simple docker machine instance (if exists will fail)
# With no iso, will use boot2docker
# Could have used Mac native VM HyperKit... will
# look into this later
docker-machine create --driver "$DRIVER" $BOXNAME

# starts the machine if it was already created,
# otherwize fails.
docker-machine start $BOXNAME

# now, enable compose.  Can now issue docker or docker-compose commands
docker-compose up

# setup current environment
eval "$(docker-machine env $BOXNAME)"

docker-machine env $BOXNAME

#list all current docker machines
docker-machine ls

#get $BOXNAME's ip
docker-machine ip $BOXNAME

# Show currently running docker containers,
# also confirms that docker ecosystem is setup
# correctly and environment configured correctly
docker ps -a

# run busybox image as test
docker run busybox echo hello world

docker ps -a

docker ps -a | awk '{ print $1,$2 }' | grep busybox | awk '{print $1 }' | xargs -I {} docker rm {}
