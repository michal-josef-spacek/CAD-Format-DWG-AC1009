use strict;
use warnings;

use CAD::Format::DWG::AC1009;
use File::Object;
use Test::More 'tests' => 17;
use Test::NoWarnings;

# Data directory.
my $data_dir = File::Object->new->up->dir('data/entity/jump')->set;

# Test.
diag "jump without handle in entity section.";
my $obj = CAD::Format::DWG::AC1009->from_file(
	$data_dir->file('JUMP1.DWG')->s,
);
my $entity1 = $obj->entities->entities->entities->[0];
isa_ok($entity1, 'CAD::Format::DWG::AC1009::Entity');
is($entity1->entity_type, 18, 'Get entity type (18 - jump).');
my $jump1_data = $entity1->data;
is($jump1_data->entity_size, 10, 'Entity size (10).');
is($jump1_data->address_raw, 0x80000000, 'Raw address for jump (0x80000000).');
is($jump1_data->address, 0, 'Address to jump (0).');
is($jump1_data->address_flag, 0x80, 'Address flag (0x80 - extra entities).');
my $crc16 = unpack 'H*', reverse $jump1_data->crc16;
is($crc16, '4f8c', 'CRC16 of jump (4f8c)');
my $entities = @{$obj->entities->entities->entities};
is($entities, 5, 'Number of entities (5).');

# Test.
diag "jump without handle in extra entity section.";
$obj = CAD::Format::DWG::AC1009->from_file(
	$data_dir->file('JUMP1.DWG')->s,
);
my $extra_entity2 = $obj->entities_extra->entities_extra->entities->[1];
isa_ok($extra_entity2, 'CAD::Format::DWG::AC1009::Entity');
is($extra_entity2->entity_type, 18, 'Get entity type (18 - jump).');
$jump1_data = $extra_entity2->data;
is($jump1_data->entity_size, 10, 'Entity size (10).');
is($jump1_data->address_raw, 1753, 'Raw address for jump (1753).');
is($jump1_data->address, 1753, 'Address to jump (1753).');
is($jump1_data->address_flag, 0, 'Address flag (0 - entities).');
$crc16 = unpack 'H*', reverse $jump1_data->crc16;
is($crc16, 'b256', 'CRC16 of jump (b256)');
my $entities_extra = @{$obj->entities_extra->entities_extra->entities};
is($entities_extra, 2, 'Number of extra entities (2).');
