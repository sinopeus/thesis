#!/usr/bin/perl -w
use strict;
use File::Sort qw(sort_file);
no locale;
# get constants
use POSIX 'locale_h';
$ENV{LC_ALL} = $ENV{LANG} = '';
# use new ENV settings
setlocale(LC_CTYPE, '');
setlocale(LC_COLLATE, '');

sort_file({
        t => "\t", k => 1,
        o => 'greek-analyses.txt', I => 'greek-analyses-unsorted.txt'
    });
