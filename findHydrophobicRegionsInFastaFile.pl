#!usr/bin/perl;
use warnings;
use strict;

unless (open FASTA,"<","test.fasta"){ die $!;}
my @fasta = <FASTA>;
close FASTA;


my ($buffer,$count,$total);
foreach (@fasta)
{
	$total++;	
	if ($_ =~ /[VILMFWCA]{8}/)
	{	
		$count++;
		print "Hydrophobic stretch found in: ",$buffer;
		while ($_ =~ /([VILMFWCA]{8})/g)
		{
			my ($match,$posi) = ($1,(pos($_)-7));
			print $match,"\nThe match was at position: ",$posi,"\n";
		}
		print "\n\n";
	}
	$buffer = $_;
}
print "Hydrophobic region(s) found in $count sequences out of ",($total/2)," sequences\n";


