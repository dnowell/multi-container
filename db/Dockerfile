FROM mongo

COPY ./skel /

RUN apt-get update

RUN apt-get install -y vim

RUN apt-get install -y procps

#RUN chmod +x init.sh

#CMD ["./init.sh"]

RUN chmod +x init2.sh

#CMD ["echo Running init2"]

RUN /init2.sh

