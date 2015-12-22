FROM mongo

COPY ./skel /

CMD ["mongod --fork --logpath /var/log/mongodb/mongodb.log"]

RUN chmod +x init.sh

CMD ["./init.sh"]
