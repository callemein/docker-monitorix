FROM ubuntu:20.04
MAINTAINER Timothy Callemein <timothy@callemein.be>

RUN apt-get update -y && DEBIAN_FRONTEND=noninteractive apt-get install -yq \
    rrdtool \
    perl \
    libwww-perl \
    libmailtools-perl \
    libmime-lite-perl \
    librrds-perl \
    libdbi-perl \
    libxml-simple-perl \
    libhttp-server-simple-perl \
    libconfig-general-perl \
    libio-socket-ssl-perl \
    wget \
    nano
    
RUN wget https://www.monitorix.org/monitorix_3.12.0-izzy1_all.deb && \
    dpkg -i monitorix*.deb

# Add the launch script
ADD launch.sh /launch.sh
RUN chmod +x /launch.sh

ENTRYPOINT /launch.sh

