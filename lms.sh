#!/usr/bin/bash

docker network create lms-app

docker container run -dt --name lms-db --network lms-app -p 5432:5432 -e POSTGRES_PASSWORD=admin123 postgres

cd lms/api/

sed -i 's/localhost/172.21.0.2/g' .env

docker image build -t lms-be .

docker container run -dt --name lms-be-con --network lms-app -p 8080:8080 lms-be

cd

cd lms/webapp/

sed -i 's/52.72.18.39/52.91.118.63/g' .env

docker image build -t lms-fe .

docker container run -dt --name lms-fe-con --network lms-app -p 80:80 lms-fe


