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
is($obj->header->num_header_vars, 205, 'Number of header variables (205 - default).');
