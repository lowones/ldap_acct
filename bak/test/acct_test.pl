#!/usr/bin/perl
require "/home/lowk/bin/lowlib.pl";

my $last_regex  = qr/[\._](\w+)/;
my $email_regex = qr/^(\w+)${last_regex}{1,}(-contractor)?\@adp\.com$/;
#my $email_regex = qr/^(\w+)([\._]\w+){1,}(-contractor)?\@adp\.com$/;
#my $email_regex = qr/^(\w+)([\._]\w+){1,}(-contractor)?\@adp\.com$/;

#my $email_regex = qr/^(\w+)(\.\w+){1,}(-contractor)?\@adp\.com$/;

my @email = read_file('email');
foreach my $address ( @{email} )
{
   chomp(${address});
   ${address}=lc(${address});
   if ( ${address} =~ ${email_regex} )
   {
      my ${first_name} = $1;
      my ${last_name} = $2;
#      if ( ${last_name} =~ /^[\._](\w+)$/ )
      if ( ${last_name} =~ /^${last_regex}$/ )
      {
         ${last_name}=$1;
      }
      #print("${address}\n");
#      printf("First\t%s\n", ${first_name});
#      printf("Last\t%s\n", ${last_name});
      my $last = ${last_name};
      my $first = ${first_name};
      my $user = lc( join('', (split(//,$last))[0..6], (split(//,$first))[0] ) );
      printf("%s\n", $user);
   }
   else
   {
      printf("NOT ADP\t%s\n", ${address});
   }
#   print"\n";
}
