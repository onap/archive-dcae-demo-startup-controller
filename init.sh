#!/bin/bash

U=$(grep NEXUS-USER /opt/app/dcae-controller/config.yaml | sed s/NEXUS-USER:.//)
P=$(grep NEXUS-PASSWORD /opt/app/dcae-controller/config.yaml | sed s/NEXUS-PASSWORD:.//)
D=$(grep DOCKER-REGISTRY /opt/app/dcae-controller/config.yaml | sed s/DOCKER-REGISTRY:.//)
V=$(grep DCAE-VERSION /opt/app/dcae-controller/config.yaml | sed s/DCAE-VERSION:.//)
MTU=$(/sbin/ifconfig | grep MTU | sed 's/.*MTU://' | sed 's/ .*//' | sort -n | head -1)

if [ "$V" == "" ]; then V=1.0.0; fi

sed -i s/NEXUS-USER/$U/ Makefile
sed -i s/NEXUS-PASSWORD/$P/ Makefile
sed -i s/DOCKER-REGISTRY/$D/ Makefile
sed -i s/DCAE-VERSION/$V/ Makefile

sed -i s/DOCKER-REGISTRY/$D/ docker-compose.yml
sed -i s/DCAE-VERSION/$V/ docker-compose.yml
sed -i s/MTU/$MTU/ docker-compose.yml
