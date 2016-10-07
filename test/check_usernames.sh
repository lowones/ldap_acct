#!/bin/bash

for username in `cat usernames`
do
   if ! /usr/local/ldap/bin/ldap_user_query.pl ${username} linux > /dev/null
   then
      echo "${username}:account"
   fi
done
