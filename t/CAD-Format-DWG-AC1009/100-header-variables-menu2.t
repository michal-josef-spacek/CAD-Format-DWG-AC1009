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
my $menu2 = unpack 'Z*', $obj->header->variables->menu2;
is($menu2, '', 'Menu (\'\' - default).');

# Data directory.
$data_dir->up->dir('header')->dir('menu')->set;

# Test.
$obj = CAD::Format::DWG::AC1009->from_file(
	$data_dir->file('MENU1.DWG')->s,
);
$menu2 = unpack 'Z*', $obj->header->variables->menu2;
is($menu2, 'KLMNO\PQRSTUVW\XYZABCDE\FGHIJKLM\NOPQRS\ACAD',
	'Menu - second part (KLMNO\PQRSTUVW\XYZABCDE\FGHIJKLM\NOPQRS\ACAD - longest string with escapes).');
