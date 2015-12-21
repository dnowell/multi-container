# nginx container
Nginx Sample Container #2

You will need 3 execute build steps in Jenkins for the whole project:

git clone https://github.com/dnowell/multi-container.git
echo ${BUILD_NUMBER} > multi-container/web/skel/build
docker build -t docker-pilot.dsc.umich.edu:31111/multi-container-web/
docker tag docker-pilot.dsc.umich.edu:31111/multi-container-web docker-pilot.dsc.umich.edu:31111/multi-container-web:${BUILD_NUMBER}
docker push docker-pilot.dsc.umich.edu:31111/multi-container-web

git clone https://github.com/dnowell/multi-container-db.git
echo ${BUILD_NUMBER} > multi-container-db/skel/build
docker build -t docker-pilot.dsc.umich.edu:31111/multi-container-db/
docker tag docker-pilot.dsc.umich.edu:31111/multi-container-db docker-pilot.dsc.umich.edu:31111/multi-container-db:${BUILD_NUMBER}
docker push docker-pilot.dsc.umich.edu:31111/multi-container-db

sed -i -e "s|docker-pilot.dsc.umich.edu:31111/multi-container-web:latest|docker-pilot.dsc.umich.edu:31111/multi-container-web:$BUILD_NUMBER|g" \
    multi-container-web/multi-container.host.marathon.local.json
curl -X PUT -H "Accept: application/json" -H "Content-Type: application/json" \
http://docker-pilot.dsc.umich.edu:8080/v2/apps/multi-container -d @multi-container/multi-container.host.marathon.local.json
