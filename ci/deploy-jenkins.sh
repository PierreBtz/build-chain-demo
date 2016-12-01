#!/usr/bin/env bash

docker run -d -v /var/run/docker.sock:/var/run/docker.sock -v jenkins_home:/var/jenkins_home -p 80:8080 jenkinsdev
