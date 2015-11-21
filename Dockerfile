FROM ubuntu
MAINTAINER Gerald Fiedler <gfiedler@sftech.de>

RUN echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
RUN apt-get update \
    && apt-get install -y \
       software-properties-common \
    && apt-add-repository ppa:webupd8team/java \
    && apt-get update \
    && apt-get install -y \
       oracle-java7-installer \
    && update-java-alternatives -s java-7-oracle
RUN apt-get update \
    && apt-get install -y \
       openbox \
       libxxf86vm1 \
       x11-common

ADD https://s3.amazonaws.com/Minecraft.Download/launcher/Minecraft.jar Minecraft.jar

# fix java8: RuntimeException: Error initializing QuantumRenderer: no suitable pipeline found
# RUN apt-get install -y libswt-gtk-3-java gtk3-engines-*

CMD ["java", "-jar", "Minecraft.jar"]
