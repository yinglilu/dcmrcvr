#!/bin/sh
#
#install dcmrcvr to /opt/dcmrcvr
#

#install pip
apt-get update && apt-get -y upgrade
apt-get update && apt-get install -y build-essential \
                                          cmake  \
                                          wget \
                                          vim \
                                          libpng12-dev \
                                          libtiff5-dev \
                                          libxml2-dev  \
                                          libjpeg62-turbo-dev \
                                          zlib1g-dev  \
                                          libwrap0-dev \ 
                                          libssl-dev \
                                          python-dev

apt-get install -y apt-utils wget git zip unzip
apt-get install -y python2.7 python-pip
pip install -U pip setuptools

#when pip install MySQL-python==1.2.5, if get error: EnvironmentError: mysql_config not found
apt-get install -y libmysqlclient-dev
pip install MySQL-python==1.2.5

#install pydicom
#pip install pydicom==0.9.9

rm -rf /tmp/pydicom
git clone https://www.github.com/pydicom/pydicom.git  /tmp/pydicom
cd /tmp/pydicom
python setup.py install
cd

# Install pynetdicom3
#rm -rf /tmp/pynetdicom3
#git clone https://www.github.com/pydicom/pynetdicom3.git /tmp/pynetdicom3
#cd /tmp/pynetdicom3
#python setup.py install
#cd
#note: from pynetdicom3 import AE

rm -rf /tmp/pynetdicom
git clone https://github.com/patmun/pynetdicom /tmp/pynetdicom
cd /tmp/pynetdicom
python setup.py install
cd
#note: from netdicom import AE


#install pynetdicom==0.8.1
#pip install pynetdicom==0.8.1 doesn't work:urllib2.HTTPError: HTTP Error 403: SSL is required. 
#  Reason:
#	I think this is answered here: Getting error 403 while installing package with pip
#	Here is the link they provided: https://mail.python.org/pipermail/distutils-sig/2017-October/031712.html
#	Short answer: http support dropped from pypi on Oct 26, 2017.

# solution: 
#   1.download 0.8.1 zip: https://pypi.python.org/packages/f3/3e/3f992f0fde1eea33ebd81432a0bae8da96ef9783b9ac1e9d83dee98d4edf/pynetdicom-0.8.1.zip#md5=a0ac3520d30bfda071be61e670c01c9c
#   2.modify distribute_setup.py: 'http' to 'https':
#	    DEFAULT_URL = "https://pypi.python.org/packages/source/d/distribute/"
#   3.modifiy setup.py:
#	    #install_requires=["pydicom >= 0.9.7"]
#   4.zip it, and put into dropbox, get the dropbox link:
#   5.downdoad from dropbox, then 'python setup.py install'

# RANDOM_TEMP=${RANDOM}
# wget https://www.dropbox.com/s/8biolaoy3xf55mm/pynetdicom-0.8.1.zip?dl=0 -O ${RANDOM_TEMP}.zip;unzip -o ${RANDOM_TEMP}.zip -d /tmp; rm ${RANDOM_TEMP}.zip
# cd /tmp/pynetdicom-0.8.1/
# python setup.py install
# cd

#install PyYAML
pip install PyYAML==3.11

#install scandir
pip install scandir==1.3

#
rm -rf /opt/dcmrcvr
git clone https://gitlab.com/cfmm/dcmrcvr.git /opt/dcmrcvr

#edit config.yml.example
# AETITLE             : "MYAETITLE"
# PORT                : 11112
# IMPLEMENTATION_UID  : 1.2.826.0.1.3680043.9.5356.1
# ROOTPATH            : "/tmp"
# LOGLEVEL            : "WARN"
# LOGFILE             : server.log

mkdir -p /data
CONFIG=/opt/dcmrcvr/config.yml

tee $CONFIG >/dev/null <<EOM
AETITLE             : "YINGLILU"
PORT                : 11116
IMPLEMENTATION_UID  : 1.2.826.0.1.3680043.9.5356.1
ROOTPATH            : "/data"
LOGLEVEL            : "WARN"
LOGFILE             : server.log
EOM



