#!/usr/bin/perl -w
use strict;
my $w = shift @ARGV;

my (%index_start, %index_end);
{
    open IDT, "<greek-analyses.idt" or die $1;
    local $/ = undef;
    my $code = <IDT>;
    eval $code;
    warn "Error reading in saved corpora: $@" if $@;
}
open my $fh, '<greek-analyses.txt' or die $!;

my $j = 0;

my $result = lookup($w);
print "$result\n$j\n";

sub lookup {
    my $word = shift;
    my $key = substr($word, 0, 3);
    my $start = $index_start{$key} || 0;
    my $stop = $index_end{$key} || 71585690;
    return search($word, $start, $stop);
}

# Recursive binary search
sub search {
    $j++;
    my $word = shift;
    my $start = shift;
    my $stop = shift;
    my $mid = int(($start + $stop) / 2);
    return 0 if $start == $mid or $stop == $mid;
    seek $fh, $mid, 0;
    <$fh>;
    my $line = <$fh>;
    chomp $line;
    (my $key, my $value) = split /\t/, $line, 2;
    print "debug: $start -> $mid -> $stop  cmp: ", ($word cmp $key), "   $word vs $key\n";
    return search($word, $start, $mid) if(($word cmp $key) == -1);
    return search($word, $mid, $stop) if(($word cmp $key) == 1);
    return $value;
  }

