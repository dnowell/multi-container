FROM nginx

COPY ./web/skel /

RUN apt-get update
    
RUN chmod +x init.sh

CMD ["./init.sh"]
