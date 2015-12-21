#!/bin/bash

build=$(cat build)

sed -i -e "s|<containerid>|$(hostname)|g"  \
       -e "s|<build>|$build|g"       \
       /usr/share/nginx/html/index.html

PASSVAL=`grep PASSWORD /password | cut -d= -f2`

sed -i "s/PASSWORD/$PASSVAL/g" /usr/share/nginx/html/index.html

exec nginx -g 'daemon off;'
