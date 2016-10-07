#!/bin/bash
set -x

os="linux"

for group in `cat groups`
do
   for username in `cat usernames`
   do
      if ! /usr/local/ldap/bin/ldap_user_query.pl ${username} ${os} > /dev/null 
      then
         echo "${username}:account"
      else
         GROUPS=`/usr/local/ldap/bin/ldap_user_query.pl ${username} ${os} |egrep " group"`
         if ! echo ${GROUPS} | grep ${group} > /dev/null
         then
            echo "${username}:${group}"
         fi
      fi
   done
done
