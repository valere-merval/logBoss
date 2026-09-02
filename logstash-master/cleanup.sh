#!/bin/sh  

#löschen von logfiles welche älter als 7 tage sind
find /opt/logstash/logfiles/*/*/20* -type d -mtime +7 |xargs rm -fr

#cleanup logstash logfiles
find /var/log/logstash -name '*log.gz' -mtime +7 |xargs rm -fr

#cleanup elastic logfiles
#find /var/log/elasticsearch -name 'gc.log*' -mtime +7 |xargs rm -fr 
#find /var/log/elasticsearch -name '*.gz' -mtime +7 |xargs rm -fr

#cleanup failure logs
#cat /dev/null > /var/log/logstash/grokparse_failures.txt
#cat /dev/null > /var/log/logstash/dateparse_failures.txt

#löschen elastic search index's aelter als 7 Tage
#purge_date=$(date +"%Y.%m.%d" -d "-7 days")

#echo delete logelk-$purge_date
#curl -uelastic:xxx -XDELETE "http://localhost:9200/logelk-$purge_date"

#for log_name in filebeatlog logs 
#do
#	for umg in h i j k l q m  
#		do 
#	    	echo delete psx$umg-$log_name-$purge_date 
#	        curl -uelastic:xxx -XDELETE "http://localhost:9200/psx$umg-$log_name-$purge_date"	
#	done
#done
#
#for log_name in .monitoring-es-7- .monitoring-kibana-7- logelk-
#do
#	echo delete $log_name$purge_date
#	curl -uelastic:xxx -XDELETE "http://localhost:9200/$log_name$purge_date"
#done

