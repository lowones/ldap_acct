#!/bin/bash

os='linux'

echo "check if user missing from netgroup"

usernames="${PWD}/usernames"

echo ${usernames}

if [ -f ${usernames} ];
then
   for user in `cat $usernames`
   do
      if ! /usr/local/ldap/bin/ldap_user_query.pl ${user} ${os} > /dev/null
      then
         echo "${user} missing ${os} account"
      fi
   done
else
   echo "Missing ${usernames}"
fi


