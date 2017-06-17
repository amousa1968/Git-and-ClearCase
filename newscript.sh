set -x
#!/bin/bash
#!/c/strawberry/perl/bin
#!/usr/bin/perl
# Recursively push folders and file content to github. Attempt to execute "workspace" perl script to create clearcase view branches.

#!/bin/sh
echo -e  "getting ready to load clearcase view with data for cc2git migration now\n"

if [ $# -eq 0 ]
  then
      echo -e  "No arguments supplied"
          echo -e  "Please supply path to VOB name and view name\n"
    exit 1
fi

# Script will be executed for the migration path'   
   curr_dir='/c/Users/am255098/Documents/GitHub/cc2gitDynamic'

# list of clearcase branches'
   filename='/c/Users/am255098/Documents/GitHub/cc2gitDynamic/prd_rel_tag.txt'

# a temp file will be used to copy the passing arguments'
   cfgspec_name='/c/Users/am255098/Documents/GitHub/cc2gitDynamic/tmp-spec.txt'

# Read the product config_spec file if there is'   
#   cspecs='/v/am255098.am255098_16.20drs/opnpde/config/opnpde.config_spec'

# Execute copyfilestomain.sh script before pushing to github'   
   script='/c/Users/am255098/Documents/GitHub/cc2gitDynamic/movefiles.sh'

# the vob that is being migrated   
	vob_name=${1}
#	vob1_name=${2}
#	vob2_name=${3}
#	vob3_name=${4}
#	vob4_name=${5}
#	vob5_name=${6}
#	vob6_name=${7}
#	vob7_name=${8}
#	vob8_name=${9}
#	vob9_name=${10}
#	vob10_name=${11}
#	vob11_name=${12}
#	view_name=${13}
	view_name=${2}
	
#	workspace=${i}
    echo -e  "VOB = $1\n"
	echo -e  "VIEW = $2\n"

#cd 	/v/access.vw/tdv/nt-i386/bin
#cmd workspace  

cd /v/access.vw/tdv/nt-i386/bin && 
echo workspace $workspace && 
 
#while read line;  do echo $line ; 
#cmd workspace $line

#done < $filename

while read whole_line;  do echo $whole_line; cd /v/access.vw/tdv/nt-i386/bin; 
cmd workspace $Whole_line

echo reading a strings from $whole_line
	echo -e  " \n"

# add these lines to the temp file recorde steps
# checkedout is required at the first item in a snapshot config spec
        echo "workspace $whole_line" > $cfgspec_name 	
	
	cd /v/access.vw/tdv/nt-i386/bin &&
	cmd workspace $whole_line
	
	
	
	
	
	
done < $filename

exit 


# cd to the v drive and execute commands
cd /v/access.vw/tdv/nt-i386/bin && cmd workspace $whole_line
	echo $whole_line
	echo -e  " \n"
#	echo $re
#	echo -e  " \n"
#    echo $tr
#	echo -e  " \n"
#	echo $latest



#/c && exec
#/c/Users/am255098/Documents/GitHub/cc2gitDynamic/prd_rel_tag.txt

#cd SOME_PATH && run_some_command && cd -  ! break;

# workspace -pr opnpde -re 14.10.1.x -tr am255098_16.20drs -latest

exit




# /C/Strawberry/perl/bin/perl.exe /v/access.vw/tdv/nt-i386/bin/workspace
	
while read whole_line; do "/v/access.vw/tdv/nt-i386/bin/workspace" $whole_line

exit
cd /v/access.vw/tdv/nt-i386/bin/   


	echo -e 
	echo $curr_dir

#	export #!/usr/atria/bin/perl

#while read -a line; do
#		workspace

#while read -a line; do echo -e 
#			"${line[0]} ${line[1]} ${line[2]} ${line[3]} ${line[4]} ${line[5]} ${line[6]} ${line[7]} ${line[8]}"
        pr=${line[1]}
        re=${line[3]}
		tr=${line[5]}
        la=${line[6]}
		
	echo $pr
	echo -e  " \n"
	echo $re
	echo -e  " \n"
    echo $tr
	echo -e  " \n"
	echo $latest
	echo -e  " \n"
#	echo $pr/$re/$tr/$la
#	echo -e  " \n"
				
# for each workspace that is read out for the labels file
#while read -a line; do workspace $filename

#        -pr=${line[0]}
#        -re=${line[1]}
#		-tr=${line[2]}
#        -latest=${line[3]}
					   
#	echo $-pr
#	echo -e  " \n"
#	echo $-re
#	echo -e  " \n"
#   echo $tr
#	echo -e  " \n"
#	echo $latest
#	echo -e  " \n"
#	echo $pr/$re/$tr/$latest
#	echo -e  " \n"	

# done < $filename

# cd /v/am255098.am255098_16.20drs/
# cleartool catcs -tag "$view_name"
cd /v/am255098.am255098_16.20drs
	pwd
	echo -e  " \n"
	echo -e  "Current product config spec set to...\n"
	cleartool catcs -tag $view_name
#	cleartool catcs -tag am255098.am255098_16.20drs
	echo -e  " \n"
	cd $curr_dir
	
# execute script
#sh /c/Users/am255098/Documents/GitHub/cc2gitDynamic/movefiles.sh	
ls -la  /c/Users/am255098/Documents/GitHub/cc2gitDynamic/movefiles.sh	
	
	
done < $filename	
exit 