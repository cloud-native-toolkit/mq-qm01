#!/bin/bash
#
# A simple MVP script that will run MQSC against a queue manager.
ckksum=""

# Outer loop that keeps the MQ service running
while true; do

   tmpCksum=`cksum /dyn-mq-config-mqsc/dynamic-qm.mqsc | cut -d" " -f1`

   if (( tmpCksum != cksum ))
   then
      cksum=$tmpCksum
      echo "Applying MQSC"
      runmqsc $1 < /dyn-mq-config-mqsc/dynamic-qm.mqsc
   else
      sleep 3
   fi

done
