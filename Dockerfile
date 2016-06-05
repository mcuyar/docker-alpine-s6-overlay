FROM alpine:edge
MAINTAINER Matthew Cuyar <matt@enctypeapparel.com>

#----------------------------------------------------
# Base Alpine edge image w/s6 Overlay
#----------------------------------------------------
# @credit John Regan <john@jrjrtech.com>
# @original https://github.com/just-containers/s6-overlay

##/
 # Create the root file system
 #/
COPY rootfs /

##/
 # Install the s6 overlay
 #/
RUN apk add --no-cache sudo bash curl gzip unzip wget \
 && wget https://github.com/just-containers/s6-overlay/releases/download/v1.17.2.0/s6-overlay-amd64.tar.gz --no-check-certificate -O /tmp/s6-overlay.tar.gz \
 && tar xvfz /tmp/s6-overlay.tar.gz -C / \
 && rm -f /tmp/s6-overlay.tar.gz \
 && apk del wget

##/
 # Run the system init on entry
 #/
ENTRYPOINT [ "/init" ]