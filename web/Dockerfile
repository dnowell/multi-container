FROM nginx

COPY ./skel /

RUN apt-get update
    
RUN chmod +x init.sh

CMD ["./init.sh"]
