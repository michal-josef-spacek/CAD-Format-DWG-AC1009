use strict;
use warnings;

use CAD::Format::DWG::AC1009;
use File::Object;
use Test::More 'tests' => 2;
use Test::NoWarnings;

# Data directory.
my $data_dir = File::Object->new->up->dir('data/blank')->set;

# Test.
my $obj = CAD::Format::DWG::AC1009->from_file(
	$data_dir->file('BLANK.DWG')->s,
);
my $dim_arrowhead_block = unpack 'Z*', $obj->header->variables->dim_arrowhead_block;
is($dim_arrowhead_block, '',
	'Dimension arrowhead block (\'\' - default).');
