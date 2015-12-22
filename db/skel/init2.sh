#!/bin/bash
service mongod start
#mongoimport /mongo-data/data.json
echo RUNNING INIT 2
ps -ef
ps -ef > /processes.txt
echo "HELLO THERE" > /file.txt


