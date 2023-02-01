use strict;
use warnings;

use CAD::Format::DWG::AC1009;
use File::Object;
use Test::More 'tests' => 12;
use Test::NoWarnings;

# Data directory.
my $data_dir = File::Object->new->up->dir('data/entity/line')->set;

# Test.
my $obj = CAD::Format::DWG::AC1009->from_file(
	$data_dir->file('LINE1.DWG')->s,
);
my $entity1 = $obj->entities->entities->[0];
isa_ok($entity1, 'CAD::Format::DWG::AC1009::Entity');
is($entity1->entity_type, 1, 'Get entity type (1).');
my $line1_data = $entity1->data;
is($line1_data->entity_size, 44, 'Entity size (44).');
is($line1_data->entity_layer_index, 0, 'Entity layer index (0).');
my $handling = unpack 'H*', $line1_data->handling_id;
is($handling, '4c', 'Entity handling id (4c).');
is($line1_data->x1, 1, 'Entity x1 (1).');
is($line1_data->y1, 1, 'Entity y1 (1).');
is($line1_data->x2, 2, 'Entity x2 (2).');
is($line1_data->y2, 2, 'Entity y2 (2).');
my $crc16 = unpack 'H*', reverse $line1_data->crc16;
is($crc16, 'bced', 'CRC16 of line (bced)');
my $entities = @{$obj->entities->entities};
is($entities, 1, 'Number of entities (1).');
