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

# Read the product config_spec file if there is'   
#   cspecs='/v/am255098.am255098_16.20drs/opnpde/config/opnpde.config_spec'

# Execute copyfilestomain.sh script before pushing to github'   
#   script='/c/Users/am255098/Documents/GitHub/cc2gitDynamic/movefiles.sh'

# the vob that is being migrated by product, release branch, user_tag_view and adding -latest at the of the line   
# -pr opnpde -re 14.10.1.x -tr am255098_16.20drs -latest
# Require arguments at the command line seen below

	product_name=${1}
	relese_name=${2}
	view_name=${3}
	latest=${4}

	echo $@

 # for each release branch that is read out for the product file
while read -a line; do 
        pr=${line[1]}
        re=${line[3]}
		tr=${line[5]}
        la=${line[6]} 	

	echo $@

########################################	
	
# cd /v/access.vw/tdv/nt-i386/bin && cmd workspace '/c/Users/am255098/Documents/GitHub/cc2gitDynamic/prd_rel_tag.txt'

# cd to the v drive and execute commands
cd /v/access.vw/tdv/nt-i386/bin && cmd workspace $pr $re $tr -latest
	echo $pr
	echo -e  " \n"
	echo $re
	echo -e  " \n"
    echo $tr
	echo -e  " \n"
	echo $latest

 

#/c && exec
#/c/Users/am255098/Documents/GitHub/cc2gitDynamic/prd_rel_tag.txt

#cd SOME_PATH && run_some_command && cd -  ! break;

# workspace -pr opnpde -re 14.10.1.x -tr am255098_16.20drs -latest

#  pushd "${SOME_PATH}" && run_stuff; popd


#  cleartool catcs -tag am255098.am255098_16.20drs
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
