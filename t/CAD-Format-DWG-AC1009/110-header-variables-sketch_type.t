use strict;
use warnings;

use CAD::Format::DWG::AC1009;
use File::Object;
use Test::More 'tests' => 3;
use Test::NoWarnings;

# Data directory.
my $data_dir = File::Object->new->up->dir('data/blank')->set;

# Test.
my $obj = CAD::Format::DWG::AC1009->from_file(
	$data_dir->file('BLANK.DWG')->s,
);
is($obj->header->variables->sketch_type, 0, 'Sketch type (0 - default).');

# Data directory.
$data_dir = File::Object->new->up->dir('data/header/sketch_type')->set;

# Test.
$obj = CAD::Format::DWG::AC1009->from_file(
	$data_dir->file('SP1.DWG')->s,
);
is($obj->header->variables->sketch_type, 1, 'Sketch type (1).');
