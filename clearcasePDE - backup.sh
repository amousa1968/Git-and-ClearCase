set -x

# Created by Ayman Mousa for migrating cc 2 github
# This script will be used with clearcase dynamic view with the following parameters
# Step 1 create the user Dynamic view using clearcase (workspace) 
#  *** workspace -pr opnpde -re 6.0.2.x -tr am255098_pde - LATEST  ***********
# You will need the following items when running the script
#  *** label_dates.txt *** the file contains offical release tags and release date 
#  *** tmp-spec.txt  *** the file will be updated with the configspec load parameters
#  *** git_cspec *** folder contains product_config_spec file for the above step to read the data setting up the view
#   ***** am255098.cc2git_dynamic_test *****
# Note the script will be using the time stamp of a file element to the time at the version was checked in to the clearcase VOB, –ptime has no effect on directories.
# Command line to run the program: >>> ./script_name.sh \\vob_name     ######
# Use Git Shell ./clearcasePDE.sh \\opnpde \\opnpde.1 \\opnpde.2 \\opnpde.3 \\opnpde.4 \\opnpde.5 \\opnpde.6 \\opnpde.7 \\opnpde.8 \\opnpde.9 \\opnpde.a \\opnpde.b \\am255098_cc2git_dynamic_test
# You need to be at the top of all vobs to be able to view label properties using cleartool command 
# V:\>cleartool catcs -tag am255098.am255098_pde

#!/bin/sh
echo -e  "getting ready to load clearcase view with data for cc2git migration now\n"

if [ $# -eq 0 ]
  then
      echo -e  "No arguments supplied"
          echo -e  "Please supply path to VOB name and view name\n"
    exit 1
fi

# Script will be executed for the migration path'   
   curr_dir='/c/Users/am255098/Documents/GitHub/cc2git_dynamic_test'

# File contains clearcase labels_name and dates'
   filename='/c/Users/am255098/Documents/GitHub/cc2git_dynamic_test/labels_dates.txt'

# a temp config_spec will be used to copy the data of the config_spec'
   cfgspec_name='/c/Users/am255098/Documents/GitHub/cc2git_dynamic_test/tmp-spec.txt'

# Read the product config_spec file if there is'   
   cspecs='/c/Users/am255098/Documents/GitHub/cc2git_dynamic_test/git_cspecs/opnpde'

# Update the load rules to the config_spec'
#   rules='/c/Users/am255098/Documents/GitHub/cc2git_dynamic_test/opnpde_rules.txt'   
   
# Execute copyfilestomain.sh script before pushing to github'   
   script='/c/Users/am255098/Documents/GitHub/cc2git_dynamic_test/copyfilestomain.sh'
   
# the vob that is being migrated
	vob_name=${1}
	vob1_name=${2}
	vob2_name=${3}
	vob3_name=${4}
	vob4_name=${5}
	vob5_name=${6}
	vob6_name=${7}
	vob7_name=${8}
	vob8_name=${9}
	vob9_name=${10}
	vob10_name=${11}
	vob11_name=${12}

	view_name=${13}

#	echo $@
#	echo $* 

# Lines below was removed by am255098 and replaced it with line # 54 & 56 
	echo -e  "VOB = $vob_name\n"
	echo -e  "VOB = $vob1_name\n"
	echo -e  "VOB = $vob2_name\n"
	echo -e  "VOB = $vob3_name\n"
	echo -e  "VOB = $vob4_name\n"
	echo -e  "VOB = $vob5_name\n"
	echo -e  "VOB = $vob6_name\n"
	echo -e  "VOB = $vob7_name\n"
	echo -e  "VOB = $vob8_name\n"
	echo -e  "VOB = $vob9_name\n"
	echo -e  "VOB = $vob10_name\n"
	echo -e  "VOB = $vob11_name\n"

	echo -e  "View = $view_name\n"

# for each label that is read out from the labels file
while read -a line; do 
	
		label=${line[0]}
		date=${line[1]}

	echo $label
	echo -e  " \n"
	echo $date
	echo -e  " \n"
	echo $label/$date
	echo -e  " \n"

# add these lines to the temp config_spec
# checkedout is required at the first item in a snapshot config spec
    echo "element * CHECKEDOUT" > $cfgspec_name 
#	echo "element * $label" > $cfgspec_name
 	
	cd /c/cc_views/osutils_import/$view_name
	cleartool setcs -force -overwrite -pti /c/Users/am255098/Documents/GitHub/cc2git_dynamic_test/tmp-spec.txt
#	cleartool setcs -force -overwrite -pti /c/Users/am255098/Documents/GitHub/cc2git_dynamic_test/git_cspecs/opnpde
#	cleartool setcs -current -overwrite -pti /c/Users/am255098/Documents/GitHub/cc2git_dynamic_test/git_cspecs/opnpde
	cd $curr_dir
	
# catcs: lists a view's config spec (view_name)
#	cleartool catcs -tag $view_name 
#############	if test -r $cspecs/$label; then
	if test -r $cspecs/$label; then
#		### >>> if it is, then use that one
		cat $cspecs/$label >> $cfgspec_name
	else
			### >>> otherwise make one from git_cspecs
		echo "element * $label" >>        $cfgspec_name
#		echo "$cspecs" >>       $cfgspec_name

	fi
		
	echo "load $vob_name" >>      $cfgspec_name

	echo -e  " \n"
	echo -e  "-------------------------------\n"
	echo -e  "contents of $cfgspec_name & label $label\n" 
	echo -e  "-------------------------------\n"
	
	cat $cfgspec_name
	echo -e  "setting config spec...\n"

# set the configspec.  This will update all the files in the current view with the initial label use 
# Note: You have to execute the command "cleartool setcs -current" to re-load C:\Configspec.csf in case it has been modified.
	cd /c/cc_views/osutils_import/$view_name
#	cleartool setcs -force -overwrite -pti /c:/Users/am255098/Documents/GitHub/cc2git_dynamic_test/tmp-spec.txt
	cleartool setcs -force -overwrite -pti /c:/Users/am255098/Documents/GitHub/cc2git_dynamic_test/git_cspecs/opnpde
	
#	Use the below command after the initial loads 
#	cleartool setcs /c:/Users/am255098/Documents/GitHub/cc2git_dynamic_test/git_cspecs/opnpde
	pwd
	echo -e  " \n"
	echo -e  "Current config spec set to...\n"
	cleartool catcs
	echo -e  " \n"

cd $curr_dir

cd /c/cc_views/osutils_import/$view_name


# execute script
sh /c/Users/am255098/Documents/GitHub/cc2git_dynamic_test/copyfilestomain.sh

##### This section is all about GitHub ##########################################

# update cc2git copy of the files to GitHub import -----------------------------------------
	echo -e  "Copy files from CC view to GitHub repository opnpde. \n"

# the vob that is being migrated
	vob_name=${1}
	vob1_name=${2}
	vob2_name=${3}
	vob3_name=${4}
	vob4_name=${5}
	vob5_name=${6}
	vob6_name=${7}
	vob7_name=${8}
	vob8_name=${9}
	vob9_name=${10}
	vob10_name=${11}
	vob11_name=${12}

	view_name=${13}
	
#	echo $@
	
	echo -e  "VOB = $vob_name\n"
	echo -e  "VOB = $vob1_name\n"
	echo -e  "VOB = $vob2_name\n"
	echo -e  "VOB = $vob3_name\n"
	echo -e  "VOB = $vob4_name\n"
	echo -e  "VOB = $vob5_name\n"
	echo -e  "VOB = $vob6_name\n"
	echo -e  "VOB = $vob7_name\n"
	echo -e  "VOB = $vob8_name\n"
	echo -e  "VOB = $vob9_name\n"
	echo -e  "VOB = $vob10_name\n"
	echo -e  "VOB = $vob11_name\n"

	echo -e  "View = $view_name\n"

	echo -e  "Where I'm at now +++++++++++++++++++++++++++++++++++++++++\n"
	echo -e  "View = $view_name +++++++++++++++++++++++++++++++++++++++++\n"

	ls -la; sleep 10

cd $curr_dir
cd /c/cc_views/osutils_import/$view_name/opnpde/	
    echo -e  "opnpde"
# update the git&cc copy of the files to import
echo -e  "Copy files from CC snap view to local git repo. \n"

#look for .lock file"
 while [ -f /c/cc_views/osutils_import/$view_name/.git/index.lock ]; do sleep 1; done
	echo -e  " done.\n"
	
# push cc labels_tags to git remote repo (master)
echo -e  "Pushing to remote ...\n"
git add -A
	echo -e  " done.\n"
	echo -e  "commit product and release\n"
git commit -m "$label $date"
	echo -e  "done.\n"
	echo -e  "Issung git branch and tag master_cc and master_ci\n"
git branch -f master_cc HEAD
git tag -f master_ci HEAD
	echo -e  " done.\n"
	echo -e  "Issuing git tag release\n"
git tag $label
	echo -e  " done.\n"
	echo -e  "using github program\n"
git tag -f master_ci $label
	echo -e  " done.\n"
	echo -e  "issue gitcc checkin. \n"

#add a wait
git log -z --reverse --pretty=format:%H%x01%B --first-parent master_ci..
	echo -e  " done.\n"  

# Push to origin
	echo -e  "Push to origin. \n"
git push origin master
#git push -f origin master --repo https:/\name:password@domain.name\name/repo.git
	echo -e  " done.\n"

# Push the label to origin
	echo -e  "Push label to origin. \n"
git push origin $label
	echo -e  "import completed\n"

	rm -rf $view_name

	echo -e "completed deleting view_name directory."
	ls -al

done < $filename
exit 