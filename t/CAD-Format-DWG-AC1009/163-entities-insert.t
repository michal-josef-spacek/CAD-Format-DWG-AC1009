use strict;
use warnings;

use CAD::Format::DWG::AC1009;
use File::Object;
use Test::More 'tests' => 15;
use Test::NoWarnings;

# Data directory.
my $data_dir = File::Object->new->up->dir('data/entity/insert')->set;

# Test.
my $obj = CAD::Format::DWG::AC1009->from_file(
	$data_dir->file('INSERT1.DWG')->s,
);
my $entity1 = $obj->entities->entities->entities->[1];
isa_ok($entity1, 'CAD::Format::DWG::AC1009::Entity');
is($entity1->entity_type, 14, 'Get entity type (14).');
my $insert1_data = $entity1->data;
my $entity_insert_flags = $insert1_data->entity_insert_flags;
is($insert1_data->entity_size, 68, 'Entity size (68).');
is($insert1_data->entity_layer_index, 0, 'Entity layer index (0).');
is($insert1_data->entity_elevation, 3, 'Entity elevation (3).');
is($insert1_data->block_index, 0, 'Entity block index (3).');
is($insert1_data->x, 6, 'Entity x (6).');
is($insert1_data->y, 1, 'Entity y (1).');
is($insert1_data->x_scale, 0.5, 'Entity x scale (0.5).');
is($insert1_data->y_scale, 0.5, 'Entity y scale (0.5).');
is($insert1_data->rotation_angle_in_radians, 0.523598775598299, 'Entity rotation in rad (0.523598775598299).');
is($insert1_data->z_scale, 0.5, 'Entity z scale (0.5).');
my $crc16 = unpack 'H*', reverse $insert1_data->crc16;
is($crc16, 'd361', 'CRC16 of insert (d361)');
my $entities = @{$obj->entities->entities->entities};
is($entities, 2, 'Number of entities (2).');
