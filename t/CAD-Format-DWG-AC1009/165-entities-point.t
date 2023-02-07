use strict;
use warnings;

use CAD::Format::DWG::AC1009;
use File::Object;
use Test::More 'tests' => 18;
use Test::NoWarnings;

# Data directory.
my $data_dir = File::Object->new->up->dir('data/entity/point')->set;

# Test.
diag "2d point with handle.";
my $obj = CAD::Format::DWG::AC1009->from_file(
	$data_dir->file('POINT1.DWG')->s,
);
my $entity1 = $obj->entities->entities->entities->[0];
isa_ok($entity1, 'CAD::Format::DWG::AC1009::Entity');
is($entity1->entity_type, 2, 'Get entity type (2).');
my $point1_data = $entity1->data;
is($point1_data->entity_size, 26, 'Entity size (26).');
is($point1_data->entity_layer_index, 0, 'Entity layer index (0).');
is($point1_data->x, 1, 'Entity x (1).');
is($point1_data->y, 2, 'Entity y (2).');
my $crc16 = unpack 'H*', reverse $point1_data->crc16;
is($crc16, 'd0f5', 'CRC16 of point (d0f5)');
my $entities = @{$obj->entities->entities->entities};
is($entities, 1, 'Number of entities (1).');

# Test.
diag "3d point with handle.";
$obj = CAD::Format::DWG::AC1009->from_file(
	$data_dir->file('POINT2.DWG')->s,
);
$entity1 = $obj->entities->entities->entities->[0];
isa_ok($entity1, 'CAD::Format::DWG::AC1009::Entity');
is($entity1->entity_type, 2, 'Get entity type (2).');
$point1_data = $entity1->data;
is($point1_data->entity_size, 34, 'Entity size (34).');
is($point1_data->entity_layer_index, 0, 'Entity layer index (0).');
is($point1_data->x, 1, 'Entity x (1).');
is($point1_data->y, 2, 'Entity y (2).');
is($point1_data->z, 3, 'Entity z (3).');
$crc16 = unpack 'H*', reverse $point1_data->crc16;
is($crc16, '4473', 'CRC16 of point (4473)');
$entities = @{$obj->entities->entities->entities};
is($entities, 1, 'Number of entities (1).');
