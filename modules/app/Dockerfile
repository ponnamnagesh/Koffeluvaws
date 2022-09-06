FROM ubuntu:16.04

MAINTAINER pjlionel@gmail.com

RUN 	 apt-get update && \
	     apt-get install -y && \
         apt-get install -y python-pip && \
         pip install flask

COPY . /src

EXPOSE 8080

CMD cd /src && python home.py
