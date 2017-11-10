FROM ubuntu:xenial
MAINTAINER yinglilu@gmail.com
COPY ./install_dcmrcvr.sh /

ENV DEBIAN_FRONTEND=noninteractive

RUN bash install_dcmrcvr.sh
RUN rm /*.sh

ENV PATH=/opt/dcmrcvr/:$PATH

ENTRYPOINT ["/usr/bin/python","/opt/dcmrcvr/server.py"]

#docker run --volume /data:/data --net=host --expose=11116 dcmrcvr python /opt/dcmrcvr/server.py

# # RUN apt-get update && apt-get install -y \
# #   bzr \
# #   cvs \
# #   git \
# #   mercurial \
# #   subversion

# # EXPOSE 11116
# # RUN mkdir -p /data && CONFIG=/opt/dcmrcvr/config.yml && \
# #   tee $CONFIG >/dev/null <<EOM
# #   AETITLE             : "YINGLILU"
# #   PORT                : 11116
# #   IMPLEMENTATION_UID  : 1.2.826.0.1.3680043.9.5356.1
# #   ROOTPATH            : "/data"
# #   LOGLEVEL            : "WARN"
# #   LOGFILE             : server.log
# #   EOM

# ##############################
# #pynetdicom3
# ##############################

# FROM continuumio/miniconda
# MAINTAINER yinglilu@gmail.com

# ENV DCMTK_PREFIX=/opt/dcmtk361
# ENV PATH=$PATH:/opt/dcmtk361/bin:/opt/conda/bin

# RUN mkdir /code
# ADD run.sh /code

# RUN apt-get update && apt-get install -y build-essential \
#                                          cmake  \
#                                          wget \
#                                          vim \
#                                          libpng12-dev \
#                                          libtiff5-dev \
#                                          libxml2-dev  \
#                                          libjpeg62-turbo-dev \
#                                          zlib1g-dev  \
#                                          libwrap0-dev \ 
#                                          libssl-dev \ 
#                                          libffi-dev \
#                                          python-dev \
#                                            python-pip
                     
# RUN /opt/conda/bin/conda update conda
# RUN mkdir /data

# # Install pydicom
# WORKDIR /tmp
# RUN git clone https://www.github.com/pydicom/pydicom.git
# WORKDIR /tmp/pydicom
# RUN /opt/conda/bin/python setup.py install

# # Install pynetdicom3
# WORKDIR /tmp 
# RUN git clone https://www.github.com/pydicom/pynetdicom3.git
# WORKDIR pynetdicom3
# RUN /opt/conda/bin/python setup.py install

# RUN DCMTK_PREFIX=/opt/dcmtk361
# RUN export DCMTK_PREFIX

# # # # Releases are here http://dicom.offis.de/download/dcmtk/
# # # # wget http://dicom.offis.de/download/dcmtk/release/dcmtk-3.6.0.tar.gz

# # # # Latest development release are here http://dicom.offis.de/download/dcmtk/snapshot/
# # # RUN wget http://dicom.offis.de/download/dcmtk/snapshot/dcmtk-3.6.1_20170228.tar.gz

# # # # unpack the archive
# # # #RUN tar xzvf dcmtk-3.6.1_20170228.tar.gz && cd dcmtk-3.6.1_20170228 && cmake -DCMAKE_INSTALL_PREFIX=$DCMTK_PREFIX && make all && make install

# # # #install MySQL-python==1.2.5
# # # RUN apt-get install -y libmysqlclient-dev && /opt/conda/bin/pip install MySQL-python==1.2.5
# # RUN apt-get install -y python-mysqldb

# # # #install PyYAML
# # RUN /opt/conda/bin/pip install PyYAML

# #install scandir
# RUN ln -sf $(which gcc) /usr/bin/x86_64-conda_cos6-linux-gnu-gcc && /opt/conda/bin/pip install scandir

# # # CMD ["/bin/bash","/code/run.sh"]