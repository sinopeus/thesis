#!/usr/bin/perl -w
use strict;

# generate the latin wordlist (lat.words) from phi texts
print "Making Latin word-list ...\n";
do 'make_latin_wordlist.pl' or die $!;

# generate the greek wordlist (tlg.words) from tlg wordlist
print "Making Greek word-list ...\n";
do 'make_greek_wordlist.pl' or die $!;

# generate lat.morph from lat.words
print "Crunching Latin morphology ...\n";
do 'do_cruncher_lat.pl' or die$!;

# generate tlg.morph from tlg.words
print "Crunching Greek morphology ...\n";
do 'do_cruncher_tlg.pl' or die $!;

# generate indexes of the dicts
print "Indexing Lewis and Short ...\n";
do 'index_lewis.pl' or die $!;
print "Indexing LSJ ...\n";
do 'index_lsj.pl' or die $!;

# generate analyses for Diogenes (greek_analyses.txt and latin_analyses.txt)
print "Sorting Latin analyses ...\n";
do 'make_latin_analyses.pl' or die $!; 
print "Sorting Greek analyses ...\n";
do 'make_greek_analyses.pl' or die $!; 

# make indexes for the above (greek_analyses.idt and latin_analyses.idt)
print "Indexing Latin and Greek analyses ...\n";
do 'make_greek_index.pl' or die $!;
do 'make_latin_index.pl' or die $!;

# make reverse indexes (latin- and greek-lemmata.txt)
print "Making lemmata lists ... \n";
do "make_lemmata.pl" or die $!;

## now copy greek_analyses.* and latin_analyses.* and *-lemmata.txt to Perseus_Data
## along with the dicts if necessary
