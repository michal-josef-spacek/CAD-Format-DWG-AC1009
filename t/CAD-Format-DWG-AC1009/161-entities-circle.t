use strict;
use warnings;

use CAD::Format::DWG::AC1009;
use File::Object;
use Test::More 'tests' => 21;
use Test::NoWarnings;

# Data directory.
my $data_dir = File::Object->new->up->dir('data/entity/circle')->set;

# Test.
my $obj = CAD::Format::DWG::AC1009->from_file(
	$data_dir->file('CIRCLE1.DWG')->s,
);
my $entity1 = $obj->entities->entities->entities->[0];
isa_ok($entity1, 'CAD::Format::DWG::AC1009::Entity');
is($entity1->entity_type, 3, 'Get entity type (3).');
my $circle1_data = $entity1->data;
my $entity_common = $circle1_data->entity_common;
is($circle1_data->entity_layer_index, 0, 'circle layer index (0).');
is($circle1_data->entity_size, 34, 'Entity size (34).');
is($circle1_data->center_point->x, 1, 'Center point of cicrle x (1).');
is($circle1_data->center_point->y, 1, 'Center point of circle y (1).');
is($circle1_data->radius, 3, 'Radius of circle (3).');
my $crc16 = unpack 'H*', reverse $circle1_data->crc16;
is($crc16, '1953', 'CRC16 of circle (1953)');
my $entities = @{$obj->entities->entities->entities};
is($entities, 1, 'Number of entities (1).');

# Test.
$obj = CAD::Format::DWG::AC1009->from_file(
	$data_dir->file('CIRCLE2.DWG')->s,
);
$entity1 = $obj->entities->entities->entities->[0];
isa_ok($entity1, 'CAD::Format::DWG::AC1009::Entity');
is($entity1->entity_type, 3, 'Get entity type (3).');
$circle1_data = $entity1->data;
$entity_common = $circle1_data->entity_common;
is($circle1_data->entity_layer_index, 0, 'circle layer index (0).');
is($circle1_data->entity_size, 50, 'Entity size (50).');
is($circle1_data->entity_elevation, 10, 'Entity elevation (10).');
is($circle1_data->entity_thickness, 2, 'Entity thickness (2).');
is($circle1_data->center_point->x, 1, 'Center point of cicrle x (1).');
is($circle1_data->center_point->y, 1, 'Center point of circle y (1).');
is($circle1_data->radius, 3, 'Radius of circle (3).');
$crc16 = unpack 'H*', reverse $circle1_data->crc16;
is($crc16, '89e9', 'CRC16 of circle (89e9)');
$entities = @{$obj->entities->entities->entities};
is($entities, 1, 'Number of entities (1).');
