#!/usr/bin/perl
use warnings;
use strict;
use Getopt::Long;
use Pod::Usage;

my $dirName;
my $excelOut = "SequenceResults.tsv";
my $uptorrOut = "NumberedResults.txt";

my $usage = "\n$0\n

-dir	Directory containing seq data
-help	Show this message

\n";

GetOptions(
    	'dir=s'	=> \$dirName,
	help => sub { pod2usage($usage); },
) or pod2usage(2);

unless ($dirName) {
	die "That directory does not exist.\n$usage\n"
}

unless (-d $dirName) {
    	die "\n$dirName is not a directory\n$usage\n";
}

unless (opendir(DIRHAND, $dirName)) {
    	print STDERR "cant open $dirName , $!\n";
    	die;
}

my @fileList = readdir(DIRHAND);
#my @natVals;
#foreach (@fileList) {
#	if ($_ =~ /(\d+).*.seq$/) {
#		push @natVals, $1;
#	}
#}
		
# this is from the internet, I do not understand it, but it takes things from
# A1-A9 to A1-B1, though it doesn't fix 10 sorting before 1
#my @index = sort { $natVals[$a] <=> $natVals[$b] } 0 .. $#natVals;
#@natVals = @natVals[@index];
#@fileList = @fileList[@index];

unless (open(EXCELOUT,">","$dirName/$excelOut")) {
	die "Cannot open file $excelOut for writing"
}
unless (open(UPTORROUT,">","$dirName/$uptorrOut")) {
	die "Cannot open file $uptorrOut for writing"
}

my $count = 0;
foreach (@fileList) {
	if ($_ =~ /seq$/) {
		my $eachSeq;
		open(EACHSEQ,"<","$dirName/$_");
		my $headerLine;
		my $seqString = "";
		foreach (<EACHSEQ>) {
			if ($_ =~ /^>/) {
				chomp;
				$headerLine = $_
			}
			else {
				chomp;
				$seqString .= $_
			}
		}
		my $seqID;
		my $seq21;
		if ($headerLine =~ />\d+-\d*_(.*)-/) {
			#print ">$1\n"
			$seqID = $1;
			$count++;
		}
		if ($seqString =~ /CTAGCAGT(.*)TAGTTA/i) {
			if (length($1) == 21) {
				$seq21 = $1;
			}
		}
		else {
			$seq21 = "This sequence requires people eyes"
		}
		print EXCELOUT "$seqID\t$seq21\n";
		print UPTORROUT "$count $seq21\n";
		close(EACHSEQ);
	}	
}
