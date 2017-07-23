arg=$1 # take argument from the command line and store in arg varible
if [ -z "$arg" ] # cheak for the command line arugumet 
then
	echo	"pass agrument throgh command line";

else
	for i in $(echo $arg | sed "s/,/ /g") #replace the comma with space  and pust the value in the variable i 
	do
   		 echo "$i" >>/tmp/host.txt #append the host name in host.text file
	done
	echo "enter the command to execute" 
	read command # take the input from the user
	for host in $(cat /tmp/host.txt); #read each hostname for the file host.txx  and give  the vaulei to  host variable
	do
        	ssh  "$host" "$command" >>"/tmp/output.$host"; # every time it will loging to remote host  and execute the command that we had taken input and push the output of the command to output.host file
        	cat "/tmp/output.$host" # display the output
        	rm -rf /tmp/host.txt "/tmp/output.$host" # remove the host.txt anf output file form /tmp directory
	done
fi

