#!/bin/bash

os="linux"

for group in `cat groups`
do
   NG=`/usr/local/ldap/bin/ldap_group_query.pl ${group} ${os}`
   for username in `cat usernames`
   do
      if ! /usr/local/ldap/bin/ldap_user_query.pl ${username} linux > /dev/null
      then
         echo "${username}:account"
      elif ! echo ${NG} | grep ${username} > /dev/null
      then
         echo "${username}:${group}"
      fi
   done
done
