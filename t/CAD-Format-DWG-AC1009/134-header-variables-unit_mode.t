use strict;
use warnings;

use CAD::Format::DWG::AC1009;
use File::Object;
use Test::More 'tests' => 3;
use Test::NoWarnings;

# Data directory.
my $data_dir = File::Object->new->up->dir('data/header/unit_mode')->set;

# Test.
my $obj = CAD::Format::DWG::AC1009->from_file(
	$data_dir->file('UM0.DWG')->s,
);
is($obj->header->variables->unit_mode, '0', 'Unit mode (0 - default).');

# Test.
$obj = CAD::Format::DWG::AC1009->from_file(
	$data_dir->file('UM1.DWG')->s,
);
is($obj->header->variables->unit_mode, '1', 'Unit mode (1).');
