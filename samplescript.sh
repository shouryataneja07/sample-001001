#!/bin/bash

##################################################################################################
# Script     : Shell Demo
# Written by : Shourya Taneja
#
# Date Written: 22/03/2021
# Organization : Magic EdTech.
##################################################################################################

#Function to check which Operating System the script is running on.
CheckOS()
{
	OSName="$(uname -a | cut -f 1 -d " ")"
	if [ $OSName = 'Linux' ]; then
		echo "Linux"
	else
		if [ $OSName = 'SunOS' ]; then
			echo "SunOS"
		else
			if [ $OSName = 'AIX' ]; then
				echo "AIX"
			fi
		fi
	fi
}

#Function to collect all the OS Level artefacts.  
OSLevel()
{
	        echo "INFO : Starting OS Checks"
		        DISK="$(df -h)"
					STARTUP="$(uptime)"
							
				}

			#The below function is used to write all the artefacts into text file.
			WriteFile()
			{
				inputStr="
				                **************************************
						                *               Space                *
								                **************************************
										$DISK
										                **************************************
												                *               Uptime                *
														                **************************************
																$STARTUP
																                **************************************
																		                *               Current time                *
																				                **************************************
																						$now
																						"

																						cat << EOIPFW >> $BASEDIR/$FILENAME.txt
$inputStr
EOIPFW
        echo "INFO :  Data saved in $BASEDIR/$FILENAME.txt"
}

#Below function will execute only if post checks are getting collected. It will create a difference file and will save it along with Post checks file.
demo()
{
	echo "file executed with demo argument"

}

#Funcitons shows how this script can be executed.
usage()
{
	cat << EOF
usage: shellscript [-test Specify test]
usage: shellscript [-demo Specify demo]
usage: shellscript [-h for help]
EOF
}

now="$(date +%d%m%y_%H%M%S)"
BASEDIR="$(dirname $0)"
cd $BASEDIR
OSName="$(uname -a | cut -f 1 -d " ")"
echo $OSName
demo=false
if [ "$1" != "being-invoked" ]; then
	        if [ "$1" = "" ]; then
			                usage
					                exit
							        else
									                while [ "$1" != "" ]; do
												                        case $1 in
																                        -test | --test ) shift
																				                                FILENAME="test01_$now"
																								                                echo "Filename will be $FILENAME "
																												                                ;;
																																                        -demo | --demo ) shift
																																				                                FILENAME="demo_$now"
																																								                                demo=true
																																												                                echo "Filename will be $FILENAME "
																																																                                ;;
																																																				                        -h | --help ) shift
																																																								                                usage
																																																												                                exit
																																																																                                ;;
																																																																				                        *)usage
																																																																								                        exit
																																																																											                        ;;
																																																																														                        esac
																																																																																	                done
																																																																																			        fi
fi

#Execute Funtions
CheckOS
OSLevel
WriteFile

#Checks if it is post check, then execute postcheck function to create difference file
if [ $demo = "true" ]; then
	demo
fi

#<<-------------------END-------------------------->>
