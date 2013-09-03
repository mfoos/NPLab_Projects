#!/usr/bin/perl;
use warnings;
use strict;
use Bio::Tools::CodonTable;
use Getopt::Long;
use Pod::Usage;
use Set::CrossProduct;

#set up flags
my $inSeq = '';
my $inStart = 0;
my $inEnd = 0;
my $inRest = '';
my $limit = 0;
my $usage = "\n\n$0 [Options] \n
Options:

	-seq	Protein coding sequence (frame 0, no more than 30bp)
	-beg	Number of bp at beginning to retain identity (optional)
	-end	Number of bp at end to retain identity (optional)
	-rest	Restriction site to be added (use N for wildcards)(optional)
	-limit	Maximum number of matches to return (if blank, all matches return)
	-help	Show this message

\n";
#check flags
GetOptions(
	'seq=s'	=>\$inSeq,
	'beg:i'	=>\$inStart,
	'end:i'	=>\$inEnd,
	'rest:s'=>\$inRest,
	'limit:i'=>\$limit,
	help	=>sub {pod2usage($usage);},
) or pod2usage(2);

unless ($inSeq){
	die "You must provide a protein coding sequence in frame 0.\n $usage";
}

#define input
my $origSeq = lc($inSeq);
my $keepStart;
my $keepEnd;
my $restSite;
if ($inStart){
	$keepStart = substr($origSeq,0,$inStart);
} else { $keepStart = ''; }
if ($inEnd){
	$keepEnd = substr($origSeq,-1,$inEnd);
} else { $keepEnd = ''; }
if ($inRest){
	$inRest =~ s/n/./i;
	$restSite = lc($inRest);
} else {$restSite = '';}

#check input
my $seqLength = length($origSeq);
my $codonCount;
if ($seqLength%3){
	print "Not a valid ORF\n";
	}
	else {
		$codonCount = $seqLength/3;
	}
if ( $restSite && $origSeq =~ /$restSite/){
	die "Your starting sequence already contains that restriction site\n";
}

#translate
my $codonTable = Bio::Tools::CodonTable->new();
my $protein = $codonTable->translate($origSeq);

#create an array reference of all of the codon possibilities for each protein
my @seqFact;
for (my $i = 0; $i < $codonCount; $i++){
	my @codons = $codonTable->revtranslate(substr($protein,$i,1));
	push @seqFact, [@codons];
}

print "Restriction site: $restSite\nStart: $keepStart\nEnd: $keepEnd\n";
my $site = '';
my $switch = 0;
my $max;
my $iterator = Set::CrossProduct->new(\@seqFact);
my $tuples = $iterator->cardinality();
print "Possible non-unique codon combinations: $tuples\n";
if ($limit){
	$max = $limit;
} else { $max = 60000; }
print "Returning $max iterations\n";

#create a series of strings up to $max choosing each codon at random from the array of codons which will code for the correct amino acid
while ($switch <= $max){
	my $newSeq;
	my $pointMuts;
	for (my $i = 0; $i < $codonCount; $i++){
		my $index = scalar @{$seqFact[$i]};
		$newSeq = $newSeq . $seqFact[$i][int(rand($index))];
	}

	#make sure all input criteria are met
	$pointMuts = diffCountLast9nt($origSeq,$newSeq);
	if ($pointMuts>=3 && $newSeq =~ /^$keepStart.*$keepEnd$/ && $newSeq =~ /($restSite)/){
		my $restSiteUC = uc($1);
		$newSeq =~ s/$restSite/$restSiteUC/;
		print $newSeq,"\n";
	}
		$switch++;
}

#return the number of differences between the last 9 nucleotides of the original sequence and the new one
sub diffCountLast9nt {
	my ($seqA, $seqB) = @_;
	my ($length) = length($seqA);
	my $count = 0;
	for (my $pos = ($length-9); $pos < $length; $pos++){
		if (substr($seqA,$pos,1) ne substr($seqB,$pos,1)){
			$count++;
		}
	}
	return $count;
}


