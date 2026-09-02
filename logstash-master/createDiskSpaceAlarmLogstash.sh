#!/bin/bash

#create metric for disk space Monitoring
instance_id=$(ec2-metadata --instance-id | cut -d " " -f 2)

aws --region eu-central-1 cloudwatch put-metric-alarm \
--alarm-name "PsxLogstashAl23-DiskSpaceUtilization1-$instance_id" \
--alarm-description "Auf dem PSX Logstash Client ist das root Filesystem zu 85 % voll" \
--actions-enabled \
--comparison-operator "GreaterThanThreshold" \
--evaluation-periods 1 \
--alarm-actions "arn:aws:sns:eu-central-1:556971410989:LogstashAl23PsxAlarm" \
--ok-actions "arn:aws:sns:eu-central-1:556971410989:LogstashAl23PsxAlarm" \
--metric-name "DiskSpaceUtilization" \
--namespace "EC2" \
--period 300 \
--threshold 85 \
--treat-missing-data "missing" \
--statistic "Average" \
--dimensions Name=InstanceId,Value=$instance_id Name=path,Value=/

aws --region eu-central-1 cloudwatch put-metric-alarm \
--alarm-name "PsxLogstashAl23-DiskSpaceUtilization2-$instance_id" \
--alarm-description "Auf dem PSX Logstash Client ist das Filesystem /opt/logstash/logfiles zu 85 % voll" \
--actions-enabled \
--comparison-operator "GreaterThanThreshold" \
--evaluation-periods 1 \
--alarm-actions "arn:aws:sns:eu-central-1:556971410989:LogstashAl23PsxAlarm" \
--ok-actions "arn:aws:sns:eu-central-1:556971410989:LogstashAl23PsxAlarm" \
--metric-name "DiskSpaceUtilization" \
--namespace "EC2" \
--period 300 \
--threshold 85 \
--treat-missing-data "missing" \
--statistic "Average" \
--dimensions Name=InstanceId,Value=$instance_id Name=path,Value=/opt/logstash/logfiles