arg=$1
for i in $(echo $arg | sed "s/,/ /g")
do
    echo "$i" >>/tmp/host.txt
done
echo "enter the command to execute"
read command
for host in $(cat /tmp/host.txt);
do
         ssh -i "linux2.pem" "ec2-user@$host" "$command" >>"/tmp/output.$host";
        cat "/tmp/output.$host"
        rm -rf /tmp/host.txt "/tmp/output.$host"
done

