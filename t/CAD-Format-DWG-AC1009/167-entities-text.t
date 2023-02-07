use strict;
use warnings;

use CAD::Format::DWG::AC1009;
use File::Object;
use Test::More 'tests' => 14;
use Test::NoWarnings;

# Data directory.
my $data_dir = File::Object->new->up->dir('data/entity/text')->set;

# Test.
diag "Text aligned between two points without handle.";
my $obj = CAD::Format::DWG::AC1009->from_file(
	$data_dir->file('TEXT1.DWG')->s,
);
my $entity1 = $obj->entities->entities->entities->[0];
isa_ok($entity1, 'CAD::Format::DWG::AC1009::Entity');
is($entity1->entity_type, 7, 'Get entity type (7).');
my $text1_data = $entity1->data;
is($text1_data->entity_size, 56, 'Entity size (56).');
is($text1_data->entity_layer_index, 0, 'Entity layer index (0).');
is($text1_data->insert_point->x, 1, 'Text insert point x (1).');
is($text1_data->insert_point->y, 4, 'Text insert point y (4).');
is($text1_data->height, 0.75, 'Text height (0.75).');
is($text1_data->value, 'FOO', 'Text value (FOO).');
is($text1_data->horiz_alignment, 3, 'Text horizontal alignment (3 - aligned).');
is($text1_data->aligned_to->x, 3, 'Text aligned to point x (3).');
is($text1_data->aligned_to->y, 4, 'Text aligned to point y (4).');
my $crc16 = unpack 'H*', reverse $text1_data->crc16;
is($crc16, 'af78', 'CRC16 of text (af78)');
my $entities = @{$obj->entities->entities->entities};
is($entities, 1, 'Number of entities (1).');
