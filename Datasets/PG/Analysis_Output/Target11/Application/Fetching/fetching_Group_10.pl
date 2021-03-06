#!/usr/bin/perl

use strict;
use Bio::DB::Fasta;
my $database;
my $fasta_library;
my %records;
open IDFILE, "/home/arjen/16/PGCleanTarget/Target11/Application/Groups/Group_10.txt" or die $!;
open OUTPUT, ">fetching_Group_10.txt" or die$!;
#  name of the library file - (here it is hardcoded)
$fasta_library='/home/arjen/16/PGCleanTarget/Target11/ApSeqFile';
# creates the database of the library, based on the file
$database = Bio::DB::Fasta->new("$fasta_library") or die "Failed to creat Fasta DP object on fasta library\n";
# now, it parses the file with the fasta headers you want to get
while (<IDFILE>) {
     my ($id) = (/^>*(\S+)/);  # capture the id string (without the initial ">")
     my $header = $database->header($id);
    print OUTPUT  ">$header\n", $database->seq( $id ), "\n";
}
exit;
