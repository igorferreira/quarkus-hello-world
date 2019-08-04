####
# Before building the docker image run:
#
# mvn package -Pnative -Dnative-image.docker-build=true
#
# Then, build the image with:
#
# docker build -f src/main/docker/Dockerfile -t quarkus/quarkus-hello-world .
#
# Then run the container using:
#
# docker run -i --rm -p 8080:8080 quarkus/quarkus-hello-world
#
###
FROM centos:latest
# RUN yum -y update && yum install -y iproute iputils openssh-clients curl wget gcc glibc-devel zlib-devel
RUN yum -y update && yum install -y gcc glibc-devel zlib-devel
WORKDIR /work/
COPY target/*-runner /work/application
RUN chmod 775 /work
EXPOSE 8080
CMD ["./application", "-Dquarkus.http.host=0.0.0.0"]