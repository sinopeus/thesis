#!/usr/bin/perl -w
use strict;

open LSJ, "<1999.04.0057.xml" or die $1;

while (<LSJ>) {
    if (m/.<entryFree/) {
        print "$_\n";
    }
    if (m/<\/entryFree>./) {
        print "#$_\n";
    }
}
    
