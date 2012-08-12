#!/usr/bin/perl -w
use strict;

my $in = <STDIN>;
chomp $in;
open LSJ, "<1999.04.0057.xml" or die $1;
seek LSJ, $in, 0;
my $line = <LSJ>;
print "$line\n";
close LSJ;

exit;
