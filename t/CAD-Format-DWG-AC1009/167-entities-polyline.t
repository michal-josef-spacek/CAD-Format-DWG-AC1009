use strict;
use warnings;

use CAD::Format::DWG::AC1009;
use File::Object;
use Test::More 'tests' => 12;
use Test::NoWarnings;

# Data directory.
my $data_dir = File::Object->new->up->dir('data/entity/polyline')->set;

# Test.
my $obj = CAD::Format::DWG::AC1009->from_file(
	$data_dir->file('PL1.DWG')->s,
);
my $entity1 = $obj->entities->entities->entities->[0];
isa_ok($entity1, 'CAD::Format::DWG::AC1009::Entity');
is($entity1->entity_type, 19, 'Get entity type (19 - polyline).');
my $pline1_data = $entity1->data;
my $entity_common = $pline1_data->entity_common;
is($pline1_data->entity_layer_index, 0, 'Polyline layer index (0).');
is($pline1_data->entity_size, 13, 'Entity size (13).');
my $flag = $pline1_data->flag;
is($flag->spline_fit, 1, 'Polyline flag spline_fit variable (1).');
is($flag->closed, 0, 'Polyline flag closed variable (0).');
is($flag->curve_fit, 0, 'Polyline flag curve_fit variable (0).');
is($flag->polyline_3d, 0, 'Polyline flag polyline_3d variable (0).');
is($flag->mesh, 0, 'Polyline flag mesh variable (0).');
is($pline1_data->curve_type, $CAD::Format::DWG::AC1009::CURVE_TYPE_CUBIC_B_SPLINE,
	'Polyline curve type (6 - cubic b spline).');
my $entities = @{$obj->entities->entities->entities};
is($entities, 14, 'Number of entities (14).');
