use strict;
use warnings;

use CAD::Format::DWG::AC1009;
use File::Object;
use Test::More 'tests' => 39;
use Test::NoWarnings;

# Data directory.
my $data_dir = File::Object->new->up->dir('data/entity/dim/aligned')->set;

# Test.
my $obj = CAD::Format::DWG::AC1009->from_file(
	$data_dir->file('DIM1.DWG')->s,
);
my $entity1 = $obj->entities->entities->entities->[0];
isa_ok($entity1, 'CAD::Format::DWG::AC1009::Entity');
is($entity1->entity_type, 23, 'Get entity type (23).');
my $dim1_data = $entity1->data;
is($dim1_data->entity_size, 101, 'Entity size (101).');
is($dim1_data->entity_layer_index, 0, 'Entity layer index (0).');
is($dim1_data->block_index, 0, 'Entity block index (0).');
is($dim1_data->dimension_line_defining_point->x, 8, 'Defining point x (8)');
is($dim1_data->dimension_line_defining_point->y, 8, 'Defining point y (8)');
is($dim1_data->dimension_line_defining_point->z, 0, 'Defining point z (0)');
is($dim1_data->default_text_position->x, 7.5, 'Default text position x (7.5)');
is($dim1_data->default_text_position->y, 8.5, 'Default text position y (8.5)');
is($dim1_data->dim_type->type, 1, 'Dimension type (1 - aligned)');
is($dim1_data->extension_defining_point1->x, 6, 'Extension defining point 1 x (6)');
is($dim1_data->extension_defining_point1->y, 8, 'Extension defining point 1 y (8)');
is($dim1_data->extension_defining_point1->z, 0, 'Extension defining point 1 z (0)');
is($dim1_data->extension_defining_point2->x, 7, 'Extension defining point 2 x (7)');
is($dim1_data->extension_defining_point2->y, 7, 'Extension defining point 2 y (7)');
is($dim1_data->extension_defining_point2->z, 0, 'Extension defining point 2 z (0)');
my $crc16 = unpack 'H*', reverse $dim1_data->crc16;
is($crc16, '04a1', 'CRC16 of dim (04a1)');
my $entities = @{$obj->entities->entities->entities};
is($entities, 1, 'Number of entities (1).');

# Test.
$obj = CAD::Format::DWG::AC1009->from_file(
	$data_dir->file('DIM2.DWG')->s,
);
$entity1 = $obj->entities->entities->entities->[0];
isa_ok($entity1, 'CAD::Format::DWG::AC1009::Entity');
is($entity1->entity_type, 23, 'Get entity type (23).');
$dim1_data = $entity1->data;
is($dim1_data->entity_size, 109, 'Entity size (109).');
is($dim1_data->entity_layer_index, 0, 'Entity layer index (0).');
is($dim1_data->block_index, 0, 'Entity block index (0).');
is($dim1_data->dimension_line_defining_point->x, 8, 'Defining point x (8)');
is($dim1_data->dimension_line_defining_point->y, 8, 'Defining point y (8)');
is($dim1_data->dimension_line_defining_point->z, 2, 'Defining point z (2)');
is($dim1_data->default_text_position->x, 7.5, 'Default text position x (7.5)');
is($dim1_data->default_text_position->y, 8.5, 'Default text position y (8.5)');
is($dim1_data->dim_type->type, 1, 'Dimension type (1 - aligned)');
is($dim1_data->extension_defining_point1->x, 6, 'Extension defining point 1 x (6)');
is($dim1_data->extension_defining_point1->y, 8, 'Extension defining point 1 y (8)');
is($dim1_data->extension_defining_point1->z, 2, 'Extension defining point 1 z (2)');
is($dim1_data->extension_defining_point2->x, 7, 'Extension defining point 2 x (7)');
is($dim1_data->extension_defining_point2->y, 7, 'Extension defining point 2 y (7)');
is($dim1_data->extension_defining_point2->z, 2, 'Extension defining point 2 z (2)');
$crc16 = unpack 'H*', reverse $dim1_data->crc16;
is($crc16, 'a7c9', 'CRC16 of dim (a7c9)');
$entities = @{$obj->entities->entities->entities};
is($entities, 1, 'Number of entities (1).');
