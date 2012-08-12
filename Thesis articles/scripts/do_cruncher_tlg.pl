#!/usr/bin/perl -w
$ENV{MORPHLIB}='/home/pj/Perseus/morph/stemlib';
# exec "../morph/bin/cruncher";
# exec "../morph/bin/cruncher test";
system "../../Perseus/morph/bin/cruncher tlg" and die $!;
1;

