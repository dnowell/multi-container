#!/bin/bash

build=$(cat build)

mongod --fork --logpath /var/log/mongodb/mongodb.log

mongoimport /mongo-data/data.json

