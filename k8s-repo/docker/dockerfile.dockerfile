#dockerfile
FROM ubuntu
#Mention Maintainer(Optional) who is going to maintain dhis file
#MAINTAINER Gabhijeet55@gmail.com


#label for testing
LABEL NAME TestDockerfile
LABEL ENV Stageign
RUN apt update -y && apt install nginx apache2 openssh-server -y
#ADD
#COPY
#ENV
#EXPOSE
#STOPSIGNAL
#USER
#VOLUME
#WORKDIR
#ONBUILD