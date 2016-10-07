#!/usr/bin/perl -w
require "/home/lowk/bin/lowlib.pl";


# check if users in group from ldap_user_query.pl
# check if users in group from 


my @account_info = read_file('a2.info');
foreach my $user_line ( @{account_info} )
{
   chomp(${user_line});
   my ($address,$gid,$ticket) = parse_account(${user_line});
   printf("address\t%s\tgid\t%s\tticket\t%s\n", ${address}, ${gid}, ${ticket});
   my ($first, $last) = parse_names(${address});
   print("${address}\n");
   printf("First\t%s\n", ${first});
   printf("Last\t%s\n", ${last});
}

# ldap_add_user.p
# first
# last
# username
# UID
# GID
#   ACL ? requestor email, ticket
# email
# ticket

sub parse_account
{
   my ($user_info) = @{_};
   my (${address},${gid},${ticket}) = ();
   my ${user_regex} = qr/^([^,]+),(\d+),(\d{6,})$/;
   if ( ${user_info} =~ ${user_regex} )
   {
      ${address}=$1;
      ${gid}=$2;
      ${ticket}=$3;
      return(${address},${gid},${ticket});
   }
   else
   {
      printf("Invalid user_line:\t%s\n", ${user_info});
   }
}

sub parse_names
{
   my ($address) = @{_};
   my $email_regex = qr/^(\w+)(\.\w+){1,}(-contractor)?\@adp\.com$/;
   if ( ${address} =~ ${email_regex} )
   {
      my ${first_name} = $1;
      my ${last_name} = $2;
      if ( ${last_name} =~ /^\.(\w+)$/ )
      {
         ${last_name}=$1;
      }
      return(${first_name},${last_name});
   }
   else
   {
      printf("NOT ADP\t%s\n", ${address});
   }
   print"\n";
}	# End parse_names
