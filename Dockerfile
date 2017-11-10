FROM ubuntu:xenial
MAINTAINER yinglilu@gmail.com

#PACS parameters
#lisener AE title
ARG AETITLE=BIDSDUMP
#licener port
ARG PORT=11116
#dicom output to here
ARG ROOTPATH=/data
#git clone from this branch
ARG BRANCH=isolove

#can be modified when do docker build, for instance, --build-arg BRANCH=isolove

RUN apt-get update && apt-get install -y build-essential \
                                          cmake  \
                                          wget \
                                          vim \
                                          libpng12-dev \
                                          libtiff5-dev \
                                          libxml2-dev  \
                                          zlib1g-dev  \
                                          libwrap0-dev \ 
                                          libssl-dev \
                                          python-dev \
                                          apt-utils \
                                          git \
                                          zip \
                                          unzip \
                                          python2.7 \
                                          python-pip

#RUN apt-get install -y ssh nmap
RUN pip install -U pip setuptools

#install MsSQL-python
RUN apt-get install -y libmysqlclient-dev && pip install MySQL-python==1.2.5

#install pydicom
WORKDIR /tmp
RUN git clone https://www.github.com/pydicom/pydicom.git
WORKDIR  pydicom
RUN python setup.py install

#install pynetdicom
WORKDIR /tmp
RUN git clone https://github.com/yinglilu/pynetdicom
WORKDIR pynetdicom
RUN python setup.py install

#install PyYAML
RUN pip install PyYAML==3.11

#install scandir
RUN pip install scandir==1.3

#install dcmrcvr
WORKDIR /opt
RUN git clone -b $BRANCH https://gitlab.com/cfmm/dcmrcvr.git 

#RUN mkdir -p $ROOTPATH

RUN printf \
"AETITLE             : \"$AETITLE\"\n\
PORT                : $PORT\n\
IMPLEMENTATION_UID  : 1.2.826.0.1.3680043.9.5356.1\n\
ROOTPATH            : \"$ROOTPATH\"\n\
LOGLEVEL            : \"WARN\"\n\
LOGFILE             : server.log"\
>> /opt/dcmrcvr/config.yml

CMD ["/usr/bin/python","/opt/dcmrcvr/server.py"]


