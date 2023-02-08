use strict;
use warnings;

use CAD::Format::DWG::AC1009;
use File::Object;
use Test::More 'tests' => 12;
use Test::NoWarnings;

# Data directory.
my $data_dir = File::Object->new->up->dir('data/entity/shape')->set;

# Test.
diag "Shape without handle.";
my $obj = CAD::Format::DWG::AC1009->from_file(
	$data_dir->file('SHAPE1.DWG')->s,
);
my $entity1 = $obj->entities->entities->entities->[0];
isa_ok($entity1, 'CAD::Format::DWG::AC1009::Entity');
is($entity1->entity_type, 4, 'Get entity type (4).');
my $shape1_data = $entity1->data;
is($shape1_data->entity_size, 36, 'Entity size (36).');
is($shape1_data->entity_layer_index, 0, 'Entity layer index (0).');
is($shape1_data->x, 1, 'Shape x (1).');
is($shape1_data->y, 2, 'Shape y (2).');
is($shape1_data->height, 1, 'Shape height (1).');
is($shape1_data->item_num, 132, 'Shape item number (132).');
is($shape1_data->load_num, 1, 'Shape load number (1).');
my $crc16 = unpack 'H*', reverse $shape1_data->crc16;
is($crc16, 'fd81', 'CRC16 of shape (fd81)');
my $entities = @{$obj->entities->entities->entities};
is($entities, 1, 'Number of entities (1).');
