#!/bin/bash
cd `dirname $0`
EPATH=`cat lib/python2.7/_sysconfigdata.py| grep exec_prefix | sed "s#.*exec_prefix': '##g"| sed "s#',.*##g"`
file_lists="2to3 easy_install easy_install-2.7 idle pip pip2 pip2.7 pydoc python2.7-config smtpd.py"
cd bin
for fn in $file_lists
do
 sed -i "1s:.*:#\\!$PWD/python2.7:" $fn
done
cd ..
PREFIX=$PWD
cd lib/pkgconfig
sed -i "s#^prefix=.*#prefix=$PWD#g" python-2.7.pc
cd ../python2.7
sed -i "s#$EPATH#$PREFIX#g" _sysconfigdata.py
