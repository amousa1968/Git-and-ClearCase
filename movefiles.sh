#!/bin/sh

# this needs to be executed before pushing the source code to github repo
# copy command cp -rf opnpde.5/config/ opnpde/

cd /c/cc_views/osutils_import/am255098_cc2git_dynamic_test

echo -e "copying files from opnpde.1 to opnpde"
cp -rf opnpde.1/ opnpde/

echo -e "copying files from opnpde.2 to opnpde"
cp -rf opnpde.2/ opnpde/

echo -e "copying files from opnpde.3 to opnpde"
cp -rf opnpde.3/nt-i386/ opnpde/
cp -rf opnpde.3/vobconfig/ opnpde/

echo -e "copying files form opnpde.4 to opnpde"
cp -rf opnpde.4/config/ opnpde/

echo -e "copying files from opnpde.5 to opnpde"
cp -rf opnpde.5/config/ opnpde/

echo -e copying files from opnpde.6 to opnpde
cp -rf opnpde.6/suselinux-i386/ opnpde/

echo -e "copying files from opnpde.7 to opnpde"
cp -rf opnpde.7/redhatlinux-x8664/ opnpde/

echo -e copying files from opnpde.8 to opnpde
cp -rf opnpde.8/baselinux-i386/ opnpde/

echo -e "copying files from opnpde.9 to opnpde"
cp -rf opnpde.9/nt-ia64/ opnpde/

echo -e "copying files from opnpde.a to opnpde"
cp -rf opnpde.a/redhatlinux-i386/ opnpde/

echo -e "copying files from opnpde.b to opnpde"
cp -rf opnpde.b/baselinux-x8664/ opnpde/

