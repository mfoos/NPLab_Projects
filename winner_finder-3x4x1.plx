#!/usr/bin/perl
#winner_finder-3x4x1.plx
use warnings;
use strict;

#The first program I ever wrote. One of these days, I'll make it a little more efficient.

#unneeded unkn groups (shmir-on-shmir):04, 24, 25, 26, 27, 28, 29, 30, 31, 32

my @file = (<>);
shift @file;
my (@storage, @row2, $line);
my ($gene1, $gene2, $gene3, $gene4, $gene5);
my (@grp01, @grp02, @grp03, @grp04, @grp05, @grp06, @grp07, @grp08, @grp09, @grp10, @grp11, @grp12, @grp13, @grp14, @grp15, @grp16, @grp17, @grp18, @grp19, @grp20, @grp21,@grp22, @grp23, @grp24, @grp29, @grp30, @grp31, @grp32);
my ($avg01, $avg02, $avg03, $avg04, $avg05, $avg06, $avg07, $avg08, $avg09, $avg10, $avg11, $avg12, $avg13, $avg14, $avg15, $avg16, $avg17, $avg18, $avg19, $avg20, $avg21,$avg22, $avg23, $avg24, $avg29, $avg30, $avg31, $avg32);
for (@file) 
{
	@row2 = split /,/, ($_);
	push @storage, [@row2];
};
foreach $line (@storage) 
{
	if (@$line[2] eq "Unkn-01")
	{
		push @grp01, @$line[4];
		my $total = 0;
		($total+=$_) for @grp01;
		$avg01 = ($total)/scalar(@grp01) + 0;
	};
	if (@$line[2] eq "Unkn-02")
	{
		push @grp02, @$line[4];
		my $total = 0;
		($total+=$_) for @grp02;
		$avg02 = ($total)/scalar(@grp02) + 0;

	};
	if (@$line[2] eq "Unkn-03")
	{
		push @grp03, @$line[4];
		my $total = 0;
		($total+=$_) for @grp03;
		$avg03= ($total)/scalar(@grp03) + 0

	};
	if (@$line[2] eq "Unkn-04")
	{
		push @grp04, @$line[4];
		my $total = 0;
		($total+=$_) for @grp04;
		$avg04= ($total)/scalar(@grp04) + 0;
		$gene5 = @$line[1];

	};
	if (@$line[2] eq "Unkn-05")
	{
		push @grp05, @$line[4];
		my $total = 0;
		($total+=$_) for @grp05;
		$avg05 = ($total)/scalar(@grp05) + 0;
		$gene1 = @$line[1];

	};
	if (@$line[2] eq "Unkn-06")
	{
		push @grp06, @$line[4];
		my $total = 0;
		($total+=$_) for @grp06;
		$avg06 = ($total)/scalar(@grp06) + 0;
		$gene2 = @$line[1];

	};
	if (@$line[2] eq "Unkn-07")
	{
		push @grp07, @$line[4];
		my $total = 0;
		($total+=$_) for @grp07;
		$avg07 = ($total)/scalar(@grp07) + 0;
		$gene3 = @$line[1];

	};
	if (@$line[2] eq "Unkn-08")
	{
		push @grp08, @$line[4];
		my $total = 0;
		($total+=$_) for @grp08;
		$avg08 = ($total)/scalar(@grp08) + 0;
		$gene4 = @$line[1];

	};
	if (@$line[2] eq "Unkn-09")
	{
		push @grp09, @$line[4];
		my $total = 0;
		($total+=$_) for @grp09;
		$avg09 = ($total)/scalar(@grp09) + 0;

	};
	if (@$line[2] eq "Unkn-10")
	{
		push @grp10, @$line[4];
		my $total = 0;
		($total+=$_) for @grp10;
		$avg10 = ($total)/scalar(@grp10) + 0;

	};
	if (@$line[2] eq "Unkn-11")
	{
		push @grp11, @$line[4];
		my $total = 0;
		($total+=$_) for @grp11;
		$avg11 = ($total)/scalar(@grp11) + 0;

	};
	if (@$line[2] eq "Unkn-12")
	{
		push @grp12, @$line[4];
		my $total = 0;
		($total+=$_) for @grp12;
		$avg12 = ($total)/scalar(@grp12) + 0;

	};
	if (@$line[2] eq "Unkn-13")
	{
		push @grp13, @$line[4];
		my $total = 0;
		($total+=$_) for @grp13;
		$avg13 = ($total)/scalar(@grp13) + 0;

	};		
	if (@$line[2] eq "Unkn-14")
	{
		push @grp14, @$line[4];
		my $total = 0;
		($total+=$_) for @grp14;
		$avg14 = ($total)/scalar(@grp14) + 0;

	};	
	if (@$line[2] eq "Unkn-15")
	{
		push @grp15, @$line[4];
		my $total = 0;
		($total+=$_) for @grp15;
		$avg15 = ($total)/scalar(@grp15) + 0;

	};	
	if (@$line[2] eq "Unkn-16")
	{
		push @grp16, @$line[4];
		my $total = 0;
		($total+=$_) for @grp16;
		$avg16 = ($total)/scalar(@grp16) + 0;

	};	
	if (@$line[2] eq "Unkn-17")
	{
		push @grp17, @$line[4];
		my $total = 0;
		($total+=$_) for @grp17;
		$avg17 = ($total)/scalar(@grp17) + 0;

	};
	if (@$line[2] eq "Unkn-18")
	{
		push @grp18, @$line[4];
		my $total = 0;
		($total+=$_) for @grp18;
		$avg18 = ($total)/scalar(@grp18) + 0;

	};	
	if (@$line[2] eq "Unkn-19")
	{
		push @grp19, @$line[4];
		my $total = 0;
		($total+=$_) for @grp19;
		$avg19 = ($total)/scalar(@grp19) + 0;

	};
	if (@$line[2] eq "Unkn-20")
	{
		push @grp20, @$line[4];
		my $total = 0;
		($total+=$_) for @grp20;
		$avg20 = ($total)/scalar(@grp20) + 0;

	};	
	if (@$line[2] eq "Unkn-21")
	{
		push @grp21, @$line[4];
		my $total = 0;
		($total+=$_) for @grp21;
		$avg21 = ($total)/scalar(@grp21) + 0;

	};	
	if (@$line[2] eq "Unkn-22")
	{
		push @grp22, @$line[4];
		my $total = 0;
		($total+=$_) for @grp22;
		$avg22 = ($total)/scalar(@grp22) + 0;

	};	
	if (@$line[2] eq "Unkn-23")
	{
		push @grp23, @$line[4];
		my $total = 0;
		($total+=$_) for @grp23;
		$avg23 = ($total)/scalar(@grp23) + 0;
	};
	if (@$line[2] eq "Unkn-24")
	{
		push @grp24, @$line[4];
		my $total = 0;
		($total+=$_) for @grp24;
		$avg24 = ($total)/scalar(@grp24) + 0;
	};
	if (@$line[2] eq "Unkn-29")
	{
		push @grp29, @$line[4];
		my $total = 0;
		($total+=$_) for @grp29;
		$avg29 = ($total)/scalar(@grp29) + 0;
	};
	if (@$line[2] eq "Unkn-30")
	{
		push @grp30, @$line[4];
		my $total = 0;
		($total+=$_) for @grp30;
		$avg30 = ($total)/scalar(@grp30) + 0;
	};	
	if (@$line[2] eq "Unkn-31")
	{
		push @grp31, @$line[4];
		my $total = 0;
		($total+=$_) for @grp31;
		$avg31= ($total)/scalar(@grp31) + 0;
	};
	if (@$line[2] eq "Unkn-32")
	{
		push @grp32, @$line[4];
		my $total = 0;
		($total+=$_) for @grp32;
		$avg32= ($total)/scalar(@grp32) + 0;
	};
};
#THAT was fun.
#print $avg01, "\n", $avg02, "\n", $avg03, "\n", $avg04, "\n", $avg05, "\n", $avg06, "\n", $avg07, "\n", $avg08, "\n", $avg09, "\n", $avg10, "\n", $avg11, "\n", $avg14, "\n", $avg15, "\n", $avg16, "\n", $avg17, "\n", $avg20, "\n", $avg21, "\n", $avg22, "\n", $avg23, "\n", $avg26, "\n", $avg27, "\n", $avg28, "\n", $avg29;
if (($avg12 - $avg05) && abs($avg12 - $avg05) >= .1)
	{
	print "For $gene1:\n";
	my %curvedata;
	$curvedata{Tubulin2} = abs($avg09 - $avg01);
	$curvedata{RP49MK} = abs($avg10 - $avg02);
	$curvedata{nuf} = abs($avg11 - $avg03);
	my $marker = 0;
	foreach my $key ( sort {$curvedata {$a} <=> $curvedata {$b}} keys %curvedata )
		{ 
		print "$key ";
		if ($marker == 0) {(print "is the winner, and "), ($marker = 1)};
		print "has a curve difference of $curvedata{$key}\n";
		};
	}
	else {print "$gene1 comes on earlier in shmir line than GFP control. ERROR and/or 0% KNOCKDOWN.\n"};
print "\n";
if (($avg16 - $avg06) && abs($avg16 - $avg06) >= .1)
	{
	print "For $gene2:\n";
	my %curvedata;
	$curvedata{Tubulin2} = abs($avg13 - $avg01);
	$curvedata{RP49MK} = abs($avg14 - $avg02);
	$curvedata{nuf} = abs($avg15 - $avg03);
	my $marker = 0;
	foreach my $key ( sort {$curvedata {$a} <=> $curvedata {$b}} keys %curvedata )
		{ 
		print "$key ";
		if ($marker == 0) {(print "is the winner, and "), ($marker = 1)};
		print "has a curve difference of $curvedata{$key}\n";
		};
	}
	else {print "$gene2 comes on earlier in shmir line than GFP control. ERROR and/or 0% KNOCKDOWN.\n"};
print "\n";
if (($avg20 - $avg07) && abs($avg20 - $avg07) >= .1)
	{
	print "For $gene3:\n";
	my %curvedata;
	$curvedata{Tubulin2} = abs($avg17 - $avg01);
	$curvedata{RP49MK} = abs($avg18 - $avg02);
	$curvedata{nuf} = abs($avg19 - $avg03);
	my $marker = 0;
	foreach my $key ( sort {$curvedata {$a} <=> $curvedata {$b}} keys %curvedata )
		{ 
		print "$key ";
		if ($marker == 0) {(print "is the winner, and "), ($marker = 1)};
		print "has a curve difference of $curvedata{$key}\n";
		};
	}
	else {print "$gene3 comes on earlier in shmir line than GFP control. ERROR and/or 0% KNOCKDOWN.\n"};
print "\n";
if (($avg24 - $avg08) && abs($avg24 - $avg08) >= .1)
	{
	print "For $gene4:\n";
	my %curvedata;
	$curvedata{Tubulin2} = abs($avg21 - $avg01);
	$curvedata{RP49MK} = abs($avg22 - $avg02);
	$curvedata{nuf} = abs($avg23 - $avg03);
	my $marker = 0;
	foreach my $key ( sort {$curvedata {$a} <=> $curvedata {$b}} keys %curvedata )
		{ 
		print "$key ";
		if ($marker == 0) {(print "is the winner, and "), ($marker = 1)};
		print "has a curve difference of $curvedata{$key}\n";
		};
	}
	else {print "$gene4 comes on earlier in shmir line than GFP control. ERROR and/or 0% KNOCKDOWN.\n"};
print "\n";
if (($avg32 - $avg04) && abs($avg32 - $avg04) >= .1)
	{
	print "For $gene5:\n";
	my %curvedata;
	$curvedata{Tubulin2} = abs($avg29 - $avg01);
	$curvedata{RP49MK} = abs($avg30 - $avg02);
	$curvedata{nuf} = abs($avg31 - $avg03);
	my $marker = 0;
	foreach my $key ( sort {$curvedata {$a} <=> $curvedata {$b}} keys %curvedata )
		{ 
		print "$key ";
		if ($marker == 0) {(print "is the winner, and "), ($marker = 1)};
		print "has a curve difference of $curvedata{$key}\n";
		};
	}
	else {print "$gene5 comes on earlier in shmir line than GFP control. ERROR and/or 0% KNOCKDOWN.\n"};

