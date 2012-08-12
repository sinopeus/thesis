#!/usr/bin/perl -w
$ENV{MORPHLIB}='/home/pj/Perseus/morph/stemlib';
chomp $prefix;
# exec "../morph/bin/cruncher";
# exec "../morph/bin/cruncher test";
system "../../Perseus/morph/bin/cruncher -L lat" and die $!;
1;
