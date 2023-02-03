use strict;
use warnings;

use CAD::Format::DWG::AC1009;
use File::Object;
use Test::More 'tests' => 3;
use Test::NoWarnings;

# Data directory.
my $data_dir = File::Object->new->up->dir('data')->dir('blank')->set;

# Test.
my $obj = CAD::Format::DWG::AC1009->from_file(
	$data_dir->file('BLANK.DWG')->s,
);
my $menu = unpack 'Z*', $obj->header->variables->menu;
is($menu, 'acad', 'Menu (acad - default).');

# Data directory.
$data_dir->up->dir('header')->dir('menu')->set;

# Test.
$obj = CAD::Format::DWG::AC1009->from_file(
	$data_dir->file('MENU1.DWG')->s,
);
$menu = unpack 'Z*', $obj->header->variables->menu;
is($menu, 'C:\ABCDEFG\HIJ', 'Menu (C:\ABCDEFG\HIJ - longest string with escapes).');
