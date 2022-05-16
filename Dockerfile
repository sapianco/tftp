# pull official base image
FROM alpine:3.14

# set environment varibles
ENV IS_DOCKER_CONTAINER Yes
ENV LOG_LEVEL INFO

# set work directory
VOLUME /tftpboot

#Install TFTP
RUN apk add --no-cache tftp-hpa vim

#Expose 69 UDP
EXPOSE 69/udp

#Ccomand
CMD ["-L", "--secure", "/tftpboot"]

# run entrypoint.sh
ENTRYPOINT ["in.tftpd"]

ARG BUILD_DATE
ARG VCS_REF
ARG VERSION

LABEL org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.name="tftp" \
      org.label-schema.description="Docekr Alpine Linux TFTP server implementation" \
      org.label-schema.url="https://www.sapian.cloud" \
      org.label-schema.vcs-url="https://github.com/sapianco/tftp" \
      org.label-schema.maintainer="sebastian.rojo@sapian.com.co" \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.vendor1="Sapian" \
      org.label-schema.version=$VERSION \
      org.label-schema.vicidial-schema-version="1"
