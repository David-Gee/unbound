#!/bin/bash
usage(){
echo
echo " Usage:"
echo -e "\t sh $0 projectName [\"emailAddressList(seperate by semicolon)\"]"
echo -e "\t if emailAddress(es) is not given, email is sent to infra_cn@dena.com"
exit 0
}


sendmail(){
sendEmail -o message-content-type=html -o message-file=$reportfile -f nagios@em.denachina.com -t $2 -s smtp.em.denachina.com -u $1 -xu nagios@em.denachina.com -xp Hwf23.#whgw
}

project=$1
host_list=$(awk '/^10./{print $2}' /etc/hosts)
reportfile="/tmp/disk_report.html"
: > $reportfile
sub="${project}磁盘空间利用率统计"

make_file(){
cat  >> $reportfile << END
<html>
	<body>
	    <table border="2" bordercolor="#000000"  style="BORDER-COLLAPSE: collapse" cellpadding="2" cellspacing="1">
	        <caption>${sub}</caption>
END


echo "<tr><th>Hostname</th><th> / </th><th>/data/</th></tr>"  >> $reportfile
for host in $host_list
do
	echo "========  $host  ========"
	lines=$(ssh $host "df -h"|grep -vE 'Filesystem|tmpfs|none'|awk '{print $5,$6}'|sed 's/%//g')
	line_num=$(echo "$lines"|wc -l)
	new_line="<tr><td>$host</td>"
	#awk '{print $5,$6}'|sed 's/%//g'
	for usage in $(echo "$lines"|awk '{print $1}')
	do
		if [ $usage -gt 80 ];then
			new_line="$new_line<td bgColor=F00038>$usage%</td>"
		else
			new_line="$new_line<td>$usage%</td>"
		fi
	done
	if [ $line_num -eq 1 ];then
		new_line="$new_line<td>N/A</td>"
	fi
	new_line="$new_line</tr>"
	echo "$new_line" >> $reportfile
done

cat  >> $reportfile << END
        	</table>
	</body>
 </html>
END
}


if [ $# -eq 1 ];then
	maillist="infra_cn@dena.com"
	make_file
	sendmail "$sub" "$maillist"
elif [ $# -eq 2 ];then
	maillist="$2"
	make_file
	sendmail "$sub" "$maillist"
else
	usage
fi
