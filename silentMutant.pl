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
my $usage = "\n\n$0 [Options] \n
Options:

	-seq	Protein coding sequence (frame 0, at least 9bp/no more than 30bp)
	-beg	Number of bp at beginning to retain identity (optional)
	-end	Number of bp at end to retain identity (optional)
	-rest	Restriction site to be added (use N for wildcards)(optional)
	-help	Show this message

\n";
#check flags
GetOptions(
	'seq=s'	=>\$inSeq,
	'beg:i'	=>\$inStart,
	'end:i'	=>\$inEnd,
	'rest:s'=>\$inRest,
	help	=>sub {pod2usage($usage);},
) or pod2usage(2);

unless ($inSeq && ((length($inSeq)) >= 9)){
	die "You must provide a protein coding sequence of at least 9nt in frame 0.\n $usage";
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
if ($restSite && $origSeq =~ /$restSite/){
	die "Your starting sequence already contains that restriction site\n";
}

#translate
my $codonTable = Bio::Tools::CodonTable->new();
my $protein = $codonTable->translate($origSeq);

#create an array of array references of all of the codon possibilities for each amino acid
my @seqFact; #will be the array of array refs
for (my $i = 0; $i < $codonCount; $i++){
	#for each amino acid in $protein, populate an array with reverse
	#translation possibilities, then increment to move to next amino acid
	my @codons = $codonTable->revtranslate(substr($protein,$i,1));
	push @seqFact, [@codons];
}

print "Restriction site: $restSite\nStart: $keepStart\nEnd: $keepEnd\n";

#Create an object to supply every possible codon combination from the reverse
#translation
my $crossProd = Set::CrossProduct->new(\@seqFact);
my $totalNewSeqs = $crossProd->cardinality; 

#Use the number of combinations possible to extract all of them from the object
#generator, one at a time, with the get() method.
my %uniqueSeq;
my $newMut;
my $switch = 0;
for (my $i = 0; $i < $totalNewSeqs; $i++){
	my $newSeq; #
	my $pointMuts; #
	$newMut = $crossProd->get;
	$newSeq = join('',@$newMut);
		
	#make sure all input criteria are met
	$pointMuts = diffCountLast9nt($origSeq,$newSeq);
	if ($pointMuts>=3 && $newSeq =~ /^$keepStart.*$keepEnd$/ && $newSeq =~ /($restSite)/){
		my $restSiteUC = uc($1);
		$newSeq =~ s/$restSite/$restSiteUC/;
		print $newSeq,"\n";
		$switch++;
	}
}
#watch for the possibility that there are no matches
if ($switch == 0){
	print "There are no synonymous sequences meeting your criteria.\n";
}
else {
	print "$switch matching sequences found.\n"
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
