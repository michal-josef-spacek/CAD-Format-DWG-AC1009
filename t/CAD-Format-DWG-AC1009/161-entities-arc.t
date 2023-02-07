use strict;
use warnings;

use CAD::Format::DWG::AC1009;
use File::Object;
use Test::More 'tests' => 12;
use Test::NoWarnings;

# Data directory.
my $data_dir = File::Object->new->up->dir('data/entity/arc')->set;

# Test.
diag "2d arc without handle.";
my $obj = CAD::Format::DWG::AC1009->from_file(
	$data_dir->file('ARC1.DWG')->s,
);
my $entity1 = $obj->entities->entities->entities->[0];
isa_ok($entity1, 'CAD::Format::DWG::AC1009::Entity');
is($entity1->entity_type, 8, 'Get entity type (8).');
my $arc1_data = $entity1->data;
my $entity_common = $arc1_data->entity_common;
is($arc1_data->entity_layer_index, 0, 'arc layer index (0).');
is($arc1_data->entity_size, 50, 'Entity size (50).');
is($arc1_data->center_point->x, 5, 'Center point of arc x (1).');
is($arc1_data->center_point->y, 5, 'Center point of arc y (1).');
is($arc1_data->radius, 1, 'Arc radius (1).');
is($arc1_data->angle_from, 4.71238898038469,
	'Arc angle from in radians (4.71238898038469).');
is($arc1_data->angle_to, 0, 'Arc angle to in radians (0).');
my $crc16 = unpack 'H*', reverse $arc1_data->crc16;
is($crc16, 'a4a5', 'CRC16 of arc (a4a5)');
my $entities = @{$obj->entities->entities->entities};
is($entities, 1, 'Number of entities (1).');
