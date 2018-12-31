#!/bin/sh

docker run -it --rm --name web-server-test -p 8083:8083 --mount type=bind,source="/code/channeladam.com/channeladam.com/public",target=/public -w /public channeladam/dev-https-server
