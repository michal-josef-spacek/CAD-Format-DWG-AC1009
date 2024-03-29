use strict;
use warnings;

use CAD::Format::DWG::AC1009;
use File::Object;
use Test::More 'tests' => 33;
use Test::NoWarnings;

# Data directory.
my $data_dir = File::Object->new->up->dir('data/entity/3dface')->set;

# Test.
diag "3d face in 2d without handle.";
my $obj = CAD::Format::DWG::AC1009->from_file(
	$data_dir->file('3DFACE1.DWG')->s,
);
my $entity1 = $obj->entities->entities->entities->[0];
isa_ok($entity1, 'CAD::Format::DWG::AC1009::Entity');
is($entity1->entity_type, 22, 'Get entity type (22).');
my $face3d1_data = $entity1->data;
my $entity_common = $face3d1_data->entity_common;
is($face3d1_data->entity_layer_index, 0, '3d face layer index (0).');
is($face3d1_data->entity_size, 74, 'Entity size (74).');
is($face3d1_data->first_point_x, 0, 'First point of 3d face x (0).');
is($face3d1_data->first_point_y, 0, 'First point of 3d face y (0).');
is($face3d1_data->second_point_x, 1, 'Second point of 3d face x (1).');
is($face3d1_data->second_point_y, 1, 'Second point of 3d face y (1).');
is($face3d1_data->third_point_x, 2, 'Third point of 3d face x (2).');
is($face3d1_data->third_point_y, 2, 'Third point of 3d face y (2).');
is($face3d1_data->fourth_point_x, 3, 'Fourth point of 3d face x (3).');
is($face3d1_data->fourth_point_y, 3, 'Fourth point of 3d face y (3).');
my $crc16 = unpack 'H*', reverse $face3d1_data->crc16;
is($crc16, '3e97', 'CRC16 of insert (3e97)');
my $entities = @{$obj->entities->entities->entities};
is($entities, 1, 'Number of entities (1).');

# Test.
diag "3d face in 3d without handle.";
$obj = CAD::Format::DWG::AC1009->from_file(
	$data_dir->file('3DFACE2.DWG')->s,
);
$entity1 = $obj->entities->entities->entities->[0];
isa_ok($entity1, 'CAD::Format::DWG::AC1009::Entity');
is($entity1->entity_type, 22, 'Get entity type (22).');
$face3d1_data = $entity1->data;
$entity_common = $face3d1_data->entity_common;
is($face3d1_data->entity_layer_index, 0, '3d face layer index (0).');
is($face3d1_data->entity_size, 106, 'Entity size (106).');
is($face3d1_data->first_point_x, 0, 'First point of 3d face x (0).');
is($face3d1_data->first_point_y, 0, 'First point of 3d face y (0).');
is($face3d1_data->first_point_z, 0, 'First point of 3d face z (0).');
is($face3d1_data->second_point_x, 1, 'Second point of 3d face x (1).');
is($face3d1_data->second_point_y, 1, 'Second point of 3d face y (1).');
is($face3d1_data->second_point_z, 1, 'Second point of 3d face z (1).');
is($face3d1_data->third_point_x, 2, 'Third point of 3d face x (2).');
is($face3d1_data->third_point_y, 2, 'Third point of 3d face y (2).');
is($face3d1_data->third_point_z, 2, 'Third point of 3d face z (2).');
is($face3d1_data->fourth_point_x, 3, 'Fourth point of 3d face x (3).');
is($face3d1_data->fourth_point_y, 3, 'Fourth point of 3d face y (3).');
is($face3d1_data->fourth_point_z, 3, 'Fourth point of 3d face z (3).');
$crc16 = unpack 'H*', reverse $face3d1_data->crc16;
is($crc16, '943f', 'CRC16 of insert (943f)');
$entities = @{$obj->entities->entities->entities};
is($entities, 1, 'Number of entities (1).');
