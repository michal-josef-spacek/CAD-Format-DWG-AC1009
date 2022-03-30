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
is($obj->header->variables->world_view, 1, 'World view (1 - default).');

# Data directory.
$data_dir = File::Object->new->up->dir('data/header/world_view')->set;

# Test.
$obj = CAD::Format::DWG::AC1009->from_file(
	$data_dir->file('WV_OFF.DWG')->s,
);
is($obj->header->variables->world_view, 0, 'World view (0).');
