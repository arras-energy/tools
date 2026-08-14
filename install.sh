#!/bin/bash
# Syntax: install.sh
#
# Arras Energy package installer
#

PACKAGE=tools

# verify the gridlabd environment
if [ "${GLD_VER:-none}" == "none" ]; then
	echo "ERROR [$0]: you must run this command in a gridlabd environment" >/dev/stderr
	exit 1
fi

# install to python site-packages
python3 -m pip install --force-reinstall git+https://github.com/arras-energy/$PACKAGE

# link package into gridlabd etc
SOURCE=$GLD_VER/lib/python$PYTHON_VER/site-packages/$PACKAGE
for FILE in $SOURCE/*.py; do
	ln -sf $FILE $GLD_ETC
done
