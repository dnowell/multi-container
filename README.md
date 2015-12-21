# Multi container
Multiple Containers in one Project

You will need 2 execute build steps in Jenkins for the whole project:

This step builds the 2 different containers.  
-----------


git clone https://github.com/dnowell/multi-container.git

echo ${BUILD_NUMBER} > multi-container/db/skel/build

echo ${BUILD_NUMBER} > multi-container/web/skel/build

cd multi-container

docker build -t docker-pilot.dsc.umich.edu:31111/multi-container-db db/

docker tag -f docker-pilot.dsc.umich.edu:31111/multi-container-db docker-pilot.dsc.umich.edu:31111/multi-container-db:${BUILD_NUMBER}

docker push docker-pilot.dsc.umich.edu:31111/multi-container-db

docker build -t docker-pilot.dsc.umich.edu:31111/multi-container-web web/

docker tag -f docker-pilot.dsc.umich.edu:31111/multi-container-web docker-pilot.dsc.umich.edu:31111/multi-container-web:${BUILD_NUMBER}

docker push docker-pilot.dsc.umich.edu:31111/multi-container-web

-------------

This step updates the build version in the JSON file we send to Marathan, and then sends the new one.  The updated build number tells Marathon to redeploy.

-------

sed -i -e "s|docker-pilot.dsc.umich.edu:31111/multi-container-db:latest|docker-pilot.dsc.umich.edu:31111/multi-container-db:$BUILD_NUMBER|g" multi-container/multi-container.marathon.json

sed -i -e "s|docker-pilot.dsc.umich.edu:31111/multi-container-web:latest|docker-pilot.dsc.umich.edu:31111/multi-container-web:$BUILD_NUMBER|g" multi-container/multi-container.marathon.json

curl -X PUT -H "Accept: application/json" -H "Content-Type: application/json" http://docker-pilot.dsc.umich.edu:8080/v2/apps/multi-container -d @multi-container/multi-container.marathon.json

