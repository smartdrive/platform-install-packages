#!/bin/bash -e 
#===============================================================================
#          FILE: package_kaltura_web.sh
#         USAGE: ./package_kaltura_web.sh 
#   DESCRIPTION: 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Jess Portnoy (), <jess.portnoy@kaltura.com>
#  ORGANIZATION: Kaltura, inc.
#       CREATED: 01/10/14 08:46:43 EST
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error
SOURCES_RC=`dirname $0`/sources.rc
if [ ! -r $SOURCES_RC ];then
	echo "Could not find $SOURCES_RC"
	exit 1
fi
. $SOURCES_RC 
if [ ! -x `which wget 2>/dev/null` ];then
	echo "Need to install wget."
	exit 2
fi
mkdir -p $RPM_SOURCES_DIR/$KDP3_RPM_NAME
wget $KDP3_URI -O$RPM_SOURCES_DIR/$KDP3_RPM_NAME-$KDP3_VERSION.zip
echo "Packaged into $RPM_SOURCES_DIR/$KDP3_RPM_NAME-$KDP3_VERSION.zip"
#rpmbuild -ba $RPM_SPECS_DIR/$KDP3_RPM_NAME.spec
