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
is($obj->header->extra_entities_size_raw, 2147483648,
	'Raw value of block entities section size (2147483648).');
