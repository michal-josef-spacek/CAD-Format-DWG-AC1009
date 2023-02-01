# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.009_000;
use Encode;

########################################################################
package CAD::Format::DWG::AC1009;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $COORDINATES_ABSOLUTE_COORDINATES = 0;
our $COORDINATES_ABSOLUTE_COORDINATES_REALTIME = 1;
our $COORDINATES_RELATIVE_POLAR_COORDINATES = 2;

our $SPLINE_TYPE_QUADRATIC_B_SPLINE = 5;
our $SPLINE_TYPE_CUBIC_B_SPLINE = 6;

our $CURVE_TYPE_QUADRATIC_B_SPLINE = 5;
our $CURVE_TYPE_CUBIC_B_SPLINE = 6;
our $CURVE_TYPE_BEZIER = 8;

our $ENTITIES_LINE = 1;
our $ENTITIES_POINT = 2;
our $ENTITIES_CIRCLE = 3;
our $ENTITIES_SHAPE = 4;
our $ENTITIES_TEXT = 7;
our $ENTITIES_ARC = 8;
our $ENTITIES_TRACE = 9;
our $ENTITIES_SOLID = 11;
our $ENTITIES_BLOCK_BEGIN = 12;
our $ENTITIES_BLOCK_END = 13;
our $ENTITIES_INSERT = 14;
our $ENTITIES_ATTDEF = 15;
our $ENTITIES_ATTRIB = 16;
our $ENTITIES_SEQEND = 17;
our $ENTITIES_POLYLINE = 18;
our $ENTITIES_POLYLINE2 = 19;
our $ENTITIES_VERTEX = 20;
our $ENTITIES_FACE3D = 22;
our $ENTITIES_DIM = 23;
our $ENTITIES_VPORT = 24;

our $EEDS_EED_1000 = 0;
our $EEDS_EED_1001 = 1;
our $EEDS_EED_1002 = 2;
our $EEDS_EED_1003 = 3;
our $EEDS_EED_1005 = 5;
our $EEDS_EED_1010 = 10;
our $EEDS_EED_1040 = 40;
our $EEDS_EED_1070 = 70;

our $ISO_PLANE_LEFT = 0;
our $ISO_PLANE_TOP = 1;
our $ISO_PLANE_RIGHT = 2;

our $HORIZ_ALIGNMENT_LEFT = 0;
our $HORIZ_ALIGNMENT_CENTER = 1;
our $HORIZ_ALIGNMENT_RIGHT = 2;
our $HORIZ_ALIGNMENT_ALIGNED = 3;
our $HORIZ_ALIGNMENT_MIDDLE = 4;
our $HORIZ_ALIGNMENT_FIT = 5;

our $TEXT_TYPE_VERT_BASELINE = 0;
our $TEXT_TYPE_VERT_BOTTOM = 1;
our $TEXT_TYPE_VERT_MIDDLE = 2;
our $TEXT_TYPE_VERT_TOP = 3;

our $ANGLE_DIRECTION_COUNTERCLOCKWISE = 0;
our $ANGLE_DIRECTION_CLOCKWISE = 1;

our $CURRENT_COLOR_BYBLOCK = 0;
our $CURRENT_COLOR_RED = 1;
our $CURRENT_COLOR_YELLOW = 2;
our $CURRENT_COLOR_GREEN = 3;
our $CURRENT_COLOR_CYAN = 4;
our $CURRENT_COLOR_BLUE = 5;
our $CURRENT_COLOR_MAGENTA = 6;
our $CURRENT_COLOR_WHITE = 7;
our $CURRENT_COLOR_BYLAYER = 256;

our $UNIT_TYPES_SCIENTIFIC = 1;
our $UNIT_TYPES_DECIMAL = 2;
our $UNIT_TYPES_ENGINEERING = 3;
our $UNIT_TYPES_ARCHITECTURAL = 4;
our $UNIT_TYPES_FRACTIONAL = 5;

our $UNITS_FOR_ANGLES_DECIMAL_DEGREES = 0;
our $UNITS_FOR_ANGLES_DEGREES_MINUTES_SECONDS = 1;
our $UNITS_FOR_ANGLES_GRADIANS = 2;
our $UNITS_FOR_ANGLES_RADIANS = 3;
our $UNITS_FOR_ANGLES_SURVEYOR_S_UNITS = 4;

our $ATT_VISIBILITY_FALSE = 0;
our $ATT_VISIBILITY_NORMAL = 1;
our $ATT_VISIBILITY_ALL = 2;

our $LIMITS_CHECK_OBJECTS_CAN_OUTSIDE_GRID = 0;
our $LIMITS_CHECK_OBJECTS_CANNOT_OUTSIDE_GRID = 1;

our $OSNAP_MODES_NONE = 0;
our $OSNAP_MODES_ENDPOINT = 1;
our $OSNAP_MODES_MIDPOINT = 2;
our $OSNAP_MODES_CENTER = 4;
our $OSNAP_MODES_NODE = 8;
our $OSNAP_MODES_QUADRANT = 16;
our $OSNAP_MODES_INTERSECTION = 32;
our $OSNAP_MODES_INSERTION = 64;
our $OSNAP_MODES_PERPENDICULAR = 128;
our $OSNAP_MODES_TANGENT = 256;
our $OSNAP_MODES_NEAREST = 512;

our $DIM_TYPE_ROTATED_HORIZONTAL_OR_VERTICAL = 0;
our $DIM_TYPE_ALIGNED = 1;
our $DIM_TYPE_ANGULAR = 2;
our $DIM_TYPE_DIAMETER = 3;
our $DIM_TYPE_RADIUS = 4;
our $DIM_TYPE_ANGULAR_3_POINT = 5;
our $DIM_TYPE_ORDINATE = 6;

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{header} = CAD::Format::DWG::AC1009::Header->new($self->{_io}, $self, $self->{_root});
    $self->{header_sentinel} = $self->{_io}->read_bytes(16);
    $self->{_raw_entities} = $self->{_io}->read_bytes(($self->header()->entities_end() - $self->header()->entities_start()));
    my $io__raw_entities = IO::KaitaiStruct::Stream->new($self->{_raw_entities});
    $self->{entities} = CAD::Format::DWG::AC1009::RealEntities->new($io__raw_entities, $self, $self->{_root});
    $self->{crc_entities} = $self->{_io}->read_bytes(($self->header()->table_block()->begin() - $self->_io()->pos()));
    $self->{blocks} = ();
    my $n_blocks = $self->header()->table_block()->items();
    for (my $i = 0; $i < $n_blocks; $i++) {
        push @{$self->{blocks}}, CAD::Format::DWG::AC1009::Block->new($self->{_io}, $self, $self->{_root});
    }
    $self->{crc_blocks} = $self->{_io}->read_bytes(($self->header()->table_layer()->begin() - $self->_io()->pos()));
    $self->{layers} = ();
    my $n_layers = $self->header()->table_layer()->items();
    for (my $i = 0; $i < $n_layers; $i++) {
        push @{$self->{layers}}, CAD::Format::DWG::AC1009::Layer->new($self->{_io}, $self, $self->{_root});
    }
    $self->{crc_layers} = $self->{_io}->read_bytes(($self->header()->table_style()->begin() - $self->_io()->pos()));
    $self->{styles} = ();
    my $n_styles = $self->header()->table_style()->items();
    for (my $i = 0; $i < $n_styles; $i++) {
        push @{$self->{styles}}, CAD::Format::DWG::AC1009::Style->new($self->{_io}, $self, $self->{_root});
    }
    $self->{crc_styles} = $self->{_io}->read_bytes(($self->header()->table_linetype()->begin() - $self->_io()->pos()));
    $self->{linetypes} = ();
    my $n_linetypes = $self->header()->table_linetype()->items();
    for (my $i = 0; $i < $n_linetypes; $i++) {
        push @{$self->{linetypes}}, CAD::Format::DWG::AC1009::Linetype->new($self->{_io}, $self, $self->{_root});
    }
    $self->{crc_linetypes} = $self->{_io}->read_bytes(($self->header()->table_view()->begin() - $self->_io()->pos()));
    $self->{views} = ();
    my $n_views = $self->header()->table_view()->items();
    for (my $i = 0; $i < $n_views; $i++) {
        push @{$self->{views}}, CAD::Format::DWG::AC1009::View->new($self->{_io}, $self, $self->{_root});
    }
    $self->{crc_views} = $self->{_io}->read_bytes(($self->header()->variables()->table_ucs()->begin() - $self->_io()->pos()));
    $self->{ucss} = ();
    my $n_ucss = $self->header()->variables()->table_ucs()->items();
    for (my $i = 0; $i < $n_ucss; $i++) {
        push @{$self->{ucss}}, CAD::Format::DWG::AC1009::Ucs->new($self->{_io}, $self, $self->{_root});
    }
    $self->{crc_ucss} = $self->{_io}->read_bytes(($self->header()->variables()->table_vport()->begin() - $self->_io()->pos()));
    $self->{vports} = ();
    my $n_vports = $self->header()->variables()->table_vport()->items();
    for (my $i = 0; $i < $n_vports; $i++) {
        push @{$self->{vports}}, CAD::Format::DWG::AC1009::Vport->new($self->{_io}, $self, $self->{_root});
    }
    $self->{crc_vports} = $self->{_io}->read_bytes(($self->header()->variables()->table_appid()->begin() - $self->_io()->pos()));
    $self->{appids} = ();
    my $n_appids = $self->header()->variables()->table_appid()->items();
    for (my $i = 0; $i < $n_appids; $i++) {
        push @{$self->{appids}}, CAD::Format::DWG::AC1009::Appid->new($self->{_io}, $self, $self->{_root});
    }
    $self->{crc_appids} = $self->{_io}->read_bytes(($self->header()->variables()->table_dimstyle()->begin() - $self->_io()->pos()));
    $self->{dimstyles} = ();
    my $n_dimstyles = $self->header()->variables()->table_dimstyle()->items();
    for (my $i = 0; $i < $n_dimstyles; $i++) {
        push @{$self->{dimstyles}}, CAD::Format::DWG::AC1009::Dimstyle->new($self->{_io}, $self, $self->{_root});
    }
    $self->{crc_dimstyles} = $self->{_io}->read_bytes(($self->header()->variables()->table_vx()->begin() - $self->_io()->pos()));
    $self->{vxs} = ();
    my $n_vxs = $self->header()->variables()->table_vx()->items();
    for (my $i = 0; $i < $n_vxs; $i++) {
        push @{$self->{vxs}}, CAD::Format::DWG::AC1009::Vx->new($self->{_io}, $self, $self->{_root});
    }
    $self->{crc_vxs} = $self->{_io}->read_bytes(($self->header()->blocks_start() - $self->_io()->pos()));
    $self->{_raw_block_entities} = $self->{_io}->read_bytes($self->header()->blocks_size());
    my $io__raw_block_entities = IO::KaitaiStruct::Stream->new($self->{_raw_block_entities});
    $self->{block_entities} = CAD::Format::DWG::AC1009::RealEntities->new($io__raw_block_entities, $self, $self->{_root});
    $self->{crc_block_entities} = $self->{_io}->read_bytes(32);
    if (!($self->_io()->is_eof())) {
        $self->{todo} = ();
        while (!$self->{_io}->is_eof()) {
            push @{$self->{todo}}, $self->{_io}->read_bytes_full();
        }
    }
}

sub header {
    my ($self) = @_;
    return $self->{header};
}

sub header_sentinel {
    my ($self) = @_;
    return $self->{header_sentinel};
}

sub entities {
    my ($self) = @_;
    return $self->{entities};
}

sub crc_entities {
    my ($self) = @_;
    return $self->{crc_entities};
}

sub blocks {
    my ($self) = @_;
    return $self->{blocks};
}

sub crc_blocks {
    my ($self) = @_;
    return $self->{crc_blocks};
}

sub layers {
    my ($self) = @_;
    return $self->{layers};
}

sub crc_layers {
    my ($self) = @_;
    return $self->{crc_layers};
}

sub styles {
    my ($self) = @_;
    return $self->{styles};
}

sub crc_styles {
    my ($self) = @_;
    return $self->{crc_styles};
}

sub linetypes {
    my ($self) = @_;
    return $self->{linetypes};
}

sub crc_linetypes {
    my ($self) = @_;
    return $self->{crc_linetypes};
}

sub views {
    my ($self) = @_;
    return $self->{views};
}

sub crc_views {
    my ($self) = @_;
    return $self->{crc_views};
}

sub ucss {
    my ($self) = @_;
    return $self->{ucss};
}

sub crc_ucss {
    my ($self) = @_;
    return $self->{crc_ucss};
}

sub vports {
    my ($self) = @_;
    return $self->{vports};
}

sub crc_vports {
    my ($self) = @_;
    return $self->{crc_vports};
}

sub appids {
    my ($self) = @_;
    return $self->{appids};
}

sub crc_appids {
    my ($self) = @_;
    return $self->{crc_appids};
}

sub dimstyles {
    my ($self) = @_;
    return $self->{dimstyles};
}

sub crc_dimstyles {
    my ($self) = @_;
    return $self->{crc_dimstyles};
}

sub vxs {
    my ($self) = @_;
    return $self->{vxs};
}

sub crc_vxs {
    my ($self) = @_;
    return $self->{crc_vxs};
}

sub block_entities {
    my ($self) = @_;
    return $self->{block_entities};
}

sub crc_block_entities {
    my ($self) = @_;
    return $self->{crc_block_entities};
}

sub todo {
    my ($self) = @_;
    return $self->{todo};
}

sub _raw_entities {
    my ($self) = @_;
    return $self->{_raw_entities};
}

sub _raw_block_entities {
    my ($self) = @_;
    return $self->{_raw_block_entities};
}

########################################################################
package CAD::Format::DWG::AC1009::Eed1040;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{value} = $self->{_io}->read_f8le();
}

sub value {
    my ($self) = @_;
    return $self->{value};
}

########################################################################
package CAD::Format::DWG::AC1009::EntityAttrib;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{entity_mode} = CAD::Format::DWG::AC1009::EntityMode->new($self->{_io}, $self, $self->{_root});
    $self->{entity_size} = $self->{_io}->read_s2le();
    $self->{entity_layer_index} = $self->{_io}->read_s2le();
    $self->{entity_common} = CAD::Format::DWG::AC1009::EntityCommon->new($self->{_io}, $self, $self->{_root});
    if ($self->entity_mode()->has_color()) {
        $self->{entity_color} = $self->{_io}->read_s1();
    }
    if ($self->entity_mode()->has_linetype()) {
        $self->{entity_linetype_index} = $self->{_io}->read_s2le();
    }
    if ($self->entity_mode()->has_thickness()) {
        $self->{entity_thickness} = $self->{_io}->read_f8le();
    }
    if ($self->entity_mode()->has_elevation()) {
        $self->{entity_elevation} = $self->{_io}->read_f8le();
    }
    if ($self->entity_mode()->has_pspace()) {
        $self->{extra_flag} = CAD::Format::DWG::AC1009::ExtraFlag->new($self->{_io}, $self, $self->{_root});
    }
    if ( (($self->entity_mode()->has_pspace()) && ($self->extra_flag()->has_eed())) ) {
        $self->{eed} = CAD::Format::DWG::AC1009::Eed->new($self->{_io}, $self, $self->{_root});
    }
    if ($self->entity_mode()->has_handling()) {
        $self->{len_handling_id} = $self->{_io}->read_u1();
    }
    if ($self->entity_mode()->has_handling()) {
        $self->{handling_id} = $self->{_io}->read_bytes($self->len_handling_id());
    }
    if ( (($self->entity_mode()->has_pspace()) && ($self->extra_flag()->has_viewport())) ) {
        $self->{viewport} = $self->{_io}->read_u2le();
    }
    $self->{point_from} = CAD::Format::DWG::AC1009::Point2d->new($self->{_io}, $self, $self->{_root});
    $self->{height} = $self->{_io}->read_f8le();
    $self->{len_value} = $self->{_io}->read_s2le();
    $self->{value} = Encode::decode("ASCII", IO::KaitaiStruct::Stream::bytes_terminate($self->{_io}->read_bytes($self->len_value()), 0, 0));
    $self->{len_tag} = $self->{_io}->read_s2le();
    $self->{tag} = Encode::decode("ASCII", IO::KaitaiStruct::Stream::bytes_terminate($self->{_io}->read_bytes($self->len_tag()), 0, 0));
    $self->{flags} = CAD::Format::DWG::AC1009::AttrFlags->new($self->{_io}, $self, $self->{_root});
    if ($self->entity_common()->flag2_7()) {
        $self->{rotation_angle_in_radians} = $self->{_io}->read_f8le();
    }
    if ($self->entity_common()->flag2_6()) {
        $self->{width_scale_factor} = $self->{_io}->read_f8le();
    }
    if ($self->entity_common()->flag2_5()) {
        $self->{obliquing_angle_in_radians} = $self->{_io}->read_f8le();
    }
    if ($self->entity_common()->flag2_4()) {
        $self->{text_style_index} = $self->{_io}->read_u1();
    }
    if ($self->entity_common()->flag2_3()) {
        $self->{generation} = CAD::Format::DWG::AC1009::GenerationFlags->new($self->{_io}, $self, $self->{_root});
    }
    if ($self->entity_common()->flag2_2()) {
        $self->{horiz_alignment} = $self->{_io}->read_u1();
    }
    if ($self->entity_common()->flag2_1()) {
        $self->{aligned_to} = CAD::Format::DWG::AC1009::Point2d->new($self->{_io}, $self, $self->{_root});
    }
}

sub entity_mode {
    my ($self) = @_;
    return $self->{entity_mode};
}

sub entity_size {
    my ($self) = @_;
    return $self->{entity_size};
}

sub entity_layer_index {
    my ($self) = @_;
    return $self->{entity_layer_index};
}

sub entity_common {
    my ($self) = @_;
    return $self->{entity_common};
}

sub entity_color {
    my ($self) = @_;
    return $self->{entity_color};
}

sub entity_linetype_index {
    my ($self) = @_;
    return $self->{entity_linetype_index};
}

sub entity_thickness {
    my ($self) = @_;
    return $self->{entity_thickness};
}

sub entity_elevation {
    my ($self) = @_;
    return $self->{entity_elevation};
}

sub extra_flag {
    my ($self) = @_;
    return $self->{extra_flag};
}

sub eed {
    my ($self) = @_;
    return $self->{eed};
}

sub len_handling_id {
    my ($self) = @_;
    return $self->{len_handling_id};
}

sub handling_id {
    my ($self) = @_;
    return $self->{handling_id};
}

sub viewport {
    my ($self) = @_;
    return $self->{viewport};
}

sub point_from {
    my ($self) = @_;
    return $self->{point_from};
}

sub height {
    my ($self) = @_;
    return $self->{height};
}

sub len_value {
    my ($self) = @_;
    return $self->{len_value};
}

sub value {
    my ($self) = @_;
    return $self->{value};
}

sub len_tag {
    my ($self) = @_;
    return $self->{len_tag};
}

sub tag {
    my ($self) = @_;
    return $self->{tag};
}

sub flags {
    my ($self) = @_;
    return $self->{flags};
}

sub rotation_angle_in_radians {
    my ($self) = @_;
    return $self->{rotation_angle_in_radians};
}

sub width_scale_factor {
    my ($self) = @_;
    return $self->{width_scale_factor};
}

sub obliquing_angle_in_radians {
    my ($self) = @_;
    return $self->{obliquing_angle_in_radians};
}

sub text_style_index {
    my ($self) = @_;
    return $self->{text_style_index};
}

sub generation {
    my ($self) = @_;
    return $self->{generation};
}

sub horiz_alignment {
    my ($self) = @_;
    return $self->{horiz_alignment};
}

sub aligned_to {
    my ($self) = @_;
    return $self->{aligned_to};
}

########################################################################
package CAD::Format::DWG::AC1009::LinetypeFlag;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{flag1} = $self->{_io}->read_bits_int_be(1);
    $self->{referenced} = $self->{_io}->read_bits_int_be(1);
    $self->{flag3} = $self->{_io}->read_bits_int_be(1);
    $self->{flag4} = $self->{_io}->read_bits_int_be(1);
    $self->{flag5} = $self->{_io}->read_bits_int_be(1);
    $self->{flag6} = $self->{_io}->read_bits_int_be(1);
    $self->{flag7} = $self->{_io}->read_bits_int_be(1);
    $self->{flag8} = $self->{_io}->read_bits_int_be(1);
}

sub flag1 {
    my ($self) = @_;
    return $self->{flag1};
}

sub referenced {
    my ($self) = @_;
    return $self->{referenced};
}

sub flag3 {
    my ($self) = @_;
    return $self->{flag3};
}

sub flag4 {
    my ($self) = @_;
    return $self->{flag4};
}

sub flag5 {
    my ($self) = @_;
    return $self->{flag5};
}

sub flag6 {
    my ($self) = @_;
    return $self->{flag6};
}

sub flag7 {
    my ($self) = @_;
    return $self->{flag7};
}

sub flag8 {
    my ($self) = @_;
    return $self->{flag8};
}

########################################################################
package CAD::Format::DWG::AC1009::EntityTmp;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{entity_mode} = CAD::Format::DWG::AC1009::EntityMode->new($self->{_io}, $self, $self->{_root});
    $self->{entity_size} = $self->{_io}->read_s2le();
    $self->{entity_layer_index} = $self->{_io}->read_s2le();
    $self->{flag2_1} = $self->{_io}->read_bits_int_be(1);
    $self->{flag2_2} = $self->{_io}->read_bits_int_be(1);
    $self->{flag2_3} = $self->{_io}->read_bits_int_be(1);
    $self->{flag2_4} = $self->{_io}->read_bits_int_be(1);
    $self->{flag2_5} = $self->{_io}->read_bits_int_be(1);
    $self->{flag2_6} = $self->{_io}->read_bits_int_be(1);
    $self->{flag2_7} = $self->{_io}->read_bits_int_be(1);
    $self->{flag2_8} = $self->{_io}->read_bits_int_be(1);
    $self->{flag3_1} = $self->{_io}->read_bits_int_be(1);
    $self->{flag3_2} = $self->{_io}->read_bits_int_be(1);
    $self->{flag3_3} = $self->{_io}->read_bits_int_be(1);
    $self->{flag3_4} = $self->{_io}->read_bits_int_be(1);
    $self->{flag3_5} = $self->{_io}->read_bits_int_be(1);
    $self->{flag3_6} = $self->{_io}->read_bits_int_be(1);
    $self->{flag3_7} = $self->{_io}->read_bits_int_be(1);
    $self->{flag3_8} = $self->{_io}->read_bits_int_be(1);
    $self->{_io}->align_to_byte();
    $self->{xxx} = $self->{_io}->read_bytes(($self->entity_size() - 10));
    $self->{crc16} = $self->{_io}->read_bytes(2);
}

sub entity_mode {
    my ($self) = @_;
    return $self->{entity_mode};
}

sub entity_size {
    my ($self) = @_;
    return $self->{entity_size};
}

sub entity_layer_index {
    my ($self) = @_;
    return $self->{entity_layer_index};
}

sub flag2_1 {
    my ($self) = @_;
    return $self->{flag2_1};
}

sub flag2_2 {
    my ($self) = @_;
    return $self->{flag2_2};
}

sub flag2_3 {
    my ($self) = @_;
    return $self->{flag2_3};
}

sub flag2_4 {
    my ($self) = @_;
    return $self->{flag2_4};
}

sub flag2_5 {
    my ($self) = @_;
    return $self->{flag2_5};
}

sub flag2_6 {
    my ($self) = @_;
    return $self->{flag2_6};
}

sub flag2_7 {
    my ($self) = @_;
    return $self->{flag2_7};
}

sub flag2_8 {
    my ($self) = @_;
    return $self->{flag2_8};
}

sub flag3_1 {
    my ($self) = @_;
    return $self->{flag3_1};
}

sub flag3_2 {
    my ($self) = @_;
    return $self->{flag3_2};
}

sub flag3_3 {
    my ($self) = @_;
    return $self->{flag3_3};
}

sub flag3_4 {
    my ($self) = @_;
    return $self->{flag3_4};
}

sub flag3_5 {
    my ($self) = @_;
    return $self->{flag3_5};
}

sub flag3_6 {
    my ($self) = @_;
    return $self->{flag3_6};
}

sub flag3_7 {
    my ($self) = @_;
    return $self->{flag3_7};
}

sub flag3_8 {
    my ($self) = @_;
    return $self->{flag3_8};
}

sub xxx {
    my ($self) = @_;
    return $self->{xxx};
}

sub crc16 {
    my ($self) = @_;
    return $self->{crc16};
}

########################################################################
package CAD::Format::DWG::AC1009::BlockFlag;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{references_external_reference} = $self->{_io}->read_bits_int_be(1);
    $self->{resolved_external_reference} = $self->{_io}->read_bits_int_be(1);
    $self->{flag3} = $self->{_io}->read_bits_int_be(1);
    $self->{flag4} = $self->{_io}->read_bits_int_be(1);
    $self->{flag5} = $self->{_io}->read_bits_int_be(1);
    $self->{flag6} = $self->{_io}->read_bits_int_be(1);
    $self->{none} = $self->{_io}->read_bits_int_be(1);
    $self->{anonymous} = $self->{_io}->read_bits_int_be(1);
}

sub references_external_reference {
    my ($self) = @_;
    return $self->{references_external_reference};
}

sub resolved_external_reference {
    my ($self) = @_;
    return $self->{resolved_external_reference};
}

sub flag3 {
    my ($self) = @_;
    return $self->{flag3};
}

sub flag4 {
    my ($self) = @_;
    return $self->{flag4};
}

sub flag5 {
    my ($self) = @_;
    return $self->{flag5};
}

sub flag6 {
    my ($self) = @_;
    return $self->{flag6};
}

sub none {
    my ($self) = @_;
    return $self->{none};
}

sub anonymous {
    my ($self) = @_;
    return $self->{anonymous};
}

########################################################################
package CAD::Format::DWG::AC1009::BlockFlag2;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{flag1} = $self->{_io}->read_bits_int_be(1);
    $self->{flag2} = $self->{_io}->read_bits_int_be(1);
    $self->{flag3} = $self->{_io}->read_bits_int_be(1);
    $self->{flag4} = $self->{_io}->read_bits_int_be(1);
    $self->{flag5} = $self->{_io}->read_bits_int_be(1);
    $self->{flag6} = $self->{_io}->read_bits_int_be(1);
    $self->{flag7} = $self->{_io}->read_bits_int_be(1);
    $self->{flag8} = $self->{_io}->read_bits_int_be(1);
}

sub flag1 {
    my ($self) = @_;
    return $self->{flag1};
}

sub flag2 {
    my ($self) = @_;
    return $self->{flag2};
}

sub flag3 {
    my ($self) = @_;
    return $self->{flag3};
}

sub flag4 {
    my ($self) = @_;
    return $self->{flag4};
}

sub flag5 {
    my ($self) = @_;
    return $self->{flag5};
}

sub flag6 {
    my ($self) = @_;
    return $self->{flag6};
}

sub flag7 {
    my ($self) = @_;
    return $self->{flag7};
}

sub flag8 {
    my ($self) = @_;
    return $self->{flag8};
}

########################################################################
package CAD::Format::DWG::AC1009::InvisibleEdgeFlags;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{flag1} = $self->{_io}->read_bits_int_be(1);
    $self->{flag2} = $self->{_io}->read_bits_int_be(1);
    $self->{flag3} = $self->{_io}->read_bits_int_be(1);
    $self->{flag4} = $self->{_io}->read_bits_int_be(1);
    $self->{fourth_edge_is_invisible} = $self->{_io}->read_bits_int_be(1);
    $self->{third_edge_is_invisible} = $self->{_io}->read_bits_int_be(1);
    $self->{second_edge_is_invisible} = $self->{_io}->read_bits_int_be(1);
    $self->{first_edge_is_invisible} = $self->{_io}->read_bits_int_be(1);
    $self->{flag9} = $self->{_io}->read_bits_int_be(1);
    $self->{flag10} = $self->{_io}->read_bits_int_be(1);
    $self->{flag11} = $self->{_io}->read_bits_int_be(1);
    $self->{flag12} = $self->{_io}->read_bits_int_be(1);
    $self->{flag13} = $self->{_io}->read_bits_int_be(1);
    $self->{flag14} = $self->{_io}->read_bits_int_be(1);
    $self->{flag15} = $self->{_io}->read_bits_int_be(1);
    $self->{flag16} = $self->{_io}->read_bits_int_be(1);
}

sub flag1 {
    my ($self) = @_;
    return $self->{flag1};
}

sub flag2 {
    my ($self) = @_;
    return $self->{flag2};
}

sub flag3 {
    my ($self) = @_;
    return $self->{flag3};
}

sub flag4 {
    my ($self) = @_;
    return $self->{flag4};
}

sub fourth_edge_is_invisible {
    my ($self) = @_;
    return $self->{fourth_edge_is_invisible};
}

sub third_edge_is_invisible {
    my ($self) = @_;
    return $self->{third_edge_is_invisible};
}

sub second_edge_is_invisible {
    my ($self) = @_;
    return $self->{second_edge_is_invisible};
}

sub first_edge_is_invisible {
    my ($self) = @_;
    return $self->{first_edge_is_invisible};
}

sub flag9 {
    my ($self) = @_;
    return $self->{flag9};
}

sub flag10 {
    my ($self) = @_;
    return $self->{flag10};
}

sub flag11 {
    my ($self) = @_;
    return $self->{flag11};
}

sub flag12 {
    my ($self) = @_;
    return $self->{flag12};
}

sub flag13 {
    my ($self) = @_;
    return $self->{flag13};
}

sub flag14 {
    my ($self) = @_;
    return $self->{flag14};
}

sub flag15 {
    my ($self) = @_;
    return $self->{flag15};
}

sub flag16 {
    my ($self) = @_;
    return $self->{flag16};
}

########################################################################
package CAD::Format::DWG::AC1009::Pattern;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{pattern1} = $self->{_io}->read_f8le();
    $self->{pattern2} = $self->{_io}->read_f8le();
    $self->{pattern3} = $self->{_io}->read_f8le();
    $self->{pattern4} = $self->{_io}->read_f8le();
    $self->{pattern5} = $self->{_io}->read_f8le();
    $self->{pattern6} = $self->{_io}->read_f8le();
    $self->{pattern7} = $self->{_io}->read_f8le();
    $self->{pattern8} = $self->{_io}->read_f8le();
    $self->{pattern9} = $self->{_io}->read_f8le();
    $self->{pattern10} = $self->{_io}->read_f8le();
    $self->{pattern11} = $self->{_io}->read_f8le();
    $self->{pattern12} = $self->{_io}->read_f8le();
}

sub pattern1 {
    my ($self) = @_;
    return $self->{pattern1};
}

sub pattern2 {
    my ($self) = @_;
    return $self->{pattern2};
}

sub pattern3 {
    my ($self) = @_;
    return $self->{pattern3};
}

sub pattern4 {
    my ($self) = @_;
    return $self->{pattern4};
}

sub pattern5 {
    my ($self) = @_;
    return $self->{pattern5};
}

sub pattern6 {
    my ($self) = @_;
    return $self->{pattern6};
}

sub pattern7 {
    my ($self) = @_;
    return $self->{pattern7};
}

sub pattern8 {
    my ($self) = @_;
    return $self->{pattern8};
}

sub pattern9 {
    my ($self) = @_;
    return $self->{pattern9};
}

sub pattern10 {
    my ($self) = @_;
    return $self->{pattern10};
}

sub pattern11 {
    my ($self) = @_;
    return $self->{pattern11};
}

sub pattern12 {
    my ($self) = @_;
    return $self->{pattern12};
}

########################################################################
package CAD::Format::DWG::AC1009::EntityFace3d;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{entity_mode} = CAD::Format::DWG::AC1009::EntityMode->new($self->{_io}, $self, $self->{_root});
    $self->{entity_size} = $self->{_io}->read_s2le();
    $self->{entity_layer_index} = $self->{_io}->read_s2le();
    $self->{entity_common} = CAD::Format::DWG::AC1009::EntityCommon->new($self->{_io}, $self, $self->{_root});
    if ($self->entity_mode()->has_color()) {
        $self->{entity_color} = $self->{_io}->read_s1();
    }
    if ($self->entity_mode()->has_linetype()) {
        $self->{entity_linetype_index} = $self->{_io}->read_s2le();
    }
    if ($self->entity_mode()->has_thickness()) {
        $self->{entity_thickness} = $self->{_io}->read_f8le();
    }
    if ($self->entity_mode()->has_pspace()) {
        $self->{extra_flag} = CAD::Format::DWG::AC1009::ExtraFlag->new($self->{_io}, $self, $self->{_root});
    }
    if ( (($self->entity_mode()->has_pspace()) && ($self->extra_flag()->has_eed())) ) {
        $self->{eed} = CAD::Format::DWG::AC1009::Eed->new($self->{_io}, $self, $self->{_root});
    }
    if ($self->entity_mode()->has_handling()) {
        $self->{len_handling_id} = $self->{_io}->read_u1();
    }
    if ($self->entity_mode()->has_handling()) {
        $self->{handling_id} = $self->{_io}->read_bytes($self->len_handling_id());
    }
    if ( (($self->entity_mode()->has_pspace()) && ($self->extra_flag()->has_viewport())) ) {
        $self->{viewport} = $self->{_io}->read_u2le();
    }
    $self->{first_point_x} = $self->{_io}->read_f8le();
    $self->{first_point_y} = $self->{_io}->read_f8le();
    if (!($self->entity_mode()->has_elevation())) {
        $self->{first_point_z} = $self->{_io}->read_f8le();
    }
    $self->{second_point_x} = $self->{_io}->read_f8le();
    $self->{second_point_y} = $self->{_io}->read_f8le();
    if (!($self->entity_mode()->has_elevation())) {
        $self->{second_point_z} = $self->{_io}->read_f8le();
    }
    $self->{third_point_x} = $self->{_io}->read_f8le();
    $self->{third_point_y} = $self->{_io}->read_f8le();
    if (!($self->entity_mode()->has_elevation())) {
        $self->{third_point_z} = $self->{_io}->read_f8le();
    }
    $self->{fourth_point_x} = $self->{_io}->read_f8le();
    $self->{fourth_point_y} = $self->{_io}->read_f8le();
    if (!($self->entity_mode()->has_elevation())) {
        $self->{fourth_point_z} = $self->{_io}->read_f8le();
    }
    if ($self->entity_common()->flag2_8()) {
        $self->{invisible_edge_flags} = CAD::Format::DWG::AC1009::InvisibleEdgeFlags->new($self->{_io}, $self, $self->{_root});
    }
    $self->{crc16} = $self->{_io}->read_bytes(2);
}

sub entity_mode {
    my ($self) = @_;
    return $self->{entity_mode};
}

sub entity_size {
    my ($self) = @_;
    return $self->{entity_size};
}

sub entity_layer_index {
    my ($self) = @_;
    return $self->{entity_layer_index};
}

sub entity_common {
    my ($self) = @_;
    return $self->{entity_common};
}

sub entity_color {
    my ($self) = @_;
    return $self->{entity_color};
}

sub entity_linetype_index {
    my ($self) = @_;
    return $self->{entity_linetype_index};
}

sub entity_thickness {
    my ($self) = @_;
    return $self->{entity_thickness};
}

sub extra_flag {
    my ($self) = @_;
    return $self->{extra_flag};
}

sub eed {
    my ($self) = @_;
    return $self->{eed};
}

sub len_handling_id {
    my ($self) = @_;
    return $self->{len_handling_id};
}

sub handling_id {
    my ($self) = @_;
    return $self->{handling_id};
}

sub viewport {
    my ($self) = @_;
    return $self->{viewport};
}

sub first_point_x {
    my ($self) = @_;
    return $self->{first_point_x};
}

sub first_point_y {
    my ($self) = @_;
    return $self->{first_point_y};
}

sub first_point_z {
    my ($self) = @_;
    return $self->{first_point_z};
}

sub second_point_x {
    my ($self) = @_;
    return $self->{second_point_x};
}

sub second_point_y {
    my ($self) = @_;
    return $self->{second_point_y};
}

sub second_point_z {
    my ($self) = @_;
    return $self->{second_point_z};
}

sub third_point_x {
    my ($self) = @_;
    return $self->{third_point_x};
}

sub third_point_y {
    my ($self) = @_;
    return $self->{third_point_y};
}

sub third_point_z {
    my ($self) = @_;
    return $self->{third_point_z};
}

sub fourth_point_x {
    my ($self) = @_;
    return $self->{fourth_point_x};
}

sub fourth_point_y {
    my ($self) = @_;
    return $self->{fourth_point_y};
}

sub fourth_point_z {
    my ($self) = @_;
    return $self->{fourth_point_z};
}

sub invisible_edge_flags {
    my ($self) = @_;
    return $self->{invisible_edge_flags};
}

sub crc16 {
    my ($self) = @_;
    return $self->{crc16};
}

########################################################################
package CAD::Format::DWG::AC1009::EntitySolid;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{entity_mode} = CAD::Format::DWG::AC1009::EntityMode->new($self->{_io}, $self, $self->{_root});
    $self->{entity_size} = $self->{_io}->read_s2le();
    $self->{entity_layer_index} = $self->{_io}->read_s2le();
    $self->{entity_common} = CAD::Format::DWG::AC1009::EntityCommon->new($self->{_io}, $self, $self->{_root});
    if ($self->entity_mode()->has_color()) {
        $self->{entity_color} = $self->{_io}->read_s1();
    }
    if ($self->entity_mode()->has_linetype()) {
        $self->{entity_linetype_index} = $self->{_io}->read_s2le();
    }
    if ($self->entity_mode()->has_thickness()) {
        $self->{entity_thickness} = $self->{_io}->read_f8le();
    }
    if ($self->entity_mode()->has_elevation()) {
        $self->{entity_elevation} = $self->{_io}->read_f8le();
    }
    if ($self->entity_mode()->has_pspace()) {
        $self->{extra_flag} = CAD::Format::DWG::AC1009::ExtraFlag->new($self->{_io}, $self, $self->{_root});
    }
    if ( (($self->entity_mode()->has_pspace()) && ($self->extra_flag()->has_eed())) ) {
        $self->{eed} = CAD::Format::DWG::AC1009::Eed->new($self->{_io}, $self, $self->{_root});
    }
    if ($self->entity_mode()->has_handling()) {
        $self->{len_handling_id} = $self->{_io}->read_u1();
    }
    if ($self->entity_mode()->has_handling()) {
        $self->{handling_id} = $self->{_io}->read_bytes($self->len_handling_id());
    }
    if ( (($self->entity_mode()->has_pspace()) && ($self->extra_flag()->has_viewport())) ) {
        $self->{viewport} = $self->{_io}->read_u2le();
    }
    $self->{from} = CAD::Format::DWG::AC1009::Point2d->new($self->{_io}, $self, $self->{_root});
    $self->{from_and} = CAD::Format::DWG::AC1009::Point2d->new($self->{_io}, $self, $self->{_root});
    $self->{to} = CAD::Format::DWG::AC1009::Point2d->new($self->{_io}, $self, $self->{_root});
    $self->{to_and} = CAD::Format::DWG::AC1009::Point2d->new($self->{_io}, $self, $self->{_root});
    $self->{crc16} = $self->{_io}->read_bytes(2);
}

sub entity_mode {
    my ($self) = @_;
    return $self->{entity_mode};
}

sub entity_size {
    my ($self) = @_;
    return $self->{entity_size};
}

sub entity_layer_index {
    my ($self) = @_;
    return $self->{entity_layer_index};
}

sub entity_common {
    my ($self) = @_;
    return $self->{entity_common};
}

sub entity_color {
    my ($self) = @_;
    return $self->{entity_color};
}

sub entity_linetype_index {
    my ($self) = @_;
    return $self->{entity_linetype_index};
}

sub entity_thickness {
    my ($self) = @_;
    return $self->{entity_thickness};
}

sub entity_elevation {
    my ($self) = @_;
    return $self->{entity_elevation};
}

sub extra_flag {
    my ($self) = @_;
    return $self->{extra_flag};
}

sub eed {
    my ($self) = @_;
    return $self->{eed};
}

sub len_handling_id {
    my ($self) = @_;
    return $self->{len_handling_id};
}

sub handling_id {
    my ($self) = @_;
    return $self->{handling_id};
}

sub viewport {
    my ($self) = @_;
    return $self->{viewport};
}

sub from {
    my ($self) = @_;
    return $self->{from};
}

sub from_and {
    my ($self) = @_;
    return $self->{from_and};
}

sub to {
    my ($self) = @_;
    return $self->{to};
}

sub to_and {
    my ($self) = @_;
    return $self->{to_and};
}

sub crc16 {
    my ($self) = @_;
    return $self->{crc16};
}

########################################################################
package CAD::Format::DWG::AC1009::UnknownDate;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{month} = $self->{_io}->read_u2le();
    $self->{day} = $self->{_io}->read_u2le();
    $self->{year} = $self->{_io}->read_u2le();
    $self->{hour} = $self->{_io}->read_u2le();
    $self->{minute} = $self->{_io}->read_u2le();
    $self->{second} = $self->{_io}->read_u2le();
    $self->{ms} = $self->{_io}->read_u2le();
}

sub month {
    my ($self) = @_;
    return $self->{month};
}

sub day {
    my ($self) = @_;
    return $self->{day};
}

sub year {
    my ($self) = @_;
    return $self->{year};
}

sub hour {
    my ($self) = @_;
    return $self->{hour};
}

sub minute {
    my ($self) = @_;
    return $self->{minute};
}

sub second {
    my ($self) = @_;
    return $self->{second};
}

sub ms {
    my ($self) = @_;
    return $self->{ms};
}

########################################################################
package CAD::Format::DWG::AC1009::EntityInsert;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{entity_mode} = CAD::Format::DWG::AC1009::EntityMode->new($self->{_io}, $self, $self->{_root});
    $self->{entity_size} = $self->{_io}->read_s2le();
    $self->{entity_layer_index} = $self->{_io}->read_s2le();
    $self->{entity_insert_flags} = CAD::Format::DWG::AC1009::EntityInsertFlags->new($self->{_io}, $self, $self->{_root});
    if ($self->entity_mode()->has_color()) {
        $self->{entity_color} = $self->{_io}->read_s1();
    }
    if ($self->entity_mode()->has_linetype()) {
        $self->{entity_linetype_index} = $self->{_io}->read_s2le();
    }
    if ($self->entity_mode()->has_thickness()) {
        $self->{entity_thickness} = $self->{_io}->read_f8le();
    }
    if ($self->entity_mode()->has_elevation()) {
        $self->{entity_elevation} = $self->{_io}->read_f8le();
    }
    if ($self->entity_mode()->has_pspace()) {
        $self->{extra_flag} = CAD::Format::DWG::AC1009::ExtraFlag->new($self->{_io}, $self, $self->{_root});
    }
    if ( (($self->entity_mode()->has_pspace()) && ($self->extra_flag()->has_eed())) ) {
        $self->{eed} = CAD::Format::DWG::AC1009::Eed->new($self->{_io}, $self, $self->{_root});
    }
    if ($self->entity_mode()->has_handling()) {
        $self->{len_handling_id} = $self->{_io}->read_u1();
    }
    if ($self->entity_mode()->has_handling()) {
        $self->{handling_id} = $self->{_io}->read_bytes($self->len_handling_id());
    }
    if ( (($self->entity_mode()->has_pspace()) && ($self->extra_flag()->has_viewport())) ) {
        $self->{viewport} = $self->{_io}->read_u2le();
    }
    $self->{block_index} = $self->{_io}->read_s2le();
    $self->{x} = $self->{_io}->read_f8le();
    $self->{y} = $self->{_io}->read_f8le();
    if ($self->entity_insert_flags()->has_x_scale()) {
        $self->{x_scale} = $self->{_io}->read_f8le();
    }
    if ($self->entity_insert_flags()->has_y_scale()) {
        $self->{y_scale} = $self->{_io}->read_f8le();
    }
    if ($self->entity_insert_flags()->has_rotation()) {
        $self->{rotation_angle_in_radians} = $self->{_io}->read_f8le();
    }
    if ($self->entity_insert_flags()->has_z_scale()) {
        $self->{z_scale} = $self->{_io}->read_f8le();
    }
    if ($self->entity_insert_flags()->has_columns()) {
        $self->{columns} = $self->{_io}->read_u2le();
    }
    if ($self->entity_insert_flags()->has_rows()) {
        $self->{rows} = $self->{_io}->read_u2le();
    }
    if ($self->entity_insert_flags()->has_column_spacing()) {
        $self->{column_spacing} = $self->{_io}->read_f8le();
    }
    if ($self->entity_insert_flags()->has_row_spacing()) {
        $self->{row_spacing} = $self->{_io}->read_f8le();
    }
    if ($self->entity_insert_flags()->has_extrusion()) {
        $self->{extrusion} = CAD::Format::DWG::AC1009::Point3d->new($self->{_io}, $self, $self->{_root});
    }
    $self->{crc16} = $self->{_io}->read_bytes(2);
}

sub entity_mode {
    my ($self) = @_;
    return $self->{entity_mode};
}

sub entity_size {
    my ($self) = @_;
    return $self->{entity_size};
}

sub entity_layer_index {
    my ($self) = @_;
    return $self->{entity_layer_index};
}

sub entity_insert_flags {
    my ($self) = @_;
    return $self->{entity_insert_flags};
}

sub entity_color {
    my ($self) = @_;
    return $self->{entity_color};
}

sub entity_linetype_index {
    my ($self) = @_;
    return $self->{entity_linetype_index};
}

sub entity_thickness {
    my ($self) = @_;
    return $self->{entity_thickness};
}

sub entity_elevation {
    my ($self) = @_;
    return $self->{entity_elevation};
}

sub extra_flag {
    my ($self) = @_;
    return $self->{extra_flag};
}

sub eed {
    my ($self) = @_;
    return $self->{eed};
}

sub len_handling_id {
    my ($self) = @_;
    return $self->{len_handling_id};
}

sub handling_id {
    my ($self) = @_;
    return $self->{handling_id};
}

sub viewport {
    my ($self) = @_;
    return $self->{viewport};
}

sub block_index {
    my ($self) = @_;
    return $self->{block_index};
}

sub x {
    my ($self) = @_;
    return $self->{x};
}

sub y {
    my ($self) = @_;
    return $self->{y};
}

sub x_scale {
    my ($self) = @_;
    return $self->{x_scale};
}

sub y_scale {
    my ($self) = @_;
    return $self->{y_scale};
}

sub rotation_angle_in_radians {
    my ($self) = @_;
    return $self->{rotation_angle_in_radians};
}

sub z_scale {
    my ($self) = @_;
    return $self->{z_scale};
}

sub columns {
    my ($self) = @_;
    return $self->{columns};
}

sub rows {
    my ($self) = @_;
    return $self->{rows};
}

sub column_spacing {
    my ($self) = @_;
    return $self->{column_spacing};
}

sub row_spacing {
    my ($self) = @_;
    return $self->{row_spacing};
}

sub extrusion {
    my ($self) = @_;
    return $self->{extrusion};
}

sub crc16 {
    my ($self) = @_;
    return $self->{crc16};
}

########################################################################
package CAD::Format::DWG::AC1009::VxFlag;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{flag1} = $self->{_io}->read_bits_int_be(1);
    $self->{flag2} = $self->{_io}->read_bits_int_be(1);
    $self->{flag3} = $self->{_io}->read_bits_int_be(1);
    $self->{flag4} = $self->{_io}->read_bits_int_be(1);
    $self->{flag5} = $self->{_io}->read_bits_int_be(1);
    $self->{flag6} = $self->{_io}->read_bits_int_be(1);
    $self->{flag7} = $self->{_io}->read_bits_int_be(1);
    $self->{flag8} = $self->{_io}->read_bits_int_be(1);
}

sub flag1 {
    my ($self) = @_;
    return $self->{flag1};
}

sub flag2 {
    my ($self) = @_;
    return $self->{flag2};
}

sub flag3 {
    my ($self) = @_;
    return $self->{flag3};
}

sub flag4 {
    my ($self) = @_;
    return $self->{flag4};
}

sub flag5 {
    my ($self) = @_;
    return $self->{flag5};
}

sub flag6 {
    my ($self) = @_;
    return $self->{flag6};
}

sub flag7 {
    my ($self) = @_;
    return $self->{flag7};
}

sub flag8 {
    my ($self) = @_;
    return $self->{flag8};
}

########################################################################
package CAD::Format::DWG::AC1009::Style;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{flag} = CAD::Format::DWG::AC1009::StyleFlag->new($self->{_io}, $self, $self->{_root});
    $self->{style_name} = Encode::decode("ASCII", IO::KaitaiStruct::Stream::bytes_terminate($self->{_io}->read_bytes(32), 0, 0));
    $self->{height} = $self->{_io}->read_f8le();
    $self->{width_factor} = $self->{_io}->read_f8le();
    $self->{obliquing_angle_in_radians} = $self->{_io}->read_f8le();
    $self->{generation} = CAD::Format::DWG::AC1009::GenerationFlags->new($self->{_io}, $self, $self->{_root});
    $self->{last_height} = $self->{_io}->read_f8le();
    $self->{font_file} = Encode::decode("ASCII", IO::KaitaiStruct::Stream::bytes_terminate($self->{_io}->read_bytes(64), 0, 0));
    $self->{bigfont_file} = Encode::decode("ASCII", IO::KaitaiStruct::Stream::bytes_terminate($self->{_io}->read_bytes(64), 0, 0));
    $self->{unknown} = $self->{_io}->read_bytes(4);
}

sub flag {
    my ($self) = @_;
    return $self->{flag};
}

sub style_name {
    my ($self) = @_;
    return $self->{style_name};
}

sub height {
    my ($self) = @_;
    return $self->{height};
}

sub width_factor {
    my ($self) = @_;
    return $self->{width_factor};
}

sub obliquing_angle_in_radians {
    my ($self) = @_;
    return $self->{obliquing_angle_in_radians};
}

sub generation {
    my ($self) = @_;
    return $self->{generation};
}

sub last_height {
    my ($self) = @_;
    return $self->{last_height};
}

sub font_file {
    my ($self) = @_;
    return $self->{font_file};
}

sub bigfont_file {
    my ($self) = @_;
    return $self->{bigfont_file};
}

sub unknown {
    my ($self) = @_;
    return $self->{unknown};
}

########################################################################
package CAD::Format::DWG::AC1009::PolylineFlags;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{flag1} = $self->{_io}->read_bits_int_be(1);
    $self->{flag2} = $self->{_io}->read_bits_int_be(1);
    $self->{flag3} = $self->{_io}->read_bits_int_be(1);
    $self->{polygon_mesh_3d} = $self->{_io}->read_bits_int_be(1);
    $self->{polyline_3d} = $self->{_io}->read_bits_int_be(1);
    $self->{spline_fit} = $self->{_io}->read_bits_int_be(1);
    $self->{curve_fit} = $self->{_io}->read_bits_int_be(1);
    $self->{closed} = $self->{_io}->read_bits_int_be(1);
}

sub flag1 {
    my ($self) = @_;
    return $self->{flag1};
}

sub flag2 {
    my ($self) = @_;
    return $self->{flag2};
}

sub flag3 {
    my ($self) = @_;
    return $self->{flag3};
}

sub polygon_mesh_3d {
    my ($self) = @_;
    return $self->{polygon_mesh_3d};
}

sub polyline_3d {
    my ($self) = @_;
    return $self->{polyline_3d};
}

sub spline_fit {
    my ($self) = @_;
    return $self->{spline_fit};
}

sub curve_fit {
    my ($self) = @_;
    return $self->{curve_fit};
}

sub closed {
    my ($self) = @_;
    return $self->{closed};
}

########################################################################
package CAD::Format::DWG::AC1009::AttrFlags;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{flag1} = $self->{_io}->read_bits_int_be(1);
    $self->{flag2} = $self->{_io}->read_bits_int_be(1);
    $self->{flag3} = $self->{_io}->read_bits_int_be(1);
    $self->{flag4} = $self->{_io}->read_bits_int_be(1);
    $self->{flag5} = $self->{_io}->read_bits_int_be(1);
    $self->{verify} = $self->{_io}->read_bits_int_be(1);
    $self->{constant} = $self->{_io}->read_bits_int_be(1);
    $self->{invisible} = $self->{_io}->read_bits_int_be(1);
}

sub flag1 {
    my ($self) = @_;
    return $self->{flag1};
}

sub flag2 {
    my ($self) = @_;
    return $self->{flag2};
}

sub flag3 {
    my ($self) = @_;
    return $self->{flag3};
}

sub flag4 {
    my ($self) = @_;
    return $self->{flag4};
}

sub flag5 {
    my ($self) = @_;
    return $self->{flag5};
}

sub verify {
    my ($self) = @_;
    return $self->{verify};
}

sub constant {
    my ($self) = @_;
    return $self->{constant};
}

sub invisible {
    my ($self) = @_;
    return $self->{invisible};
}

########################################################################
package CAD::Format::DWG::AC1009::Eed1001;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{value} = $self->{_io}->read_u2le();
}

sub value {
    my ($self) = @_;
    return $self->{value};
}

########################################################################
package CAD::Format::DWG::AC1009::EntityCommon;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{flag2_1} = $self->{_io}->read_bits_int_be(1);
    $self->{flag2_2} = $self->{_io}->read_bits_int_be(1);
    $self->{flag2_3} = $self->{_io}->read_bits_int_be(1);
    $self->{flag2_4} = $self->{_io}->read_bits_int_be(1);
    $self->{flag2_5} = $self->{_io}->read_bits_int_be(1);
    $self->{flag2_6} = $self->{_io}->read_bits_int_be(1);
    $self->{flag2_7} = $self->{_io}->read_bits_int_be(1);
    $self->{flag2_8} = $self->{_io}->read_bits_int_be(1);
    $self->{flag3_1} = $self->{_io}->read_bits_int_be(1);
    $self->{flag3_2} = $self->{_io}->read_bits_int_be(1);
    $self->{flag3_3} = $self->{_io}->read_bits_int_be(1);
    $self->{flag3_4} = $self->{_io}->read_bits_int_be(1);
    $self->{flag3_5} = $self->{_io}->read_bits_int_be(1);
    $self->{flag3_6} = $self->{_io}->read_bits_int_be(1);
    $self->{flag3_7} = $self->{_io}->read_bits_int_be(1);
    $self->{flag3_8} = $self->{_io}->read_bits_int_be(1);
}

sub flag2_1 {
    my ($self) = @_;
    return $self->{flag2_1};
}

sub flag2_2 {
    my ($self) = @_;
    return $self->{flag2_2};
}

sub flag2_3 {
    my ($self) = @_;
    return $self->{flag2_3};
}

sub flag2_4 {
    my ($self) = @_;
    return $self->{flag2_4};
}

sub flag2_5 {
    my ($self) = @_;
    return $self->{flag2_5};
}

sub flag2_6 {
    my ($self) = @_;
    return $self->{flag2_6};
}

sub flag2_7 {
    my ($self) = @_;
    return $self->{flag2_7};
}

sub flag2_8 {
    my ($self) = @_;
    return $self->{flag2_8};
}

sub flag3_1 {
    my ($self) = @_;
    return $self->{flag3_1};
}

sub flag3_2 {
    my ($self) = @_;
    return $self->{flag3_2};
}

sub flag3_3 {
    my ($self) = @_;
    return $self->{flag3_3};
}

sub flag3_4 {
    my ($self) = @_;
    return $self->{flag3_4};
}

sub flag3_5 {
    my ($self) = @_;
    return $self->{flag3_5};
}

sub flag3_6 {
    my ($self) = @_;
    return $self->{flag3_6};
}

sub flag3_7 {
    my ($self) = @_;
    return $self->{flag3_7};
}

sub flag3_8 {
    my ($self) = @_;
    return $self->{flag3_8};
}

########################################################################
package CAD::Format::DWG::AC1009::Linetype;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{flag} = CAD::Format::DWG::AC1009::LinetypeFlag->new($self->{_io}, $self, $self->{_root});
    $self->{linetype_name} = Encode::decode("ASCII", IO::KaitaiStruct::Stream::bytes_terminate($self->{_io}->read_bytes(32), 0, 0));
    $self->{used} = $self->{_io}->read_u2le();
    $self->{description} = Encode::decode("ASCII", IO::KaitaiStruct::Stream::bytes_terminate($self->{_io}->read_bytes(48), 0, 0));
    $self->{alignment} = $self->{_io}->read_u1();
    $self->{num_dashes} = $self->{_io}->read_u1();
    $self->{pattern_len} = $self->{_io}->read_f8le();
    $self->{pattern} = CAD::Format::DWG::AC1009::Pattern->new($self->{_io}, $self, $self->{_root});
    $self->{crc16} = $self->{_io}->read_bytes(2);
}

sub flag {
    my ($self) = @_;
    return $self->{flag};
}

sub linetype_name {
    my ($self) = @_;
    return $self->{linetype_name};
}

sub used {
    my ($self) = @_;
    return $self->{used};
}

sub description {
    my ($self) = @_;
    return $self->{description};
}

sub alignment {
    my ($self) = @_;
    return $self->{alignment};
}

sub num_dashes {
    my ($self) = @_;
    return $self->{num_dashes};
}

sub pattern_len {
    my ($self) = @_;
    return $self->{pattern_len};
}

sub pattern {
    my ($self) = @_;
    return $self->{pattern};
}

sub crc16 {
    my ($self) = @_;
    return $self->{crc16};
}

########################################################################
package CAD::Format::DWG::AC1009::StyleFlag;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{flag1} = $self->{_io}->read_bits_int_be(1);
    $self->{flag2} = $self->{_io}->read_bits_int_be(1);
    $self->{flag3} = $self->{_io}->read_bits_int_be(1);
    $self->{flag4} = $self->{_io}->read_bits_int_be(1);
    $self->{flag5} = $self->{_io}->read_bits_int_be(1);
    $self->{vertical} = $self->{_io}->read_bits_int_be(1);
    $self->{flag7} = $self->{_io}->read_bits_int_be(1);
    $self->{load} = $self->{_io}->read_bits_int_be(1);
}

sub flag1 {
    my ($self) = @_;
    return $self->{flag1};
}

sub flag2 {
    my ($self) = @_;
    return $self->{flag2};
}

sub flag3 {
    my ($self) = @_;
    return $self->{flag3};
}

sub flag4 {
    my ($self) = @_;
    return $self->{flag4};
}

sub flag5 {
    my ($self) = @_;
    return $self->{flag5};
}

sub vertical {
    my ($self) = @_;
    return $self->{vertical};
}

sub flag7 {
    my ($self) = @_;
    return $self->{flag7};
}

sub load {
    my ($self) = @_;
    return $self->{load};
}

########################################################################
package CAD::Format::DWG::AC1009::Vx;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{flag} = CAD::Format::DWG::AC1009::VxFlag->new($self->{_io}, $self, $self->{_root});
    $self->{vx_name} = Encode::decode("ASCII", IO::KaitaiStruct::Stream::bytes_terminate($self->{_io}->read_bytes(32), 0, 0));
    $self->{u1} = $self->{_io}->read_bytes(4);
}

sub flag {
    my ($self) = @_;
    return $self->{flag};
}

sub vx_name {
    my ($self) = @_;
    return $self->{vx_name};
}

sub u1 {
    my ($self) = @_;
    return $self->{u1};
}

########################################################################
package CAD::Format::DWG::AC1009::Dimstyle;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{flag} = CAD::Format::DWG::AC1009::DimstyleFlag->new($self->{_io}, $self, $self->{_root});
    $self->{dimstyle_name} = Encode::decode("ASCII", IO::KaitaiStruct::Stream::bytes_terminate($self->{_io}->read_bytes(32), 0, 0));
    $self->{usage} = $self->{_io}->read_s2le();
    $self->{u1} = $self->{_io}->read_f8le();
    $self->{u2} = $self->{_io}->read_f8le();
    $self->{u3} = $self->{_io}->read_f8le();
    $self->{u4} = $self->{_io}->read_f8le();
    $self->{u5} = $self->{_io}->read_f8le();
    $self->{u6} = $self->{_io}->read_bytes(247);
    $self->{crc16} = $self->{_io}->read_bytes(2);
}

sub flag {
    my ($self) = @_;
    return $self->{flag};
}

sub dimstyle_name {
    my ($self) = @_;
    return $self->{dimstyle_name};
}

sub usage {
    my ($self) = @_;
    return $self->{usage};
}

sub u1 {
    my ($self) = @_;
    return $self->{u1};
}

sub u2 {
    my ($self) = @_;
    return $self->{u2};
}

sub u3 {
    my ($self) = @_;
    return $self->{u3};
}

sub u4 {
    my ($self) = @_;
    return $self->{u4};
}

sub u5 {
    my ($self) = @_;
    return $self->{u5};
}

sub u6 {
    my ($self) = @_;
    return $self->{u6};
}

sub crc16 {
    my ($self) = @_;
    return $self->{crc16};
}

########################################################################
package CAD::Format::DWG::AC1009::Point3d;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{x} = $self->{_io}->read_f8le();
    $self->{y} = $self->{_io}->read_f8le();
    $self->{z} = $self->{_io}->read_f8le();
}

sub x {
    my ($self) = @_;
    return $self->{x};
}

sub y {
    my ($self) = @_;
    return $self->{y};
}

sub z {
    my ($self) = @_;
    return $self->{z};
}

########################################################################
package CAD::Format::DWG::AC1009::EntityInsertFlags;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{has_row_spacing} = $self->{_io}->read_bits_int_be(1);
    $self->{has_column_spacing} = $self->{_io}->read_bits_int_be(1);
    $self->{has_rows} = $self->{_io}->read_bits_int_be(1);
    $self->{has_columns} = $self->{_io}->read_bits_int_be(1);
    $self->{has_z_scale} = $self->{_io}->read_bits_int_be(1);
    $self->{has_rotation} = $self->{_io}->read_bits_int_be(1);
    $self->{has_y_scale} = $self->{_io}->read_bits_int_be(1);
    $self->{has_x_scale} = $self->{_io}->read_bits_int_be(1);
    $self->{flag3_1} = $self->{_io}->read_bits_int_be(1);
    $self->{flag3_2} = $self->{_io}->read_bits_int_be(1);
    $self->{flag3_3} = $self->{_io}->read_bits_int_be(1);
    $self->{flag3_4} = $self->{_io}->read_bits_int_be(1);
    $self->{flag3_5} = $self->{_io}->read_bits_int_be(1);
    $self->{flag3_6} = $self->{_io}->read_bits_int_be(1);
    $self->{flag3_7} = $self->{_io}->read_bits_int_be(1);
    $self->{has_extrusion} = $self->{_io}->read_bits_int_be(1);
}

sub has_row_spacing {
    my ($self) = @_;
    return $self->{has_row_spacing};
}

sub has_column_spacing {
    my ($self) = @_;
    return $self->{has_column_spacing};
}

sub has_rows {
    my ($self) = @_;
    return $self->{has_rows};
}

sub has_columns {
    my ($self) = @_;
    return $self->{has_columns};
}

sub has_z_scale {
    my ($self) = @_;
    return $self->{has_z_scale};
}

sub has_rotation {
    my ($self) = @_;
    return $self->{has_rotation};
}

sub has_y_scale {
    my ($self) = @_;
    return $self->{has_y_scale};
}

sub has_x_scale {
    my ($self) = @_;
    return $self->{has_x_scale};
}

sub flag3_1 {
    my ($self) = @_;
    return $self->{flag3_1};
}

sub flag3_2 {
    my ($self) = @_;
    return $self->{flag3_2};
}

sub flag3_3 {
    my ($self) = @_;
    return $self->{flag3_3};
}

sub flag3_4 {
    my ($self) = @_;
    return $self->{flag3_4};
}

sub flag3_5 {
    my ($self) = @_;
    return $self->{flag3_5};
}

sub flag3_6 {
    my ($self) = @_;
    return $self->{flag3_6};
}

sub flag3_7 {
    my ($self) = @_;
    return $self->{flag3_7};
}

sub has_extrusion {
    my ($self) = @_;
    return $self->{has_extrusion};
}

########################################################################
package CAD::Format::DWG::AC1009::Eed1000;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{name_size} = $self->{_io}->read_u1();
    $self->{name} = Encode::decode("ASCII", $self->{_io}->read_bytes($self->name_size()));
}

sub name_size {
    my ($self) = @_;
    return $self->{name_size};
}

sub name {
    my ($self) = @_;
    return $self->{name};
}

########################################################################
package CAD::Format::DWG::AC1009::EntityBlockEnd;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{entity_mode} = CAD::Format::DWG::AC1009::EntityMode->new($self->{_io}, $self, $self->{_root});
    $self->{entity_size} = $self->{_io}->read_s2le();
    $self->{entity_layer_index} = $self->{_io}->read_s2le();
    $self->{entity_common} = CAD::Format::DWG::AC1009::EntityCommon->new($self->{_io}, $self, $self->{_root});
    if ($self->entity_mode()->has_color()) {
        $self->{entity_color} = $self->{_io}->read_s1();
    }
    if ($self->entity_mode()->has_linetype()) {
        $self->{entity_linetype_index} = $self->{_io}->read_s2le();
    }
    if ($self->entity_mode()->has_thickness()) {
        $self->{entity_thickness} = $self->{_io}->read_f8le();
    }
    if ($self->entity_mode()->has_elevation()) {
        $self->{entity_elevation} = $self->{_io}->read_f8le();
    }
    if ($self->entity_mode()->has_pspace()) {
        $self->{extra_flag} = CAD::Format::DWG::AC1009::ExtraFlag->new($self->{_io}, $self, $self->{_root});
    }
    if ( (($self->entity_mode()->has_pspace()) && ($self->extra_flag()->has_eed())) ) {
        $self->{eed} = CAD::Format::DWG::AC1009::Eed->new($self->{_io}, $self, $self->{_root});
    }
    if ($self->entity_mode()->has_handling()) {
        $self->{len_handling_id} = $self->{_io}->read_u1();
    }
    if ($self->entity_mode()->has_handling()) {
        $self->{handling_id} = $self->{_io}->read_bytes($self->len_handling_id());
    }
    if ( (($self->entity_mode()->has_pspace()) && ($self->extra_flag()->has_viewport())) ) {
        $self->{viewport} = $self->{_io}->read_u2le();
    }
    $self->{crc16} = $self->{_io}->read_bytes(2);
}

sub entity_mode {
    my ($self) = @_;
    return $self->{entity_mode};
}

sub entity_size {
    my ($self) = @_;
    return $self->{entity_size};
}

sub entity_layer_index {
    my ($self) = @_;
    return $self->{entity_layer_index};
}

sub entity_common {
    my ($self) = @_;
    return $self->{entity_common};
}

sub entity_color {
    my ($self) = @_;
    return $self->{entity_color};
}

sub entity_linetype_index {
    my ($self) = @_;
    return $self->{entity_linetype_index};
}

sub entity_thickness {
    my ($self) = @_;
    return $self->{entity_thickness};
}

sub entity_elevation {
    my ($self) = @_;
    return $self->{entity_elevation};
}

sub extra_flag {
    my ($self) = @_;
    return $self->{extra_flag};
}

sub eed {
    my ($self) = @_;
    return $self->{eed};
}

sub len_handling_id {
    my ($self) = @_;
    return $self->{len_handling_id};
}

sub handling_id {
    my ($self) = @_;
    return $self->{handling_id};
}

sub viewport {
    my ($self) = @_;
    return $self->{viewport};
}

sub crc16 {
    my ($self) = @_;
    return $self->{crc16};
}

########################################################################
package CAD::Format::DWG::AC1009::EedDetect;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{separator} = $self->{_io}->read_u1();
    my $_on = $self->separator();
    if ($_on == $CAD::Format::DWG::AC1009::EEDS_EED_1010) {
        $self->{data} = CAD::Format::DWG::AC1009::Eed1010->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $CAD::Format::DWG::AC1009::EEDS_EED_1002) {
        $self->{data} = CAD::Format::DWG::AC1009::Eed1002->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $CAD::Format::DWG::AC1009::EEDS_EED_1040) {
        $self->{data} = CAD::Format::DWG::AC1009::Eed1040->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $CAD::Format::DWG::AC1009::EEDS_EED_1000) {
        $self->{data} = CAD::Format::DWG::AC1009::Eed1000->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $CAD::Format::DWG::AC1009::EEDS_EED_1001) {
        $self->{data} = CAD::Format::DWG::AC1009::Eed1001->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $CAD::Format::DWG::AC1009::EEDS_EED_1003) {
        $self->{data} = CAD::Format::DWG::AC1009::Eed1003->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $CAD::Format::DWG::AC1009::EEDS_EED_1005) {
        $self->{data} = CAD::Format::DWG::AC1009::Eed1005->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $CAD::Format::DWG::AC1009::EEDS_EED_1070) {
        $self->{data} = CAD::Format::DWG::AC1009::Eed1070->new($self->{_io}, $self, $self->{_root});
    }
}

sub separator {
    my ($self) = @_;
    return $self->{separator};
}

sub data {
    my ($self) = @_;
    return $self->{data};
}

########################################################################
package CAD::Format::DWG::AC1009::UnknownRepeating;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{unknown_repeating1} = $self->{_io}->read_f8le();
    $self->{unknown_repeating2} = $self->{_io}->read_f8le();
    $self->{unknown_repeating3} = $self->{_io}->read_f8le();
    $self->{unknown_repeating4} = $self->{_io}->read_f8le();
    $self->{unknown_repeating5} = $self->{_io}->read_f8le();
    $self->{unknown_repeating6} = $self->{_io}->read_f8le();
    $self->{unknown_repeating7} = $self->{_io}->read_f8le();
    $self->{unknown_repeating8} = $self->{_io}->read_f8le();
    $self->{unknown_repeating9} = $self->{_io}->read_f8le();
    $self->{unknown_repeating10} = $self->{_io}->read_f8le();
    $self->{unknown_repeating11} = $self->{_io}->read_f8le();
    $self->{unknown_repeating12} = $self->{_io}->read_f8le();
    $self->{unknown_repeating13} = $self->{_io}->read_f8le();
    $self->{unknown_repeating14} = $self->{_io}->read_f8le();
    $self->{unknown_repeating15} = $self->{_io}->read_f8le();
    $self->{unknown_repeating16} = $self->{_io}->read_f8le();
    $self->{unknown_repeating17} = $self->{_io}->read_f8le();
    $self->{unknown_repeating18} = $self->{_io}->read_f8le();
}

sub unknown_repeating1 {
    my ($self) = @_;
    return $self->{unknown_repeating1};
}

sub unknown_repeating2 {
    my ($self) = @_;
    return $self->{unknown_repeating2};
}

sub unknown_repeating3 {
    my ($self) = @_;
    return $self->{unknown_repeating3};
}

sub unknown_repeating4 {
    my ($self) = @_;
    return $self->{unknown_repeating4};
}

sub unknown_repeating5 {
    my ($self) = @_;
    return $self->{unknown_repeating5};
}

sub unknown_repeating6 {
    my ($self) = @_;
    return $self->{unknown_repeating6};
}

sub unknown_repeating7 {
    my ($self) = @_;
    return $self->{unknown_repeating7};
}

sub unknown_repeating8 {
    my ($self) = @_;
    return $self->{unknown_repeating8};
}

sub unknown_repeating9 {
    my ($self) = @_;
    return $self->{unknown_repeating9};
}

sub unknown_repeating10 {
    my ($self) = @_;
    return $self->{unknown_repeating10};
}

sub unknown_repeating11 {
    my ($self) = @_;
    return $self->{unknown_repeating11};
}

sub unknown_repeating12 {
    my ($self) = @_;
    return $self->{unknown_repeating12};
}

sub unknown_repeating13 {
    my ($self) = @_;
    return $self->{unknown_repeating13};
}

sub unknown_repeating14 {
    my ($self) = @_;
    return $self->{unknown_repeating14};
}

sub unknown_repeating15 {
    my ($self) = @_;
    return $self->{unknown_repeating15};
}

sub unknown_repeating16 {
    my ($self) = @_;
    return $self->{unknown_repeating16};
}

sub unknown_repeating17 {
    my ($self) = @_;
    return $self->{unknown_repeating17};
}

sub unknown_repeating18 {
    my ($self) = @_;
    return $self->{unknown_repeating18};
}

########################################################################
package CAD::Format::DWG::AC1009::Point2d;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{x} = $self->{_io}->read_f8le();
    $self->{y} = $self->{_io}->read_f8le();
}

sub x {
    my ($self) = @_;
    return $self->{x};
}

sub y {
    my ($self) = @_;
    return $self->{y};
}

########################################################################
package CAD::Format::DWG::AC1009::Eed1005;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{value} = $self->{_io}->read_bytes(8);
}

sub value {
    my ($self) = @_;
    return $self->{value};
}

########################################################################
package CAD::Format::DWG::AC1009::EntityPoint;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{entity_mode} = CAD::Format::DWG::AC1009::EntityMode->new($self->{_io}, $self, $self->{_root});
    $self->{entity_size} = $self->{_io}->read_s2le();
    $self->{entity_layer_index} = $self->{_io}->read_s2le();
    $self->{entity_common} = CAD::Format::DWG::AC1009::EntityCommon->new($self->{_io}, $self, $self->{_root});
    if ($self->entity_mode()->has_color()) {
        $self->{entity_color} = $self->{_io}->read_s1();
    }
    if ($self->entity_mode()->has_linetype()) {
        $self->{entity_linetype_index} = $self->{_io}->read_s2le();
    }
    if ($self->entity_mode()->has_thickness()) {
        $self->{entity_thickness} = $self->{_io}->read_f8le();
    }
    if ($self->entity_mode()->has_elevation()) {
        $self->{entity_elevation} = $self->{_io}->read_f8le();
    }
    if ($self->entity_mode()->has_pspace()) {
        $self->{extra_flag} = CAD::Format::DWG::AC1009::ExtraFlag->new($self->{_io}, $self, $self->{_root});
    }
    if ( (($self->entity_mode()->has_pspace()) && ($self->extra_flag()->has_eed())) ) {
        $self->{eed} = CAD::Format::DWG::AC1009::Eed->new($self->{_io}, $self, $self->{_root});
    }
    if ($self->entity_mode()->has_handling()) {
        $self->{len_handling_id} = $self->{_io}->read_u1();
    }
    if ($self->entity_mode()->has_handling()) {
        $self->{handling_id} = $self->{_io}->read_bytes($self->len_handling_id());
    }
    if ( (($self->entity_mode()->has_pspace()) && ($self->extra_flag()->has_viewport())) ) {
        $self->{viewport} = $self->{_io}->read_u2le();
    }
    $self->{x} = $self->{_io}->read_f8le();
    $self->{y} = $self->{_io}->read_f8le();
    if ($self->entity_mode()->has_elevation() == 0) {
        $self->{z} = $self->{_io}->read_f8le();
    }
    $self->{crc16} = $self->{_io}->read_bytes(2);
}

sub entity_mode {
    my ($self) = @_;
    return $self->{entity_mode};
}

sub entity_size {
    my ($self) = @_;
    return $self->{entity_size};
}

sub entity_layer_index {
    my ($self) = @_;
    return $self->{entity_layer_index};
}

sub entity_common {
    my ($self) = @_;
    return $self->{entity_common};
}

sub entity_color {
    my ($self) = @_;
    return $self->{entity_color};
}

sub entity_linetype_index {
    my ($self) = @_;
    return $self->{entity_linetype_index};
}

sub entity_thickness {
    my ($self) = @_;
    return $self->{entity_thickness};
}

sub entity_elevation {
    my ($self) = @_;
    return $self->{entity_elevation};
}

sub extra_flag {
    my ($self) = @_;
    return $self->{extra_flag};
}

sub eed {
    my ($self) = @_;
    return $self->{eed};
}

sub len_handling_id {
    my ($self) = @_;
    return $self->{len_handling_id};
}

sub handling_id {
    my ($self) = @_;
    return $self->{handling_id};
}

sub viewport {
    my ($self) = @_;
    return $self->{viewport};
}

sub x {
    my ($self) = @_;
    return $self->{x};
}

sub y {
    my ($self) = @_;
    return $self->{y};
}

sub z {
    my ($self) = @_;
    return $self->{z};
}

sub crc16 {
    my ($self) = @_;
    return $self->{crc16};
}

########################################################################
package CAD::Format::DWG::AC1009::DimstyleFlag;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{flag1} = $self->{_io}->read_bits_int_be(1);
    $self->{flag2} = $self->{_io}->read_bits_int_be(1);
    $self->{flag3} = $self->{_io}->read_bits_int_be(1);
    $self->{flag4} = $self->{_io}->read_bits_int_be(1);
    $self->{flag5} = $self->{_io}->read_bits_int_be(1);
    $self->{flag6} = $self->{_io}->read_bits_int_be(1);
    $self->{flag7} = $self->{_io}->read_bits_int_be(1);
    $self->{flag8} = $self->{_io}->read_bits_int_be(1);
}

sub flag1 {
    my ($self) = @_;
    return $self->{flag1};
}

sub flag2 {
    my ($self) = @_;
    return $self->{flag2};
}

sub flag3 {
    my ($self) = @_;
    return $self->{flag3};
}

sub flag4 {
    my ($self) = @_;
    return $self->{flag4};
}

sub flag5 {
    my ($self) = @_;
    return $self->{flag5};
}

sub flag6 {
    my ($self) = @_;
    return $self->{flag6};
}

sub flag7 {
    my ($self) = @_;
    return $self->{flag7};
}

sub flag8 {
    my ($self) = @_;
    return $self->{flag8};
}

########################################################################
package CAD::Format::DWG::AC1009::AttdefFlags;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{flag_1} = $self->{_io}->read_bits_int_be(1);
    $self->{flag_2} = $self->{_io}->read_bits_int_be(1);
    $self->{flag_3} = $self->{_io}->read_bits_int_be(1);
    $self->{flag_4} = $self->{_io}->read_bits_int_be(1);
    $self->{flag_5} = $self->{_io}->read_bits_int_be(1);
    $self->{invisible} = $self->{_io}->read_bits_int_be(1);
    $self->{constant} = $self->{_io}->read_bits_int_be(1);
    $self->{verify} = $self->{_io}->read_bits_int_be(1);
}

sub flag_1 {
    my ($self) = @_;
    return $self->{flag_1};
}

sub flag_2 {
    my ($self) = @_;
    return $self->{flag_2};
}

sub flag_3 {
    my ($self) = @_;
    return $self->{flag_3};
}

sub flag_4 {
    my ($self) = @_;
    return $self->{flag_4};
}

sub flag_5 {
    my ($self) = @_;
    return $self->{flag_5};
}

sub invisible {
    my ($self) = @_;
    return $self->{invisible};
}

sub constant {
    my ($self) = @_;
    return $self->{constant};
}

sub verify {
    my ($self) = @_;
    return $self->{verify};
}

########################################################################
package CAD::Format::DWG::AC1009::EntityTrace;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{entity_mode} = CAD::Format::DWG::AC1009::EntityMode->new($self->{_io}, $self, $self->{_root});
    $self->{entity_size} = $self->{_io}->read_s2le();
    $self->{entity_layer_index} = $self->{_io}->read_s2le();
    $self->{entity_common} = CAD::Format::DWG::AC1009::EntityCommon->new($self->{_io}, $self, $self->{_root});
    if ($self->entity_mode()->has_color()) {
        $self->{entity_color} = $self->{_io}->read_s1();
    }
    if ($self->entity_mode()->has_linetype()) {
        $self->{entity_linetype_index} = $self->{_io}->read_s2le();
    }
    if ($self->entity_mode()->has_thickness()) {
        $self->{entity_thickness} = $self->{_io}->read_f8le();
    }
    if ($self->entity_mode()->has_elevation()) {
        $self->{entity_elevation} = $self->{_io}->read_f8le();
    }
    if ($self->entity_mode()->has_pspace()) {
        $self->{extra_flag} = CAD::Format::DWG::AC1009::ExtraFlag->new($self->{_io}, $self, $self->{_root});
    }
    if ( (($self->entity_mode()->has_pspace()) && ($self->extra_flag()->has_eed())) ) {
        $self->{eed} = CAD::Format::DWG::AC1009::Eed->new($self->{_io}, $self, $self->{_root});
    }
    if ($self->entity_mode()->has_handling()) {
        $self->{len_handling_id} = $self->{_io}->read_u1();
    }
    if ($self->entity_mode()->has_handling()) {
        $self->{handling_id} = $self->{_io}->read_bytes($self->len_handling_id());
    }
    if ( (($self->entity_mode()->has_pspace()) && ($self->extra_flag()->has_viewport())) ) {
        $self->{viewport} = $self->{_io}->read_u2le();
    }
    $self->{from} = CAD::Format::DWG::AC1009::Point2d->new($self->{_io}, $self, $self->{_root});
    $self->{from_and} = CAD::Format::DWG::AC1009::Point2d->new($self->{_io}, $self, $self->{_root});
    $self->{to} = CAD::Format::DWG::AC1009::Point2d->new($self->{_io}, $self, $self->{_root});
    $self->{to_and} = CAD::Format::DWG::AC1009::Point2d->new($self->{_io}, $self, $self->{_root});
    $self->{crc16} = $self->{_io}->read_bytes(2);
}

sub entity_mode {
    my ($self) = @_;
    return $self->{entity_mode};
}

sub entity_size {
    my ($self) = @_;
    return $self->{entity_size};
}

sub entity_layer_index {
    my ($self) = @_;
    return $self->{entity_layer_index};
}

sub entity_common {
    my ($self) = @_;
    return $self->{entity_common};
}

sub entity_color {
    my ($self) = @_;
    return $self->{entity_color};
}

sub entity_linetype_index {
    my ($self) = @_;
    return $self->{entity_linetype_index};
}

sub entity_thickness {
    my ($self) = @_;
    return $self->{entity_thickness};
}

sub entity_elevation {
    my ($self) = @_;
    return $self->{entity_elevation};
}

sub extra_flag {
    my ($self) = @_;
    return $self->{extra_flag};
}

sub eed {
    my ($self) = @_;
    return $self->{eed};
}

sub len_handling_id {
    my ($self) = @_;
    return $self->{len_handling_id};
}

sub handling_id {
    my ($self) = @_;
    return $self->{handling_id};
}

sub viewport {
    my ($self) = @_;
    return $self->{viewport};
}

sub from {
    my ($self) = @_;
    return $self->{from};
}

sub from_and {
    my ($self) = @_;
    return $self->{from_and};
}

sub to {
    my ($self) = @_;
    return $self->{to};
}

sub to_and {
    my ($self) = @_;
    return $self->{to_and};
}

sub crc16 {
    my ($self) = @_;
    return $self->{crc16};
}

########################################################################
package CAD::Format::DWG::AC1009::Eed1003;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{value} = $self->{_io}->read_u2le();
}

sub value {
    my ($self) = @_;
    return $self->{value};
}

########################################################################
package CAD::Format::DWG::AC1009::Layer;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{flag} = CAD::Format::DWG::AC1009::LayerFlag->new($self->{_io}, $self, $self->{_root});
    $self->{layer_name} = Encode::decode("ASCII", IO::KaitaiStruct::Stream::bytes_terminate($self->{_io}->read_bytes(32), 0, 0));
    $self->{used} = $self->{_io}->read_u2le();
    $self->{color} = $self->{_io}->read_s2le();
    $self->{linetype_index} = $self->{_io}->read_s2le();
    $self->{crc16} = $self->{_io}->read_bytes(2);
}

sub flag {
    my ($self) = @_;
    return $self->{flag};
}

sub layer_name {
    my ($self) = @_;
    return $self->{layer_name};
}

sub used {
    my ($self) = @_;
    return $self->{used};
}

sub color {
    my ($self) = @_;
    return $self->{color};
}

sub linetype_index {
    my ($self) = @_;
    return $self->{linetype_index};
}

sub crc16 {
    my ($self) = @_;
    return $self->{crc16};
}

########################################################################
package CAD::Format::DWG::AC1009::UcsFlag;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{flag1} = $self->{_io}->read_bits_int_be(1);
    $self->{flag2} = $self->{_io}->read_bits_int_be(1);
    $self->{flag3} = $self->{_io}->read_bits_int_be(1);
    $self->{flag4} = $self->{_io}->read_bits_int_be(1);
    $self->{flag5} = $self->{_io}->read_bits_int_be(1);
    $self->{flag6} = $self->{_io}->read_bits_int_be(1);
    $self->{flag7} = $self->{_io}->read_bits_int_be(1);
    $self->{flag8} = $self->{_io}->read_bits_int_be(1);
}

sub flag1 {
    my ($self) = @_;
    return $self->{flag1};
}

sub flag2 {
    my ($self) = @_;
    return $self->{flag2};
}

sub flag3 {
    my ($self) = @_;
    return $self->{flag3};
}

sub flag4 {
    my ($self) = @_;
    return $self->{flag4};
}

sub flag5 {
    my ($self) = @_;
    return $self->{flag5};
}

sub flag6 {
    my ($self) = @_;
    return $self->{flag6};
}

sub flag7 {
    my ($self) = @_;
    return $self->{flag7};
}

sub flag8 {
    my ($self) = @_;
    return $self->{flag8};
}

########################################################################
package CAD::Format::DWG::AC1009::AttdefFlags2;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{flag_1} = $self->{_io}->read_bits_int_be(1);
    $self->{flag_2} = $self->{_io}->read_bits_int_be(1);
    $self->{flag_3} = $self->{_io}->read_bits_int_be(1);
    $self->{flag_4} = $self->{_io}->read_bits_int_be(1);
    $self->{flag_5} = $self->{_io}->read_bits_int_be(1);
    $self->{middle} = $self->{_io}->read_bits_int_be(1);
    $self->{right} = $self->{_io}->read_bits_int_be(1);
    $self->{center} = $self->{_io}->read_bits_int_be(1);
}

sub flag_1 {
    my ($self) = @_;
    return $self->{flag_1};
}

sub flag_2 {
    my ($self) = @_;
    return $self->{flag_2};
}

sub flag_3 {
    my ($self) = @_;
    return $self->{flag_3};
}

sub flag_4 {
    my ($self) = @_;
    return $self->{flag_4};
}

sub flag_5 {
    my ($self) = @_;
    return $self->{flag_5};
}

sub middle {
    my ($self) = @_;
    return $self->{middle};
}

sub right {
    my ($self) = @_;
    return $self->{right};
}

sub center {
    my ($self) = @_;
    return $self->{center};
}

########################################################################
package CAD::Format::DWG::AC1009::Eed1010;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{value} = CAD::Format::DWG::AC1009::Point3d->new($self->{_io}, $self, $self->{_root});
}

sub value {
    my ($self) = @_;
    return $self->{value};
}

########################################################################
package CAD::Format::DWG::AC1009::Block;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{flag} = CAD::Format::DWG::AC1009::BlockFlag->new($self->{_io}, $self, $self->{_root});
    $self->{block_name} = Encode::decode("ASCII", IO::KaitaiStruct::Stream::bytes_terminate($self->{_io}->read_bytes(32), 0, 0));
    $self->{used} = $self->{_io}->read_s2le();
    $self->{begin_address_in_block_table_raw} = $self->{_io}->read_u4le();
    $self->{block_entity} = $self->{_io}->read_s2le();
    $self->{flag2} = CAD::Format::DWG::AC1009::BlockFlag2->new($self->{_io}, $self, $self->{_root});
    $self->{u1} = $self->{_io}->read_s1();
}

sub begin_address_in_block_table_unknown {
    my ($self) = @_;
    return $self->{begin_address_in_block_table_unknown} if ($self->{begin_address_in_block_table_unknown});
    $self->{begin_address_in_block_table_unknown} = (($self->begin_address_in_block_table_raw() & 4278190080) >> 24);
    return $self->{begin_address_in_block_table_unknown};
}

sub begin_address_in_block_table {
    my ($self) = @_;
    return $self->{begin_address_in_block_table} if ($self->{begin_address_in_block_table});
    $self->{begin_address_in_block_table} = ($self->begin_address_in_block_table_raw() & 16777215);
    return $self->{begin_address_in_block_table};
}

sub flag {
    my ($self) = @_;
    return $self->{flag};
}

sub block_name {
    my ($self) = @_;
    return $self->{block_name};
}

sub used {
    my ($self) = @_;
    return $self->{used};
}

sub begin_address_in_block_table_raw {
    my ($self) = @_;
    return $self->{begin_address_in_block_table_raw};
}

sub block_entity {
    my ($self) = @_;
    return $self->{block_entity};
}

sub flag2 {
    my ($self) = @_;
    return $self->{flag2};
}

sub u1 {
    my ($self) = @_;
    return $self->{u1};
}

########################################################################
package CAD::Format::DWG::AC1009::EntityText;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{entity_mode} = CAD::Format::DWG::AC1009::EntityMode->new($self->{_io}, $self, $self->{_root});
    $self->{entity_size} = $self->{_io}->read_s2le();
    $self->{entity_layer_index} = $self->{_io}->read_s2le();
    $self->{entity_common} = CAD::Format::DWG::AC1009::EntityCommon->new($self->{_io}, $self, $self->{_root});
    if ($self->entity_mode()->has_color()) {
        $self->{entity_color} = $self->{_io}->read_s1();
    }
    if ($self->entity_mode()->has_linetype()) {
        $self->{entity_linetype_index} = $self->{_io}->read_s2le();
    }
    if ($self->entity_mode()->has_thickness()) {
        $self->{entity_thickness} = $self->{_io}->read_f8le();
    }
    if ($self->entity_mode()->has_elevation()) {
        $self->{entity_elevation} = $self->{_io}->read_f8le();
    }
    if ($self->entity_mode()->has_pspace()) {
        $self->{extra_flag} = CAD::Format::DWG::AC1009::ExtraFlag->new($self->{_io}, $self, $self->{_root});
    }
    if ( (($self->entity_mode()->has_pspace()) && ($self->extra_flag()->has_eed())) ) {
        $self->{eed} = CAD::Format::DWG::AC1009::Eed->new($self->{_io}, $self, $self->{_root});
    }
    if ($self->entity_mode()->has_handling()) {
        $self->{len_handling_id} = $self->{_io}->read_u1();
    }
    if ($self->entity_mode()->has_handling()) {
        $self->{handling_id} = $self->{_io}->read_bytes($self->len_handling_id());
    }
    if ( (($self->entity_mode()->has_pspace()) && ($self->extra_flag()->has_viewport())) ) {
        $self->{viewport} = $self->{_io}->read_u2le();
    }
    $self->{insert_point} = CAD::Format::DWG::AC1009::Point2d->new($self->{_io}, $self, $self->{_root});
    $self->{height} = $self->{_io}->read_f8le();
    $self->{size} = $self->{_io}->read_s2le();
    $self->{value} = Encode::decode("ASCII", IO::KaitaiStruct::Stream::bytes_terminate($self->{_io}->read_bytes($self->size()), 0, 0));
    if ($self->entity_common()->flag2_8()) {
        $self->{angle} = $self->{_io}->read_f8le();
    }
    if ($self->entity_common()->flag2_7()) {
        $self->{width_factor} = $self->{_io}->read_f8le();
    }
    if ($self->entity_common()->flag2_6()) {
        $self->{obliquing_angle} = $self->{_io}->read_f8le();
    }
    if ($self->entity_common()->flag2_5()) {
        $self->{style_index} = $self->{_io}->read_u1();
    }
    if ($self->entity_common()->flag2_4()) {
        $self->{generation} = CAD::Format::DWG::AC1009::GenerationFlags->new($self->{_io}, $self, $self->{_root});
    }
    if ($self->entity_common()->flag2_3()) {
        $self->{horiz_alignment} = $self->{_io}->read_u1();
    }
    if ($self->entity_common()->flag2_2()) {
        $self->{aligned_to} = CAD::Format::DWG::AC1009::Point2d->new($self->{_io}, $self, $self->{_root});
    }
    if ($self->entity_common()->flag3_8()) {
        $self->{vert_type} = $self->{_io}->read_u1();
    }
    $self->{crc16} = $self->{_io}->read_bytes(2);
}

sub entity_mode {
    my ($self) = @_;
    return $self->{entity_mode};
}

sub entity_size {
    my ($self) = @_;
    return $self->{entity_size};
}

sub entity_layer_index {
    my ($self) = @_;
    return $self->{entity_layer_index};
}

sub entity_common {
    my ($self) = @_;
    return $self->{entity_common};
}

sub entity_color {
    my ($self) = @_;
    return $self->{entity_color};
}

sub entity_linetype_index {
    my ($self) = @_;
    return $self->{entity_linetype_index};
}

sub entity_thickness {
    my ($self) = @_;
    return $self->{entity_thickness};
}

sub entity_elevation {
    my ($self) = @_;
    return $self->{entity_elevation};
}

sub extra_flag {
    my ($self) = @_;
    return $self->{extra_flag};
}

sub eed {
    my ($self) = @_;
    return $self->{eed};
}

sub len_handling_id {
    my ($self) = @_;
    return $self->{len_handling_id};
}

sub handling_id {
    my ($self) = @_;
    return $self->{handling_id};
}

sub viewport {
    my ($self) = @_;
    return $self->{viewport};
}

sub insert_point {
    my ($self) = @_;
    return $self->{insert_point};
}

sub height {
    my ($self) = @_;
    return $self->{height};
}

sub size {
    my ($self) = @_;
    return $self->{size};
}

sub value {
    my ($self) = @_;
    return $self->{value};
}

sub angle {
    my ($self) = @_;
    return $self->{angle};
}

sub width_factor {
    my ($self) = @_;
    return $self->{width_factor};
}

sub obliquing_angle {
    my ($self) = @_;
    return $self->{obliquing_angle};
}

sub style_index {
    my ($self) = @_;
    return $self->{style_index};
}

sub generation {
    my ($self) = @_;
    return $self->{generation};
}

sub horiz_alignment {
    my ($self) = @_;
    return $self->{horiz_alignment};
}

sub aligned_to {
    my ($self) = @_;
    return $self->{aligned_to};
}

sub vert_type {
    my ($self) = @_;
    return $self->{vert_type};
}

sub crc16 {
    my ($self) = @_;
    return $self->{crc16};
}

########################################################################
package CAD::Format::DWG::AC1009::Appid;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{flag} = CAD::Format::DWG::AC1009::AppidFlag->new($self->{_io}, $self, $self->{_root});
    $self->{appid_name} = Encode::decode("ASCII", IO::KaitaiStruct::Stream::bytes_terminate($self->{_io}->read_bytes(32), 0, 0));
    $self->{usage} = $self->{_io}->read_s2le();
    $self->{crc16} = $self->{_io}->read_bytes(2);
}

sub flag {
    my ($self) = @_;
    return $self->{flag};
}

sub appid_name {
    my ($self) = @_;
    return $self->{appid_name};
}

sub usage {
    my ($self) = @_;
    return $self->{usage};
}

sub crc16 {
    my ($self) = @_;
    return $self->{crc16};
}

########################################################################
package CAD::Format::DWG::AC1009::GenerationFlags;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{flag1} = $self->{_io}->read_bits_int_be(1);
    $self->{flag2} = $self->{_io}->read_bits_int_be(1);
    $self->{flag3} = $self->{_io}->read_bits_int_be(1);
    $self->{flag4} = $self->{_io}->read_bits_int_be(1);
    $self->{flag5} = $self->{_io}->read_bits_int_be(1);
    $self->{upside_down} = $self->{_io}->read_bits_int_be(1);
    $self->{backwards} = $self->{_io}->read_bits_int_be(1);
    $self->{flag8} = $self->{_io}->read_bits_int_be(1);
}

sub flag1 {
    my ($self) = @_;
    return $self->{flag1};
}

sub flag2 {
    my ($self) = @_;
    return $self->{flag2};
}

sub flag3 {
    my ($self) = @_;
    return $self->{flag3};
}

sub flag4 {
    my ($self) = @_;
    return $self->{flag4};
}

sub flag5 {
    my ($self) = @_;
    return $self->{flag5};
}

sub upside_down {
    my ($self) = @_;
    return $self->{upside_down};
}

sub backwards {
    my ($self) = @_;
    return $self->{backwards};
}

sub flag8 {
    my ($self) = @_;
    return $self->{flag8};
}

########################################################################
package CAD::Format::DWG::AC1009::EntityAttdef;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{entity_mode} = CAD::Format::DWG::AC1009::EntityMode->new($self->{_io}, $self, $self->{_root});
    $self->{entity_size} = $self->{_io}->read_s2le();
    $self->{entity_layer_index} = $self->{_io}->read_s2le();
    $self->{entity_common} = CAD::Format::DWG::AC1009::EntityCommon->new($self->{_io}, $self, $self->{_root});
    if ($self->entity_mode()->has_color()) {
        $self->{entity_color} = $self->{_io}->read_s1();
    }
    if ($self->entity_mode()->has_linetype()) {
        $self->{entity_linetype_index} = $self->{_io}->read_s2le();
    }
    if ($self->entity_mode()->has_thickness()) {
        $self->{entity_thickness} = $self->{_io}->read_f8le();
    }
    if ($self->entity_mode()->has_elevation()) {
        $self->{entity_elevation} = $self->{_io}->read_f8le();
    }
    if ($self->entity_mode()->has_pspace()) {
        $self->{extra_flag} = CAD::Format::DWG::AC1009::ExtraFlag->new($self->{_io}, $self, $self->{_root});
    }
    if ( (($self->entity_mode()->has_pspace()) && ($self->extra_flag()->has_eed())) ) {
        $self->{eed} = CAD::Format::DWG::AC1009::Eed->new($self->{_io}, $self, $self->{_root});
    }
    if ($self->entity_mode()->has_handling()) {
        $self->{len_handling_id} = $self->{_io}->read_u1();
    }
    if ($self->entity_mode()->has_handling()) {
        $self->{handling_id} = $self->{_io}->read_bytes($self->len_handling_id());
    }
    if ( (($self->entity_mode()->has_pspace()) && ($self->extra_flag()->has_viewport())) ) {
        $self->{viewport} = $self->{_io}->read_u2le();
    }
    $self->{start_point} = CAD::Format::DWG::AC1009::Point2d->new($self->{_io}, $self, $self->{_root});
    $self->{height} = $self->{_io}->read_f8le();
    $self->{default_size} = $self->{_io}->read_s2le();
    $self->{default} = Encode::decode("ASCII", IO::KaitaiStruct::Stream::bytes_terminate($self->{_io}->read_bytes($self->default_size()), 0, 0));
    $self->{prompt_size} = $self->{_io}->read_s2le();
    $self->{prompt} = Encode::decode("ASCII", IO::KaitaiStruct::Stream::bytes_terminate($self->{_io}->read_bytes($self->prompt_size()), 0, 0));
    $self->{tag_size} = $self->{_io}->read_s2le();
    $self->{tag} = Encode::decode("ASCII", IO::KaitaiStruct::Stream::bytes_terminate($self->{_io}->read_bytes($self->tag_size()), 0, 0));
    $self->{flags} = CAD::Format::DWG::AC1009::AttdefFlags->new($self->{_io}, $self, $self->{_root});
    if ($self->entity_common()->flag2_7()) {
        $self->{rotation_angle_in_radians} = $self->{_io}->read_f8le();
    }
    if ($self->entity_common()->flag2_6()) {
        $self->{width_scale_factor} = $self->{_io}->read_f8le();
    }
    if ($self->entity_common()->flag2_5()) {
        $self->{obliquing_angle_in_radians} = $self->{_io}->read_f8le();
    }
    if ($self->entity_common()->flag2_4()) {
        $self->{text_style_index} = $self->{_io}->read_u1();
    }
    if ($self->entity_common()->flag2_3()) {
        $self->{generation} = CAD::Format::DWG::AC1009::GenerationFlags->new($self->{_io}, $self, $self->{_root});
    }
    if ($self->entity_common()->flag2_2()) {
        $self->{horiz_alignment} = $self->{_io}->read_u1();
    }
    if ($self->entity_common()->flag2_1()) {
        $self->{end_point} = CAD::Format::DWG::AC1009::Point2d->new($self->{_io}, $self, $self->{_root});
    }
    $self->{crc16} = $self->{_io}->read_bytes(2);
}

sub entity_mode {
    my ($self) = @_;
    return $self->{entity_mode};
}

sub entity_size {
    my ($self) = @_;
    return $self->{entity_size};
}

sub entity_layer_index {
    my ($self) = @_;
    return $self->{entity_layer_index};
}

sub entity_common {
    my ($self) = @_;
    return $self->{entity_common};
}

sub entity_color {
    my ($self) = @_;
    return $self->{entity_color};
}

sub entity_linetype_index {
    my ($self) = @_;
    return $self->{entity_linetype_index};
}

sub entity_thickness {
    my ($self) = @_;
    return $self->{entity_thickness};
}

sub entity_elevation {
    my ($self) = @_;
    return $self->{entity_elevation};
}

sub extra_flag {
    my ($self) = @_;
    return $self->{extra_flag};
}

sub eed {
    my ($self) = @_;
    return $self->{eed};
}

sub len_handling_id {
    my ($self) = @_;
    return $self->{len_handling_id};
}

sub handling_id {
    my ($self) = @_;
    return $self->{handling_id};
}

sub viewport {
    my ($self) = @_;
    return $self->{viewport};
}

sub start_point {
    my ($self) = @_;
    return $self->{start_point};
}

sub height {
    my ($self) = @_;
    return $self->{height};
}

sub default_size {
    my ($self) = @_;
    return $self->{default_size};
}

sub default {
    my ($self) = @_;
    return $self->{default};
}

sub prompt_size {
    my ($self) = @_;
    return $self->{prompt_size};
}

sub prompt {
    my ($self) = @_;
    return $self->{prompt};
}

sub tag_size {
    my ($self) = @_;
    return $self->{tag_size};
}

sub tag {
    my ($self) = @_;
    return $self->{tag};
}

sub flags {
    my ($self) = @_;
    return $self->{flags};
}

sub rotation_angle_in_radians {
    my ($self) = @_;
    return $self->{rotation_angle_in_radians};
}

sub width_scale_factor {
    my ($self) = @_;
    return $self->{width_scale_factor};
}

sub obliquing_angle_in_radians {
    my ($self) = @_;
    return $self->{obliquing_angle_in_radians};
}

sub text_style_index {
    my ($self) = @_;
    return $self->{text_style_index};
}

sub generation {
    my ($self) = @_;
    return $self->{generation};
}

sub horiz_alignment {
    my ($self) = @_;
    return $self->{horiz_alignment};
}

sub end_point {
    my ($self) = @_;
    return $self->{end_point};
}

sub crc16 {
    my ($self) = @_;
    return $self->{crc16};
}

########################################################################
package CAD::Format::DWG::AC1009::EntityBlockBegin;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{entity_mode} = CAD::Format::DWG::AC1009::EntityMode->new($self->{_io}, $self, $self->{_root});
    $self->{entity_size} = $self->{_io}->read_s2le();
    $self->{entity_layer_index} = $self->{_io}->read_s2le();
    $self->{entity_common} = CAD::Format::DWG::AC1009::EntityCommon->new($self->{_io}, $self, $self->{_root});
    if ($self->entity_mode()->has_color()) {
        $self->{entity_color} = $self->{_io}->read_s1();
    }
    if ($self->entity_mode()->has_linetype()) {
        $self->{entity_linetype_index} = $self->{_io}->read_s2le();
    }
    if ($self->entity_mode()->has_thickness()) {
        $self->{entity_thickness} = $self->{_io}->read_f8le();
    }
    if ($self->entity_mode()->has_elevation()) {
        $self->{entity_elevation} = $self->{_io}->read_f8le();
    }
    if ($self->entity_mode()->has_pspace()) {
        $self->{extra_flag} = CAD::Format::DWG::AC1009::ExtraFlag->new($self->{_io}, $self, $self->{_root});
    }
    if ( (($self->entity_mode()->has_pspace()) && ($self->extra_flag()->has_eed())) ) {
        $self->{eed} = CAD::Format::DWG::AC1009::Eed->new($self->{_io}, $self, $self->{_root});
    }
    if ($self->entity_mode()->has_handling()) {
        $self->{len_handling_id} = $self->{_io}->read_u1();
    }
    if ($self->entity_mode()->has_handling()) {
        $self->{handling_id} = $self->{_io}->read_bytes($self->len_handling_id());
    }
    if ( (($self->entity_mode()->has_pspace()) && ($self->extra_flag()->has_viewport())) ) {
        $self->{viewport} = $self->{_io}->read_u2le();
    }
    $self->{insert_point} = CAD::Format::DWG::AC1009::Point2d->new($self->{_io}, $self, $self->{_root});
    if ($self->entity_common()->flag2_6()) {
        $self->{ref_size} = $self->{_io}->read_u2le();
    }
    if ($self->entity_common()->flag2_6()) {
        $self->{ref} = Encode::decode("ASCII", $self->{_io}->read_bytes($self->ref_size()));
    }
    if ($self->entity_common()->flag2_6()) {
        $self->{ref2_size} = $self->{_io}->read_u2le();
    }
    if ($self->entity_common()->flag2_6()) {
        $self->{ref2} = Encode::decode("ASCII", $self->{_io}->read_bytes($self->ref2_size()));
    }
    $self->{crc16} = $self->{_io}->read_bytes(2);
}

sub entity_mode {
    my ($self) = @_;
    return $self->{entity_mode};
}

sub entity_size {
    my ($self) = @_;
    return $self->{entity_size};
}

sub entity_layer_index {
    my ($self) = @_;
    return $self->{entity_layer_index};
}

sub entity_common {
    my ($self) = @_;
    return $self->{entity_common};
}

sub entity_color {
    my ($self) = @_;
    return $self->{entity_color};
}

sub entity_linetype_index {
    my ($self) = @_;
    return $self->{entity_linetype_index};
}

sub entity_thickness {
    my ($self) = @_;
    return $self->{entity_thickness};
}

sub entity_elevation {
    my ($self) = @_;
    return $self->{entity_elevation};
}

sub extra_flag {
    my ($self) = @_;
    return $self->{extra_flag};
}

sub eed {
    my ($self) = @_;
    return $self->{eed};
}

sub len_handling_id {
    my ($self) = @_;
    return $self->{len_handling_id};
}

sub handling_id {
    my ($self) = @_;
    return $self->{handling_id};
}

sub viewport {
    my ($self) = @_;
    return $self->{viewport};
}

sub insert_point {
    my ($self) = @_;
    return $self->{insert_point};
}

sub ref_size {
    my ($self) = @_;
    return $self->{ref_size};
}

sub ref {
    my ($self) = @_;
    return $self->{ref};
}

sub ref2_size {
    my ($self) = @_;
    return $self->{ref2_size};
}

sub ref2 {
    my ($self) = @_;
    return $self->{ref2};
}

sub crc16 {
    my ($self) = @_;
    return $self->{crc16};
}

########################################################################
package CAD::Format::DWG::AC1009::EntityVport;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{entity_mode} = CAD::Format::DWG::AC1009::EntityMode->new($self->{_io}, $self, $self->{_root});
    $self->{entity_size} = $self->{_io}->read_s2le();
    $self->{entity_layer_index} = $self->{_io}->read_s2le();
    $self->{entity_common} = CAD::Format::DWG::AC1009::EntityCommon->new($self->{_io}, $self, $self->{_root});
    if ($self->entity_mode()->has_color()) {
        $self->{entity_color} = $self->{_io}->read_s1();
    }
    if ($self->entity_mode()->has_linetype()) {
        $self->{entity_linetype_index} = $self->{_io}->read_s2le();
    }
    if ($self->entity_mode()->has_thickness()) {
        $self->{entity_thickness} = $self->{_io}->read_f8le();
    }
    if ($self->entity_mode()->has_elevation()) {
        $self->{entity_elevation} = $self->{_io}->read_f8le();
    }
    if ($self->entity_mode()->has_pspace()) {
        $self->{extra_flag} = CAD::Format::DWG::AC1009::ExtraFlag->new($self->{_io}, $self, $self->{_root});
    }
    if ( (($self->entity_mode()->has_pspace()) && ($self->extra_flag()->has_eed())) ) {
        $self->{eed} = CAD::Format::DWG::AC1009::Eed->new($self->{_io}, $self, $self->{_root});
    }
    if ($self->entity_mode()->has_handling()) {
        $self->{len_handling_id} = $self->{_io}->read_u1();
    }
    if ($self->entity_mode()->has_handling()) {
        $self->{handling_id} = $self->{_io}->read_bytes($self->len_handling_id());
    }
    if ( (($self->entity_mode()->has_pspace()) && ($self->extra_flag()->has_viewport())) ) {
        $self->{viewport} = $self->{_io}->read_u2le();
    }
    $self->{x} = $self->{_io}->read_f8le();
    $self->{y} = $self->{_io}->read_f8le();
    $self->{z} = $self->{_io}->read_f8le();
    $self->{width} = $self->{_io}->read_f8le();
    $self->{height} = $self->{_io}->read_f8le();
    $self->{id} = $self->{_io}->read_s2le();
    $self->{crc16} = $self->{_io}->read_bytes(2);
}

sub entity_mode {
    my ($self) = @_;
    return $self->{entity_mode};
}

sub entity_size {
    my ($self) = @_;
    return $self->{entity_size};
}

sub entity_layer_index {
    my ($self) = @_;
    return $self->{entity_layer_index};
}

sub entity_common {
    my ($self) = @_;
    return $self->{entity_common};
}

sub entity_color {
    my ($self) = @_;
    return $self->{entity_color};
}

sub entity_linetype_index {
    my ($self) = @_;
    return $self->{entity_linetype_index};
}

sub entity_thickness {
    my ($self) = @_;
    return $self->{entity_thickness};
}

sub entity_elevation {
    my ($self) = @_;
    return $self->{entity_elevation};
}

sub extra_flag {
    my ($self) = @_;
    return $self->{extra_flag};
}

sub eed {
    my ($self) = @_;
    return $self->{eed};
}

sub len_handling_id {
    my ($self) = @_;
    return $self->{len_handling_id};
}

sub handling_id {
    my ($self) = @_;
    return $self->{handling_id};
}

sub viewport {
    my ($self) = @_;
    return $self->{viewport};
}

sub x {
    my ($self) = @_;
    return $self->{x};
}

sub y {
    my ($self) = @_;
    return $self->{y};
}

sub z {
    my ($self) = @_;
    return $self->{z};
}

sub width {
    my ($self) = @_;
    return $self->{width};
}

sub height {
    my ($self) = @_;
    return $self->{height};
}

sub id {
    my ($self) = @_;
    return $self->{id};
}

sub crc16 {
    my ($self) = @_;
    return $self->{crc16};
}

########################################################################
package CAD::Format::DWG::AC1009::EntityDim;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{entity_mode} = CAD::Format::DWG::AC1009::EntityMode->new($self->{_io}, $self, $self->{_root});
    $self->{entity_size} = $self->{_io}->read_s2le();
    $self->{entity_layer_index} = $self->{_io}->read_s2le();
    $self->{entity_common} = CAD::Format::DWG::AC1009::EntityCommon->new($self->{_io}, $self, $self->{_root});
    if ($self->entity_mode()->has_color()) {
        $self->{entity_color} = $self->{_io}->read_s1();
    }
    if ($self->entity_mode()->has_linetype()) {
        $self->{entity_linetype_index} = $self->{_io}->read_s2le();
    }
    if ($self->entity_mode()->has_thickness()) {
        $self->{entity_thickness} = $self->{_io}->read_f8le();
    }
    if ($self->entity_mode()->has_elevation()) {
        $self->{entity_elevation} = $self->{_io}->read_f8le();
    }
    if ($self->entity_mode()->has_pspace()) {
        $self->{extra_flag} = CAD::Format::DWG::AC1009::ExtraFlag->new($self->{_io}, $self, $self->{_root});
    }
    if ( (($self->entity_mode()->has_pspace()) && ($self->extra_flag()->has_eed())) ) {
        $self->{eed} = CAD::Format::DWG::AC1009::Eed->new($self->{_io}, $self, $self->{_root});
    }
    if ($self->entity_mode()->has_handling()) {
        $self->{len_handling_id} = $self->{_io}->read_u1();
    }
    if ($self->entity_mode()->has_handling()) {
        $self->{handling_id} = $self->{_io}->read_bytes($self->len_handling_id());
    }
    if ( (($self->entity_mode()->has_pspace()) && ($self->extra_flag()->has_viewport())) ) {
        $self->{viewport} = $self->{_io}->read_u2le();
    }
    $self->{block_index} = $self->{_io}->read_s2le();
    $self->{dimension_line_defining_point} = CAD::Format::DWG::AC1009::Point2d->new($self->{_io}, $self, $self->{_root});
    if ($self->entity_mode()->has_elevation() == 0) {
        $self->{dimension_line_defining_point_z} = $self->{_io}->read_f8le();
    }
    $self->{default_text_position} = CAD::Format::DWG::AC1009::Point2d->new($self->{_io}, $self, $self->{_root});
    if ($self->entity_common()->flag2_8()) {
        $self->{clone_ins_pt} = CAD::Format::DWG::AC1009::Point2d->new($self->{_io}, $self, $self->{_root});
    }
    if ($self->entity_common()->flag2_7()) {
        $self->{dim_type} = CAD::Format::DWG::AC1009::DimType->new($self->{_io}, $self, $self->{_root});
    }
    if ($self->entity_common()->flag2_6()) {
        $self->{len_text} = $self->{_io}->read_s2le();
    }
    if ($self->entity_common()->flag2_6()) {
        $self->{text} = $self->{_io}->read_bytes($self->len_text());
    }
    if ($self->entity_common()->flag2_5()) {
        $self->{extension_defining_point1} = CAD::Format::DWG::AC1009::Point2d->new($self->{_io}, $self, $self->{_root});
    }
    if ( (($self->entity_mode()->has_elevation() == 0) && ($self->entity_common()->flag2_5())) ) {
        $self->{extension_defining_point1_z} = $self->{_io}->read_f8le();
    }
    if ($self->entity_common()->flag2_4()) {
        $self->{extension_defining_point2} = CAD::Format::DWG::AC1009::Point2d->new($self->{_io}, $self, $self->{_root});
    }
    if ( (($self->entity_mode()->has_elevation() == 0) && ($self->entity_common()->flag2_4())) ) {
        $self->{extension_defining_point2_z} = $self->{_io}->read_f8le();
    }
    if ($self->entity_common()->flag2_3()) {
        $self->{defining_point} = CAD::Format::DWG::AC1009::Point2d->new($self->{_io}, $self, $self->{_root});
    }
    if ( (($self->entity_mode()->has_elevation() == 0) && ($self->entity_common()->flag2_3())) ) {
        $self->{defining_point_z} = $self->{_io}->read_f8le();
    }
    if ($self->entity_common()->flag2_2()) {
        $self->{dimension_line_arc_definition_point} = CAD::Format::DWG::AC1009::Point2d->new($self->{_io}, $self, $self->{_root});
    }
    if ($self->entity_common()->flag2_1()) {
        $self->{leader_length} = CAD::Format::DWG::AC1009::Point2d->new($self->{_io}, $self, $self->{_root});
    }
    if ( (($self->entity_mode()->has_elevation() == 0) && ($self->entity_common()->flag2_1())) ) {
        $self->{leader_length_z} = $self->{_io}->read_f8le();
    }
    if ($self->entity_common()->flag3_8()) {
        $self->{rotation_in_radians} = $self->{_io}->read_f8le();
    }
    if ($self->entity_common()->flag3_6()) {
        $self->{text_rotation_in_radians} = $self->{_io}->read_f8le();
    }
    if ($self->entity_common()->flag3_1()) {
        $self->{dimstyle} = $self->{_io}->read_u2le();
    }
    $self->{crc16} = $self->{_io}->read_bytes(2);
}

sub entity_mode {
    my ($self) = @_;
    return $self->{entity_mode};
}

sub entity_size {
    my ($self) = @_;
    return $self->{entity_size};
}

sub entity_layer_index {
    my ($self) = @_;
    return $self->{entity_layer_index};
}

sub entity_common {
    my ($self) = @_;
    return $self->{entity_common};
}

sub entity_color {
    my ($self) = @_;
    return $self->{entity_color};
}

sub entity_linetype_index {
    my ($self) = @_;
    return $self->{entity_linetype_index};
}

sub entity_thickness {
    my ($self) = @_;
    return $self->{entity_thickness};
}

sub entity_elevation {
    my ($self) = @_;
    return $self->{entity_elevation};
}

sub extra_flag {
    my ($self) = @_;
    return $self->{extra_flag};
}

sub eed {
    my ($self) = @_;
    return $self->{eed};
}

sub len_handling_id {
    my ($self) = @_;
    return $self->{len_handling_id};
}

sub handling_id {
    my ($self) = @_;
    return $self->{handling_id};
}

sub viewport {
    my ($self) = @_;
    return $self->{viewport};
}

sub block_index {
    my ($self) = @_;
    return $self->{block_index};
}

sub dimension_line_defining_point {
    my ($self) = @_;
    return $self->{dimension_line_defining_point};
}

sub dimension_line_defining_point_z {
    my ($self) = @_;
    return $self->{dimension_line_defining_point_z};
}

sub default_text_position {
    my ($self) = @_;
    return $self->{default_text_position};
}

sub clone_ins_pt {
    my ($self) = @_;
    return $self->{clone_ins_pt};
}

sub dim_type {
    my ($self) = @_;
    return $self->{dim_type};
}

sub len_text {
    my ($self) = @_;
    return $self->{len_text};
}

sub text {
    my ($self) = @_;
    return $self->{text};
}

sub extension_defining_point1 {
    my ($self) = @_;
    return $self->{extension_defining_point1};
}

sub extension_defining_point1_z {
    my ($self) = @_;
    return $self->{extension_defining_point1_z};
}

sub extension_defining_point2 {
    my ($self) = @_;
    return $self->{extension_defining_point2};
}

sub extension_defining_point2_z {
    my ($self) = @_;
    return $self->{extension_defining_point2_z};
}

sub defining_point {
    my ($self) = @_;
    return $self->{defining_point};
}

sub defining_point_z {
    my ($self) = @_;
    return $self->{defining_point_z};
}

sub dimension_line_arc_definition_point {
    my ($self) = @_;
    return $self->{dimension_line_arc_definition_point};
}

sub leader_length {
    my ($self) = @_;
    return $self->{leader_length};
}

sub leader_length_z {
    my ($self) = @_;
    return $self->{leader_length_z};
}

sub rotation_in_radians {
    my ($self) = @_;
    return $self->{rotation_in_radians};
}

sub text_rotation_in_radians {
    my ($self) = @_;
    return $self->{text_rotation_in_radians};
}

sub dimstyle {
    my ($self) = @_;
    return $self->{dimstyle};
}

sub crc16 {
    my ($self) = @_;
    return $self->{crc16};
}

########################################################################
package CAD::Format::DWG::AC1009::VertexExtraFlag;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{flag_1} = $self->{_io}->read_bits_int_be(1);
    $self->{flag_2} = $self->{_io}->read_bits_int_be(1);
    $self->{flag_3} = $self->{_io}->read_bits_int_be(1);
    $self->{flag_4} = $self->{_io}->read_bits_int_be(1);
    $self->{flag_5} = $self->{_io}->read_bits_int_be(1);
    $self->{flag_6} = $self->{_io}->read_bits_int_be(1);
    $self->{flag_7} = $self->{_io}->read_bits_int_be(1);
    $self->{extra_vertex} = $self->{_io}->read_bits_int_be(1);
}

sub flag_1 {
    my ($self) = @_;
    return $self->{flag_1};
}

sub flag_2 {
    my ($self) = @_;
    return $self->{flag_2};
}

sub flag_3 {
    my ($self) = @_;
    return $self->{flag_3};
}

sub flag_4 {
    my ($self) = @_;
    return $self->{flag_4};
}

sub flag_5 {
    my ($self) = @_;
    return $self->{flag_5};
}

sub flag_6 {
    my ($self) = @_;
    return $self->{flag_6};
}

sub flag_7 {
    my ($self) = @_;
    return $self->{flag_7};
}

sub extra_vertex {
    my ($self) = @_;
    return $self->{extra_vertex};
}

########################################################################
package CAD::Format::DWG::AC1009::HeaderVariables;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{insertion_base} = CAD::Format::DWG::AC1009::Point3d->new($self->{_io}, $self, $self->{_root});
    $self->{plinegen} = $self->{_io}->read_s2le();
    $self->{drawing_first} = CAD::Format::DWG::AC1009::Point3d->new($self->{_io}, $self, $self->{_root});
    $self->{drawing_second} = CAD::Format::DWG::AC1009::Point3d->new($self->{_io}, $self, $self->{_root});
    $self->{limits_min} = CAD::Format::DWG::AC1009::Point2d->new($self->{_io}, $self, $self->{_root});
    $self->{limits_max} = CAD::Format::DWG::AC1009::Point2d->new($self->{_io}, $self, $self->{_root});
    $self->{view_ctrl} = CAD::Format::DWG::AC1009::Point3d->new($self->{_io}, $self, $self->{_root});
    $self->{view_size} = $self->{_io}->read_f8le();
    $self->{snap} = $self->{_io}->read_s2le();
    $self->{snap_resolution} = CAD::Format::DWG::AC1009::Point2d->new($self->{_io}, $self, $self->{_root});
    $self->{snap_base} = CAD::Format::DWG::AC1009::Point2d->new($self->{_io}, $self, $self->{_root});
    $self->{snap_angle} = $self->{_io}->read_f8le();
    $self->{snap_style} = $self->{_io}->read_s2le();
    $self->{snap_iso_pair} = $self->{_io}->read_s2le();
    $self->{grid} = $self->{_io}->read_s2le();
    $self->{grid_unit} = CAD::Format::DWG::AC1009::Point2d->new($self->{_io}, $self, $self->{_root});
    $self->{ortho} = $self->{_io}->read_s2le();
    $self->{regen} = $self->{_io}->read_s2le();
    $self->{fill} = $self->{_io}->read_s2le();
    $self->{qtext} = $self->{_io}->read_s2le();
    $self->{drag} = $self->{_io}->read_s2le();
    $self->{linetype_scale} = $self->{_io}->read_f8le();
    $self->{text_size} = $self->{_io}->read_f8le();
    $self->{trace_width} = $self->{_io}->read_f8le();
    $self->{current_layer_index} = $self->{_io}->read_s2le();
    $self->{current_color_convert} = $self->{_io}->read_f8le();
    $self->{unknown6} = $self->{_io}->read_u2le();
    $self->{psltscale} = $self->{_io}->read_u2le();
    $self->{tree_depth} = $self->{_io}->read_u2le();
    $self->{unknown7d} = $self->{_io}->read_bytes(2);
    $self->{aspect_ratio} = $self->{_io}->read_f8le();
    $self->{linear_units_format} = $self->{_io}->read_s2le();
    $self->{linear_units_precision} = $self->{_io}->read_s2le();
    $self->{axis} = $self->{_io}->read_s2le();
    $self->{axis_value} = CAD::Format::DWG::AC1009::Point2d->new($self->{_io}, $self, $self->{_root});
    $self->{sketch_increment} = $self->{_io}->read_f8le();
    $self->{fillet_radius} = $self->{_io}->read_f8le();
    $self->{units_for_angles} = $self->{_io}->read_s2le();
    $self->{angular_precision} = $self->{_io}->read_s2le();
    $self->{text_style_index} = $self->{_io}->read_s2le();
    $self->{osnap} = $self->{_io}->read_s2le();
    $self->{att_visibility} = $self->{_io}->read_s2le();
    $self->{menu} = Encode::decode("ASCII", IO::KaitaiStruct::Stream::bytes_terminate($self->{_io}->read_bytes(15), 0, 0));
    $self->{dim_scale} = $self->{_io}->read_f8le();
    $self->{dim_arrowhead_size} = $self->{_io}->read_f8le();
    $self->{dim_extension_line_offset} = $self->{_io}->read_f8le();
    $self->{dim_baseline_spacing} = $self->{_io}->read_f8le();
    $self->{dim_extension_line_extend} = $self->{_io}->read_f8le();
    $self->{dim_maximum_tolerance_limit} = $self->{_io}->read_f8le();
    $self->{dim_minimum_tolerance_limit} = $self->{_io}->read_f8le();
    $self->{dim_text_height} = $self->{_io}->read_f8le();
    $self->{dim_center_mark_control} = $self->{_io}->read_f8le();
    $self->{dim_oblique_stroke_size} = $self->{_io}->read_f8le();
    $self->{dim_tolerances} = $self->{_io}->read_s1();
    $self->{dim_limits_default_text} = $self->{_io}->read_s1();
    $self->{dim_text_ext_inside_line_position} = $self->{_io}->read_s1();
    $self->{dim_text_ext_outside_line_position} = $self->{_io}->read_s1();
    $self->{dim_extension_line_first_suppress} = $self->{_io}->read_s1();
    $self->{dim_extension_line_second_suppress} = $self->{_io}->read_s1();
    $self->{dim_text_vertical_position} = $self->{_io}->read_s1();
    $self->{limits_check} = $self->{_io}->read_s2le();
    $self->{unknown10a} = $self->{_io}->read_u1();
    $self->{unknown10b} = $self->{_io}->read_u1();
    $self->{unknown10c} = $self->{_io}->read_u1();
    $self->{unknown10d} = $self->{_io}->read_u1();
    $self->{unknown10e} = $self->{_io}->read_u1();
    $self->{unknown10f} = $self->{_io}->read_u1();
    $self->{unknown10g} = $self->{_io}->read_f8le();
    $self->{unknown10h} = $self->{_io}->read_u1();
    $self->{unknown10i} = $self->{_io}->read_u1();
    $self->{unknown10j} = $self->{_io}->read_u1();
    $self->{unknown10k} = $self->{_io}->read_u1();
    $self->{unknown10l} = $self->{_io}->read_u1();
    $self->{unknown10m} = $self->{_io}->read_u1();
    $self->{unknown10n} = $self->{_io}->read_u1();
    $self->{unknown10o} = $self->{_io}->read_u1();
    $self->{unknown10p} = $self->{_io}->read_f8le();
    $self->{unknown10q} = $self->{_io}->read_f8le();
    $self->{unknown10r} = $self->{_io}->read_u2le();
    $self->{unknown10s} = $self->{_io}->read_u2le();
    $self->{unknown10t} = $self->{_io}->read_u1();
    $self->{unknown10u} = $self->{_io}->read_u1();
    $self->{unknown10v} = $self->{_io}->read_u1();
    $self->{elevation} = $self->{_io}->read_f8le();
    $self->{thickness} = $self->{_io}->read_f8le();
    $self->{view_dir} = CAD::Format::DWG::AC1009::Point3d->new($self->{_io}, $self, $self->{_root});
    $self->{view_point_x} = CAD::Format::DWG::AC1009::Point3d->new($self->{_io}, $self, $self->{_root});
    $self->{view_point_y} = CAD::Format::DWG::AC1009::Point3d->new($self->{_io}, $self, $self->{_root});
    $self->{view_point_z} = CAD::Format::DWG::AC1009::Point3d->new($self->{_io}, $self, $self->{_root});
    $self->{view_point_x_alt} = CAD::Format::DWG::AC1009::Point3d->new($self->{_io}, $self, $self->{_root});
    $self->{view_point_y_alt} = CAD::Format::DWG::AC1009::Point3d->new($self->{_io}, $self, $self->{_root});
    $self->{view_point_z_alt} = CAD::Format::DWG::AC1009::Point3d->new($self->{_io}, $self, $self->{_root});
    $self->{flag_3d} = $self->{_io}->read_s2le();
    $self->{blip} = $self->{_io}->read_s2le();
    $self->{dim_suppression_of_zeros} = $self->{_io}->read_s1();
    $self->{dim_rounding} = $self->{_io}->read_f8le();
    $self->{dim_extension_line_extend2} = $self->{_io}->read_f8le();
    $self->{dim_arrowhead_block} = Encode::decode("ASCII", IO::KaitaiStruct::Stream::bytes_terminate($self->{_io}->read_bytes(33), 0, 0));
    $self->{circle_zoom_percent} = $self->{_io}->read_s2le();
    $self->{coordinates} = $self->{_io}->read_s2le();
    $self->{current_color} = $self->{_io}->read_s2le();
    $self->{current_linetype} = $self->{_io}->read_s2le();
    $self->{create_date_days} = $self->{_io}->read_u4le();
    $self->{create_date_ms} = $self->{_io}->read_u4le();
    $self->{update_date_days} = $self->{_io}->read_u4le();
    $self->{update_date_ms} = $self->{_io}->read_u4le();
    $self->{total_editing_time_days} = $self->{_io}->read_u4le();
    $self->{total_editing_time_ms} = $self->{_io}->read_u4le();
    $self->{user_elapsed_timer_days} = $self->{_io}->read_u4le();
    $self->{user_elapsed_timer_ms} = $self->{_io}->read_u4le();
    $self->{user_timer} = $self->{_io}->read_s2le();
    $self->{fast_zoom} = $self->{_io}->read_u2le();
    $self->{sketch_type} = $self->{_io}->read_u2le();
    $self->{unknown_date} = CAD::Format::DWG::AC1009::UnknownDate->new($self->{_io}, $self, $self->{_root});
    $self->{angle_base} = $self->{_io}->read_f8le();
    $self->{angle_direction} = $self->{_io}->read_s2le();
    $self->{point_mode} = $self->{_io}->read_s2le();
    $self->{point_size} = $self->{_io}->read_f8le();
    $self->{polyline_width} = $self->{_io}->read_f8le();
    $self->{user_integer_1} = $self->{_io}->read_s2le();
    $self->{user_integer_2} = $self->{_io}->read_s2le();
    $self->{user_integer_3} = $self->{_io}->read_s2le();
    $self->{user_integer_4} = $self->{_io}->read_s2le();
    $self->{user_integer_5} = $self->{_io}->read_s2le();
    $self->{user_real_1} = $self->{_io}->read_f8le();
    $self->{user_real_2} = $self->{_io}->read_f8le();
    $self->{user_real_3} = $self->{_io}->read_f8le();
    $self->{user_real_4} = $self->{_io}->read_f8le();
    $self->{user_real_5} = $self->{_io}->read_f8le();
    $self->{dim_alternate_units} = $self->{_io}->read_s1();
    $self->{dim_alternate_units_decimal_places} = $self->{_io}->read_s1();
    $self->{dim_associative} = $self->{_io}->read_s1();
    $self->{dim_sho} = $self->{_io}->read_s1();
    $self->{dim_measurement_postfix} = Encode::decode("ASCII", IO::KaitaiStruct::Stream::bytes_terminate($self->{_io}->read_bytes(16), 0, 0));
    $self->{dim_alternate_measurement_postfix} = Encode::decode("ASCII", IO::KaitaiStruct::Stream::bytes_terminate($self->{_io}->read_bytes(16), 0, 0));
    $self->{dim_alternate_units_multiplier} = $self->{_io}->read_f8le();
    $self->{dim_linear_measurements_scale_factor} = $self->{_io}->read_f8le();
    $self->{spline_segs} = $self->{_io}->read_s2le();
    $self->{spline_frame} = $self->{_io}->read_s2le();
    $self->{att_prompting_during_insert} = $self->{_io}->read_u2le();
    $self->{att_entry_dialogs} = $self->{_io}->read_u2le();
    $self->{chamfera} = $self->{_io}->read_f8le();
    $self->{chamferb} = $self->{_io}->read_f8le();
    $self->{mirror_text} = $self->{_io}->read_s2le();
    $self->{table_ucs} = CAD::Format::DWG::AC1009::Table->new($self->{_io}, $self, $self->{_root});
    $self->{unknown37} = $self->{_io}->read_bytes(2);
    $self->{ucs_origin_point} = CAD::Format::DWG::AC1009::Point3d->new($self->{_io}, $self, $self->{_root});
    $self->{ucs_x_dir} = CAD::Format::DWG::AC1009::Point3d->new($self->{_io}, $self, $self->{_root});
    $self->{ucs_y_dir} = CAD::Format::DWG::AC1009::Point3d->new($self->{_io}, $self, $self->{_root});
    $self->{target} = CAD::Format::DWG::AC1009::Point3d->new($self->{_io}, $self, $self->{_root});
    $self->{lens_length} = $self->{_io}->read_f8le();
    $self->{view_rotation_angle_radians} = $self->{_io}->read_f8le();
    $self->{frontz_z} = $self->{_io}->read_f8le();
    $self->{backz_z} = $self->{_io}->read_f8le();
    $self->{view_mode} = $self->{_io}->read_u2le();
    $self->{dim_tofl} = $self->{_io}->read_u1();
    $self->{dim_arrowhead_block1} = Encode::decode("ASCII", IO::KaitaiStruct::Stream::bytes_terminate($self->{_io}->read_bytes(33), 0, 0));
    $self->{dim_arrowhead_block2} = Encode::decode("ASCII", IO::KaitaiStruct::Stream::bytes_terminate($self->{_io}->read_bytes(33), 0, 0));
    $self->{dim_arrowhead_blocks_control} = $self->{_io}->read_u1();
    $self->{dim_text_between_ext_lines} = $self->{_io}->read_u1();
    $self->{dim_arrowhead_suppress} = $self->{_io}->read_u1();
    $self->{dim_text_vertical_position_size} = $self->{_io}->read_f8le();
    $self->{unknown_string} = Encode::decode("ASCII", IO::KaitaiStruct::Stream::bytes_terminate($self->{_io}->read_bytes(33), 0, 0));
    $self->{handling} = $self->{_io}->read_u2le();
    $self->{handseed} = $self->{_io}->read_bytes(8);
    $self->{surfu} = $self->{_io}->read_u2le();
    $self->{surfv} = $self->{_io}->read_u2le();
    $self->{surftype} = $self->{_io}->read_u2le();
    $self->{surftab1} = $self->{_io}->read_u2le();
    $self->{surftab2} = $self->{_io}->read_u2le();
    $self->{table_vport} = CAD::Format::DWG::AC1009::Table->new($self->{_io}, $self, $self->{_root});
    $self->{flatland} = $self->{_io}->read_u2le();
    $self->{spline_type} = $self->{_io}->read_u2le();
    $self->{ucs_icon} = $self->{_io}->read_u2le();
    $self->{ucs_name_index} = $self->{_io}->read_u2le();
    $self->{table_appid} = CAD::Format::DWG::AC1009::Table->new($self->{_io}, $self, $self->{_root});
    $self->{world_view} = $self->{_io}->read_u2le();
    $self->{unknown49a} = $self->{_io}->read_u2le();
    $self->{unknown49b} = $self->{_io}->read_u2le();
    $self->{table_dimstyle} = CAD::Format::DWG::AC1009::Table->new($self->{_io}, $self, $self->{_root});
    $self->{unknown49c} = $self->{_io}->read_bytes(5);
    $self->{dim_line_color} = $self->{_io}->read_u2le();
    $self->{dim_clre_c} = $self->{_io}->read_u2le();
    $self->{dim_clrt_c} = $self->{_io}->read_u2le();
    $self->{shade_edge} = $self->{_io}->read_u2le();
    $self->{shade_dif} = $self->{_io}->read_u2le();
    $self->{unknown_pre50} = $self->{_io}->read_bytes(2);
    $self->{unit_mode} = $self->{_io}->read_u2le();
    $self->{unit1_ratio} = $self->{_io}->read_f8le();
    $self->{unit2_ratio} = $self->{_io}->read_f8le();
    $self->{unit3_ratio} = $self->{_io}->read_f8le();
    $self->{unit4_ratio} = $self->{_io}->read_f8le();
    $self->{unit1_name} = Encode::decode("ASCII", IO::KaitaiStruct::Stream::bytes_terminate($self->{_io}->read_bytes(32), 0, 0));
    $self->{unit2_name} = Encode::decode("ASCII", IO::KaitaiStruct::Stream::bytes_terminate($self->{_io}->read_bytes(32), 0, 0));
    $self->{unit3_name} = Encode::decode("ASCII", IO::KaitaiStruct::Stream::bytes_terminate($self->{_io}->read_bytes(32), 0, 0));
    $self->{unit4_name} = Encode::decode("ASCII", IO::KaitaiStruct::Stream::bytes_terminate($self->{_io}->read_bytes(32), 0, 0));
    $self->{dim_tfac} = $self->{_io}->read_f8le();
    $self->{p_ucs_org} = CAD::Format::DWG::AC1009::Point3d->new($self->{_io}, $self, $self->{_root});
    $self->{p_ucs_xdir} = CAD::Format::DWG::AC1009::Point3d->new($self->{_io}, $self, $self->{_root});
    $self->{p_ucs_ydir} = CAD::Format::DWG::AC1009::Point3d->new($self->{_io}, $self, $self->{_root});
    $self->{p_ucs_name_index} = $self->{_io}->read_u2le();
    $self->{tile_mode} = $self->{_io}->read_u1();
    $self->{plim_check} = $self->{_io}->read_u2le();
    $self->{unknown56} = $self->{_io}->read_u2le();
    $self->{unknown57} = $self->{_io}->read_u1();
    $self->{p_ext_min} = CAD::Format::DWG::AC1009::Point3d->new($self->{_io}, $self, $self->{_root});
    $self->{p_ext_max} = CAD::Format::DWG::AC1009::Point3d->new($self->{_io}, $self, $self->{_root});
    $self->{p_lim_min} = CAD::Format::DWG::AC1009::Point2d->new($self->{_io}, $self, $self->{_root});
    $self->{p_lim_max} = CAD::Format::DWG::AC1009::Point2d->new($self->{_io}, $self, $self->{_root});
    $self->{p_insertion_base} = CAD::Format::DWG::AC1009::Point3d->new($self->{_io}, $self, $self->{_root});
    $self->{table_vx} = CAD::Format::DWG::AC1009::Table->new($self->{_io}, $self, $self->{_root});
    $self->{max_actvp} = $self->{_io}->read_u2le();
    $self->{dim_gap} = $self->{_io}->read_f8le();
    $self->{p_elevation} = $self->{_io}->read_f8le();
    if ($self->_parent()->num_header_vars() == 205) {
        $self->{vis_retain} = $self->{_io}->read_u2le();
    }
}

sub create_date {
    my ($self) = @_;
    return $self->{create_date} if ($self->{create_date});
    $self->{create_date} = ($self->create_date_days() + ($self->create_date_ms() / 86400000.0));
    return $self->{create_date};
}

sub update_date {
    my ($self) = @_;
    return $self->{update_date} if ($self->{update_date});
    $self->{update_date} = ($self->update_date_days() + ($self->update_date_ms() / 86400000.0));
    return $self->{update_date};
}

sub insertion_base {
    my ($self) = @_;
    return $self->{insertion_base};
}

sub plinegen {
    my ($self) = @_;
    return $self->{plinegen};
}

sub drawing_first {
    my ($self) = @_;
    return $self->{drawing_first};
}

sub drawing_second {
    my ($self) = @_;
    return $self->{drawing_second};
}

sub limits_min {
    my ($self) = @_;
    return $self->{limits_min};
}

sub limits_max {
    my ($self) = @_;
    return $self->{limits_max};
}

sub view_ctrl {
    my ($self) = @_;
    return $self->{view_ctrl};
}

sub view_size {
    my ($self) = @_;
    return $self->{view_size};
}

sub snap {
    my ($self) = @_;
    return $self->{snap};
}

sub snap_resolution {
    my ($self) = @_;
    return $self->{snap_resolution};
}

sub snap_base {
    my ($self) = @_;
    return $self->{snap_base};
}

sub snap_angle {
    my ($self) = @_;
    return $self->{snap_angle};
}

sub snap_style {
    my ($self) = @_;
    return $self->{snap_style};
}

sub snap_iso_pair {
    my ($self) = @_;
    return $self->{snap_iso_pair};
}

sub grid {
    my ($self) = @_;
    return $self->{grid};
}

sub grid_unit {
    my ($self) = @_;
    return $self->{grid_unit};
}

sub ortho {
    my ($self) = @_;
    return $self->{ortho};
}

sub regen {
    my ($self) = @_;
    return $self->{regen};
}

sub fill {
    my ($self) = @_;
    return $self->{fill};
}

sub qtext {
    my ($self) = @_;
    return $self->{qtext};
}

sub drag {
    my ($self) = @_;
    return $self->{drag};
}

sub linetype_scale {
    my ($self) = @_;
    return $self->{linetype_scale};
}

sub text_size {
    my ($self) = @_;
    return $self->{text_size};
}

sub trace_width {
    my ($self) = @_;
    return $self->{trace_width};
}

sub current_layer_index {
    my ($self) = @_;
    return $self->{current_layer_index};
}

sub current_color_convert {
    my ($self) = @_;
    return $self->{current_color_convert};
}

sub unknown6 {
    my ($self) = @_;
    return $self->{unknown6};
}

sub psltscale {
    my ($self) = @_;
    return $self->{psltscale};
}

sub tree_depth {
    my ($self) = @_;
    return $self->{tree_depth};
}

sub unknown7d {
    my ($self) = @_;
    return $self->{unknown7d};
}

sub aspect_ratio {
    my ($self) = @_;
    return $self->{aspect_ratio};
}

sub linear_units_format {
    my ($self) = @_;
    return $self->{linear_units_format};
}

sub linear_units_precision {
    my ($self) = @_;
    return $self->{linear_units_precision};
}

sub axis {
    my ($self) = @_;
    return $self->{axis};
}

sub axis_value {
    my ($self) = @_;
    return $self->{axis_value};
}

sub sketch_increment {
    my ($self) = @_;
    return $self->{sketch_increment};
}

sub fillet_radius {
    my ($self) = @_;
    return $self->{fillet_radius};
}

sub units_for_angles {
    my ($self) = @_;
    return $self->{units_for_angles};
}

sub angular_precision {
    my ($self) = @_;
    return $self->{angular_precision};
}

sub text_style_index {
    my ($self) = @_;
    return $self->{text_style_index};
}

sub osnap {
    my ($self) = @_;
    return $self->{osnap};
}

sub att_visibility {
    my ($self) = @_;
    return $self->{att_visibility};
}

sub menu {
    my ($self) = @_;
    return $self->{menu};
}

sub dim_scale {
    my ($self) = @_;
    return $self->{dim_scale};
}

sub dim_arrowhead_size {
    my ($self) = @_;
    return $self->{dim_arrowhead_size};
}

sub dim_extension_line_offset {
    my ($self) = @_;
    return $self->{dim_extension_line_offset};
}

sub dim_baseline_spacing {
    my ($self) = @_;
    return $self->{dim_baseline_spacing};
}

sub dim_extension_line_extend {
    my ($self) = @_;
    return $self->{dim_extension_line_extend};
}

sub dim_maximum_tolerance_limit {
    my ($self) = @_;
    return $self->{dim_maximum_tolerance_limit};
}

sub dim_minimum_tolerance_limit {
    my ($self) = @_;
    return $self->{dim_minimum_tolerance_limit};
}

sub dim_text_height {
    my ($self) = @_;
    return $self->{dim_text_height};
}

sub dim_center_mark_control {
    my ($self) = @_;
    return $self->{dim_center_mark_control};
}

sub dim_oblique_stroke_size {
    my ($self) = @_;
    return $self->{dim_oblique_stroke_size};
}

sub dim_tolerances {
    my ($self) = @_;
    return $self->{dim_tolerances};
}

sub dim_limits_default_text {
    my ($self) = @_;
    return $self->{dim_limits_default_text};
}

sub dim_text_ext_inside_line_position {
    my ($self) = @_;
    return $self->{dim_text_ext_inside_line_position};
}

sub dim_text_ext_outside_line_position {
    my ($self) = @_;
    return $self->{dim_text_ext_outside_line_position};
}

sub dim_extension_line_first_suppress {
    my ($self) = @_;
    return $self->{dim_extension_line_first_suppress};
}

sub dim_extension_line_second_suppress {
    my ($self) = @_;
    return $self->{dim_extension_line_second_suppress};
}

sub dim_text_vertical_position {
    my ($self) = @_;
    return $self->{dim_text_vertical_position};
}

sub limits_check {
    my ($self) = @_;
    return $self->{limits_check};
}

sub unknown10a {
    my ($self) = @_;
    return $self->{unknown10a};
}

sub unknown10b {
    my ($self) = @_;
    return $self->{unknown10b};
}

sub unknown10c {
    my ($self) = @_;
    return $self->{unknown10c};
}

sub unknown10d {
    my ($self) = @_;
    return $self->{unknown10d};
}

sub unknown10e {
    my ($self) = @_;
    return $self->{unknown10e};
}

sub unknown10f {
    my ($self) = @_;
    return $self->{unknown10f};
}

sub unknown10g {
    my ($self) = @_;
    return $self->{unknown10g};
}

sub unknown10h {
    my ($self) = @_;
    return $self->{unknown10h};
}

sub unknown10i {
    my ($self) = @_;
    return $self->{unknown10i};
}

sub unknown10j {
    my ($self) = @_;
    return $self->{unknown10j};
}

sub unknown10k {
    my ($self) = @_;
    return $self->{unknown10k};
}

sub unknown10l {
    my ($self) = @_;
    return $self->{unknown10l};
}

sub unknown10m {
    my ($self) = @_;
    return $self->{unknown10m};
}

sub unknown10n {
    my ($self) = @_;
    return $self->{unknown10n};
}

sub unknown10o {
    my ($self) = @_;
    return $self->{unknown10o};
}

sub unknown10p {
    my ($self) = @_;
    return $self->{unknown10p};
}

sub unknown10q {
    my ($self) = @_;
    return $self->{unknown10q};
}

sub unknown10r {
    my ($self) = @_;
    return $self->{unknown10r};
}

sub unknown10s {
    my ($self) = @_;
    return $self->{unknown10s};
}

sub unknown10t {
    my ($self) = @_;
    return $self->{unknown10t};
}

sub unknown10u {
    my ($self) = @_;
    return $self->{unknown10u};
}

sub unknown10v {
    my ($self) = @_;
    return $self->{unknown10v};
}

sub elevation {
    my ($self) = @_;
    return $self->{elevation};
}

sub thickness {
    my ($self) = @_;
    return $self->{thickness};
}

sub view_dir {
    my ($self) = @_;
    return $self->{view_dir};
}

sub view_point_x {
    my ($self) = @_;
    return $self->{view_point_x};
}

sub view_point_y {
    my ($self) = @_;
    return $self->{view_point_y};
}

sub view_point_z {
    my ($self) = @_;
    return $self->{view_point_z};
}

sub view_point_x_alt {
    my ($self) = @_;
    return $self->{view_point_x_alt};
}

sub view_point_y_alt {
    my ($self) = @_;
    return $self->{view_point_y_alt};
}

sub view_point_z_alt {
    my ($self) = @_;
    return $self->{view_point_z_alt};
}

sub flag_3d {
    my ($self) = @_;
    return $self->{flag_3d};
}

sub blip {
    my ($self) = @_;
    return $self->{blip};
}

sub dim_suppression_of_zeros {
    my ($self) = @_;
    return $self->{dim_suppression_of_zeros};
}

sub dim_rounding {
    my ($self) = @_;
    return $self->{dim_rounding};
}

sub dim_extension_line_extend2 {
    my ($self) = @_;
    return $self->{dim_extension_line_extend2};
}

sub dim_arrowhead_block {
    my ($self) = @_;
    return $self->{dim_arrowhead_block};
}

sub circle_zoom_percent {
    my ($self) = @_;
    return $self->{circle_zoom_percent};
}

sub coordinates {
    my ($self) = @_;
    return $self->{coordinates};
}

sub current_color {
    my ($self) = @_;
    return $self->{current_color};
}

sub current_linetype {
    my ($self) = @_;
    return $self->{current_linetype};
}

sub create_date_days {
    my ($self) = @_;
    return $self->{create_date_days};
}

sub create_date_ms {
    my ($self) = @_;
    return $self->{create_date_ms};
}

sub update_date_days {
    my ($self) = @_;
    return $self->{update_date_days};
}

sub update_date_ms {
    my ($self) = @_;
    return $self->{update_date_ms};
}

sub total_editing_time_days {
    my ($self) = @_;
    return $self->{total_editing_time_days};
}

sub total_editing_time_ms {
    my ($self) = @_;
    return $self->{total_editing_time_ms};
}

sub user_elapsed_timer_days {
    my ($self) = @_;
    return $self->{user_elapsed_timer_days};
}

sub user_elapsed_timer_ms {
    my ($self) = @_;
    return $self->{user_elapsed_timer_ms};
}

sub user_timer {
    my ($self) = @_;
    return $self->{user_timer};
}

sub fast_zoom {
    my ($self) = @_;
    return $self->{fast_zoom};
}

sub sketch_type {
    my ($self) = @_;
    return $self->{sketch_type};
}

sub unknown_date {
    my ($self) = @_;
    return $self->{unknown_date};
}

sub angle_base {
    my ($self) = @_;
    return $self->{angle_base};
}

sub angle_direction {
    my ($self) = @_;
    return $self->{angle_direction};
}

sub point_mode {
    my ($self) = @_;
    return $self->{point_mode};
}

sub point_size {
    my ($self) = @_;
    return $self->{point_size};
}

sub polyline_width {
    my ($self) = @_;
    return $self->{polyline_width};
}

sub user_integer_1 {
    my ($self) = @_;
    return $self->{user_integer_1};
}

sub user_integer_2 {
    my ($self) = @_;
    return $self->{user_integer_2};
}

sub user_integer_3 {
    my ($self) = @_;
    return $self->{user_integer_3};
}

sub user_integer_4 {
    my ($self) = @_;
    return $self->{user_integer_4};
}

sub user_integer_5 {
    my ($self) = @_;
    return $self->{user_integer_5};
}

sub user_real_1 {
    my ($self) = @_;
    return $self->{user_real_1};
}

sub user_real_2 {
    my ($self) = @_;
    return $self->{user_real_2};
}

sub user_real_3 {
    my ($self) = @_;
    return $self->{user_real_3};
}

sub user_real_4 {
    my ($self) = @_;
    return $self->{user_real_4};
}

sub user_real_5 {
    my ($self) = @_;
    return $self->{user_real_5};
}

sub dim_alternate_units {
    my ($self) = @_;
    return $self->{dim_alternate_units};
}

sub dim_alternate_units_decimal_places {
    my ($self) = @_;
    return $self->{dim_alternate_units_decimal_places};
}

sub dim_associative {
    my ($self) = @_;
    return $self->{dim_associative};
}

sub dim_sho {
    my ($self) = @_;
    return $self->{dim_sho};
}

sub dim_measurement_postfix {
    my ($self) = @_;
    return $self->{dim_measurement_postfix};
}

sub dim_alternate_measurement_postfix {
    my ($self) = @_;
    return $self->{dim_alternate_measurement_postfix};
}

sub dim_alternate_units_multiplier {
    my ($self) = @_;
    return $self->{dim_alternate_units_multiplier};
}

sub dim_linear_measurements_scale_factor {
    my ($self) = @_;
    return $self->{dim_linear_measurements_scale_factor};
}

sub spline_segs {
    my ($self) = @_;
    return $self->{spline_segs};
}

sub spline_frame {
    my ($self) = @_;
    return $self->{spline_frame};
}

sub att_prompting_during_insert {
    my ($self) = @_;
    return $self->{att_prompting_during_insert};
}

sub att_entry_dialogs {
    my ($self) = @_;
    return $self->{att_entry_dialogs};
}

sub chamfera {
    my ($self) = @_;
    return $self->{chamfera};
}

sub chamferb {
    my ($self) = @_;
    return $self->{chamferb};
}

sub mirror_text {
    my ($self) = @_;
    return $self->{mirror_text};
}

sub table_ucs {
    my ($self) = @_;
    return $self->{table_ucs};
}

sub unknown37 {
    my ($self) = @_;
    return $self->{unknown37};
}

sub ucs_origin_point {
    my ($self) = @_;
    return $self->{ucs_origin_point};
}

sub ucs_x_dir {
    my ($self) = @_;
    return $self->{ucs_x_dir};
}

sub ucs_y_dir {
    my ($self) = @_;
    return $self->{ucs_y_dir};
}

sub target {
    my ($self) = @_;
    return $self->{target};
}

sub lens_length {
    my ($self) = @_;
    return $self->{lens_length};
}

sub view_rotation_angle_radians {
    my ($self) = @_;
    return $self->{view_rotation_angle_radians};
}

sub frontz_z {
    my ($self) = @_;
    return $self->{frontz_z};
}

sub backz_z {
    my ($self) = @_;
    return $self->{backz_z};
}

sub view_mode {
    my ($self) = @_;
    return $self->{view_mode};
}

sub dim_tofl {
    my ($self) = @_;
    return $self->{dim_tofl};
}

sub dim_arrowhead_block1 {
    my ($self) = @_;
    return $self->{dim_arrowhead_block1};
}

sub dim_arrowhead_block2 {
    my ($self) = @_;
    return $self->{dim_arrowhead_block2};
}

sub dim_arrowhead_blocks_control {
    my ($self) = @_;
    return $self->{dim_arrowhead_blocks_control};
}

sub dim_text_between_ext_lines {
    my ($self) = @_;
    return $self->{dim_text_between_ext_lines};
}

sub dim_arrowhead_suppress {
    my ($self) = @_;
    return $self->{dim_arrowhead_suppress};
}

sub dim_text_vertical_position_size {
    my ($self) = @_;
    return $self->{dim_text_vertical_position_size};
}

sub unknown_string {
    my ($self) = @_;
    return $self->{unknown_string};
}

sub handling {
    my ($self) = @_;
    return $self->{handling};
}

sub handseed {
    my ($self) = @_;
    return $self->{handseed};
}

sub surfu {
    my ($self) = @_;
    return $self->{surfu};
}

sub surfv {
    my ($self) = @_;
    return $self->{surfv};
}

sub surftype {
    my ($self) = @_;
    return $self->{surftype};
}

sub surftab1 {
    my ($self) = @_;
    return $self->{surftab1};
}

sub surftab2 {
    my ($self) = @_;
    return $self->{surftab2};
}

sub table_vport {
    my ($self) = @_;
    return $self->{table_vport};
}

sub flatland {
    my ($self) = @_;
    return $self->{flatland};
}

sub spline_type {
    my ($self) = @_;
    return $self->{spline_type};
}

sub ucs_icon {
    my ($self) = @_;
    return $self->{ucs_icon};
}

sub ucs_name_index {
    my ($self) = @_;
    return $self->{ucs_name_index};
}

sub table_appid {
    my ($self) = @_;
    return $self->{table_appid};
}

sub world_view {
    my ($self) = @_;
    return $self->{world_view};
}

sub unknown49a {
    my ($self) = @_;
    return $self->{unknown49a};
}

sub unknown49b {
    my ($self) = @_;
    return $self->{unknown49b};
}

sub table_dimstyle {
    my ($self) = @_;
    return $self->{table_dimstyle};
}

sub unknown49c {
    my ($self) = @_;
    return $self->{unknown49c};
}

sub dim_line_color {
    my ($self) = @_;
    return $self->{dim_line_color};
}

sub dim_clre_c {
    my ($self) = @_;
    return $self->{dim_clre_c};
}

sub dim_clrt_c {
    my ($self) = @_;
    return $self->{dim_clrt_c};
}

sub shade_edge {
    my ($self) = @_;
    return $self->{shade_edge};
}

sub shade_dif {
    my ($self) = @_;
    return $self->{shade_dif};
}

sub unknown_pre50 {
    my ($self) = @_;
    return $self->{unknown_pre50};
}

sub unit_mode {
    my ($self) = @_;
    return $self->{unit_mode};
}

sub unit1_ratio {
    my ($self) = @_;
    return $self->{unit1_ratio};
}

sub unit2_ratio {
    my ($self) = @_;
    return $self->{unit2_ratio};
}

sub unit3_ratio {
    my ($self) = @_;
    return $self->{unit3_ratio};
}

sub unit4_ratio {
    my ($self) = @_;
    return $self->{unit4_ratio};
}

sub unit1_name {
    my ($self) = @_;
    return $self->{unit1_name};
}

sub unit2_name {
    my ($self) = @_;
    return $self->{unit2_name};
}

sub unit3_name {
    my ($self) = @_;
    return $self->{unit3_name};
}

sub unit4_name {
    my ($self) = @_;
    return $self->{unit4_name};
}

sub dim_tfac {
    my ($self) = @_;
    return $self->{dim_tfac};
}

sub p_ucs_org {
    my ($self) = @_;
    return $self->{p_ucs_org};
}

sub p_ucs_xdir {
    my ($self) = @_;
    return $self->{p_ucs_xdir};
}

sub p_ucs_ydir {
    my ($self) = @_;
    return $self->{p_ucs_ydir};
}

sub p_ucs_name_index {
    my ($self) = @_;
    return $self->{p_ucs_name_index};
}

sub tile_mode {
    my ($self) = @_;
    return $self->{tile_mode};
}

sub plim_check {
    my ($self) = @_;
    return $self->{plim_check};
}

sub unknown56 {
    my ($self) = @_;
    return $self->{unknown56};
}

sub unknown57 {
    my ($self) = @_;
    return $self->{unknown57};
}

sub p_ext_min {
    my ($self) = @_;
    return $self->{p_ext_min};
}

sub p_ext_max {
    my ($self) = @_;
    return $self->{p_ext_max};
}

sub p_lim_min {
    my ($self) = @_;
    return $self->{p_lim_min};
}

sub p_lim_max {
    my ($self) = @_;
    return $self->{p_lim_max};
}

sub p_insertion_base {
    my ($self) = @_;
    return $self->{p_insertion_base};
}

sub table_vx {
    my ($self) = @_;
    return $self->{table_vx};
}

sub max_actvp {
    my ($self) = @_;
    return $self->{max_actvp};
}

sub dim_gap {
    my ($self) = @_;
    return $self->{dim_gap};
}

sub p_elevation {
    my ($self) = @_;
    return $self->{p_elevation};
}

sub vis_retain {
    my ($self) = @_;
    return $self->{vis_retain};
}

########################################################################
package CAD::Format::DWG::AC1009::EntityArc;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{entity_mode} = CAD::Format::DWG::AC1009::EntityMode->new($self->{_io}, $self, $self->{_root});
    $self->{entity_size} = $self->{_io}->read_s2le();
    $self->{entity_layer_index} = $self->{_io}->read_s2le();
    $self->{entity_common} = CAD::Format::DWG::AC1009::EntityCommon->new($self->{_io}, $self, $self->{_root});
    if ($self->entity_mode()->has_color()) {
        $self->{entity_color} = $self->{_io}->read_s1();
    }
    if ($self->entity_mode()->has_linetype()) {
        $self->{entity_linetype_index} = $self->{_io}->read_s2le();
    }
    if ($self->entity_mode()->has_thickness()) {
        $self->{entity_thickness} = $self->{_io}->read_f8le();
    }
    if ($self->entity_mode()->has_elevation()) {
        $self->{entity_elevation} = $self->{_io}->read_f8le();
    }
    if ($self->entity_mode()->has_pspace()) {
        $self->{extra_flag} = CAD::Format::DWG::AC1009::ExtraFlag->new($self->{_io}, $self, $self->{_root});
    }
    if ( (($self->entity_mode()->has_pspace()) && ($self->extra_flag()->has_eed())) ) {
        $self->{eed} = CAD::Format::DWG::AC1009::Eed->new($self->{_io}, $self, $self->{_root});
    }
    if ($self->entity_mode()->has_handling()) {
        $self->{len_handling_id} = $self->{_io}->read_u1();
    }
    if ($self->entity_mode()->has_handling()) {
        $self->{handling_id} = $self->{_io}->read_bytes($self->len_handling_id());
    }
    if ( (($self->entity_mode()->has_pspace()) && ($self->extra_flag()->has_viewport())) ) {
        $self->{viewport} = $self->{_io}->read_u2le();
    }
    $self->{center_point} = CAD::Format::DWG::AC1009::Point3d->new($self->{_io}, $self, $self->{_root});
    $self->{angle_from} = $self->{_io}->read_f8le();
    $self->{angle_to} = $self->{_io}->read_f8le();
    if ($self->entity_common()->flag2_8()) {
        $self->{extrusion} = CAD::Format::DWG::AC1009::Point3d->new($self->{_io}, $self, $self->{_root});
    }
    $self->{crc16} = $self->{_io}->read_bytes(2);
}

sub entity_mode {
    my ($self) = @_;
    return $self->{entity_mode};
}

sub entity_size {
    my ($self) = @_;
    return $self->{entity_size};
}

sub entity_layer_index {
    my ($self) = @_;
    return $self->{entity_layer_index};
}

sub entity_common {
    my ($self) = @_;
    return $self->{entity_common};
}

sub entity_color {
    my ($self) = @_;
    return $self->{entity_color};
}

sub entity_linetype_index {
    my ($self) = @_;
    return $self->{entity_linetype_index};
}

sub entity_thickness {
    my ($self) = @_;
    return $self->{entity_thickness};
}

sub entity_elevation {
    my ($self) = @_;
    return $self->{entity_elevation};
}

sub extra_flag {
    my ($self) = @_;
    return $self->{extra_flag};
}

sub eed {
    my ($self) = @_;
    return $self->{eed};
}

sub len_handling_id {
    my ($self) = @_;
    return $self->{len_handling_id};
}

sub handling_id {
    my ($self) = @_;
    return $self->{handling_id};
}

sub viewport {
    my ($self) = @_;
    return $self->{viewport};
}

sub center_point {
    my ($self) = @_;
    return $self->{center_point};
}

sub angle_from {
    my ($self) = @_;
    return $self->{angle_from};
}

sub angle_to {
    my ($self) = @_;
    return $self->{angle_to};
}

sub extrusion {
    my ($self) = @_;
    return $self->{extrusion};
}

sub crc16 {
    my ($self) = @_;
    return $self->{crc16};
}

########################################################################
package CAD::Format::DWG::AC1009::Entity;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{entity_type} = $self->{_io}->read_s1();
    my $_on = $self->entity_type();
    if ($_on == $CAD::Format::DWG::AC1009::ENTITIES_SOLID) {
        $self->{data} = CAD::Format::DWG::AC1009::EntitySolid->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $CAD::Format::DWG::AC1009::ENTITIES_SHAPE) {
        $self->{data} = CAD::Format::DWG::AC1009::EntityShape->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $CAD::Format::DWG::AC1009::ENTITIES_SEQEND) {
        $self->{data} = CAD::Format::DWG::AC1009::EntitySeqend->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $CAD::Format::DWG::AC1009::ENTITIES_DIM) {
        $self->{data} = CAD::Format::DWG::AC1009::EntityDim->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $CAD::Format::DWG::AC1009::ENTITIES_BLOCK_BEGIN) {
        $self->{data} = CAD::Format::DWG::AC1009::EntityBlockBegin->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $CAD::Format::DWG::AC1009::ENTITIES_VPORT) {
        $self->{data} = CAD::Format::DWG::AC1009::EntityVport->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $CAD::Format::DWG::AC1009::ENTITIES_LINE) {
        $self->{data} = CAD::Format::DWG::AC1009::EntityLine->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $CAD::Format::DWG::AC1009::ENTITIES_TEXT) {
        $self->{data} = CAD::Format::DWG::AC1009::EntityText->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $CAD::Format::DWG::AC1009::ENTITIES_INSERT) {
        $self->{data} = CAD::Format::DWG::AC1009::EntityInsert->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $CAD::Format::DWG::AC1009::ENTITIES_POLYLINE2) {
        $self->{data} = CAD::Format::DWG::AC1009::EntityPolyline->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $CAD::Format::DWG::AC1009::ENTITIES_CIRCLE) {
        $self->{data} = CAD::Format::DWG::AC1009::EntityCircle->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $CAD::Format::DWG::AC1009::ENTITIES_ARC) {
        $self->{data} = CAD::Format::DWG::AC1009::EntityArc->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $CAD::Format::DWG::AC1009::ENTITIES_VERTEX) {
        $self->{data} = CAD::Format::DWG::AC1009::EntityVertex->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $CAD::Format::DWG::AC1009::ENTITIES_FACE3D) {
        $self->{data} = CAD::Format::DWG::AC1009::EntityFace3d->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $CAD::Format::DWG::AC1009::ENTITIES_ATTRIB) {
        $self->{data} = CAD::Format::DWG::AC1009::EntityAttrib->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $CAD::Format::DWG::AC1009::ENTITIES_ATTDEF) {
        $self->{data} = CAD::Format::DWG::AC1009::EntityAttdef->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $CAD::Format::DWG::AC1009::ENTITIES_BLOCK_END) {
        $self->{data} = CAD::Format::DWG::AC1009::EntityBlockEnd->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $CAD::Format::DWG::AC1009::ENTITIES_POINT) {
        $self->{data} = CAD::Format::DWG::AC1009::EntityPoint->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $CAD::Format::DWG::AC1009::ENTITIES_TRACE) {
        $self->{data} = CAD::Format::DWG::AC1009::EntityTrace->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $CAD::Format::DWG::AC1009::ENTITIES_POLYLINE) {
        $self->{data} = CAD::Format::DWG::AC1009::EntityPolyline->new($self->{_io}, $self, $self->{_root});
    }
    else {
        $self->{data} = CAD::Format::DWG::AC1009::EntityTmp->new($self->{_io}, $self, $self->{_root});
    }
}

sub entity_type {
    my ($self) = @_;
    return $self->{entity_type};
}

sub data {
    my ($self) = @_;
    return $self->{data};
}

########################################################################
package CAD::Format::DWG::AC1009::EntitySeqend;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{entity_mode} = CAD::Format::DWG::AC1009::EntityMode->new($self->{_io}, $self, $self->{_root});
    $self->{entity_size} = $self->{_io}->read_s2le();
    $self->{entity_layer_index} = $self->{_io}->read_s2le();
    $self->{entity_common} = CAD::Format::DWG::AC1009::EntityCommon->new($self->{_io}, $self, $self->{_root});
    if ($self->entity_mode()->has_color()) {
        $self->{entity_color} = $self->{_io}->read_s1();
    }
    if ($self->entity_mode()->has_linetype()) {
        $self->{entity_linetype_index} = $self->{_io}->read_s2le();
    }
    if ($self->entity_mode()->has_thickness()) {
        $self->{entity_thickness} = $self->{_io}->read_f8le();
    }
    if ($self->entity_mode()->has_elevation()) {
        $self->{entity_elevation} = $self->{_io}->read_f8le();
    }
    if ($self->entity_mode()->has_pspace()) {
        $self->{extra_flag} = CAD::Format::DWG::AC1009::ExtraFlag->new($self->{_io}, $self, $self->{_root});
    }
    if ( (($self->entity_mode()->has_pspace()) && ($self->extra_flag()->has_eed())) ) {
        $self->{eed} = CAD::Format::DWG::AC1009::Eed->new($self->{_io}, $self, $self->{_root});
    }
    if ($self->entity_mode()->has_handling()) {
        $self->{len_handling_id} = $self->{_io}->read_u1();
    }
    if ($self->entity_mode()->has_handling()) {
        $self->{handling_id} = $self->{_io}->read_bytes($self->len_handling_id());
    }
    if ( (($self->entity_mode()->has_pspace()) && ($self->extra_flag()->has_viewport())) ) {
        $self->{viewport} = $self->{_io}->read_u2le();
    }
    $self->{unknown} = $self->{_io}->read_bytes(4);
    $self->{crc16} = $self->{_io}->read_bytes(2);
}

sub entity_mode {
    my ($self) = @_;
    return $self->{entity_mode};
}

sub entity_size {
    my ($self) = @_;
    return $self->{entity_size};
}

sub entity_layer_index {
    my ($self) = @_;
    return $self->{entity_layer_index};
}

sub entity_common {
    my ($self) = @_;
    return $self->{entity_common};
}

sub entity_color {
    my ($self) = @_;
    return $self->{entity_color};
}

sub entity_linetype_index {
    my ($self) = @_;
    return $self->{entity_linetype_index};
}

sub entity_thickness {
    my ($self) = @_;
    return $self->{entity_thickness};
}

sub entity_elevation {
    my ($self) = @_;
    return $self->{entity_elevation};
}

sub extra_flag {
    my ($self) = @_;
    return $self->{extra_flag};
}

sub eed {
    my ($self) = @_;
    return $self->{eed};
}

sub len_handling_id {
    my ($self) = @_;
    return $self->{len_handling_id};
}

sub handling_id {
    my ($self) = @_;
    return $self->{handling_id};
}

sub viewport {
    my ($self) = @_;
    return $self->{viewport};
}

sub unknown {
    my ($self) = @_;
    return $self->{unknown};
}

sub crc16 {
    my ($self) = @_;
    return $self->{crc16};
}

########################################################################
package CAD::Format::DWG::AC1009::Eed;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{len_eed_data} = $self->{_io}->read_u2le();
    $self->{_raw_eed_data} = $self->{_io}->read_bytes($self->len_eed_data());
    my $io__raw_eed_data = IO::KaitaiStruct::Stream->new($self->{_raw_eed_data});
    $self->{eed_data} = CAD::Format::DWG::AC1009::EedData->new($io__raw_eed_data, $self, $self->{_root});
}

sub len_eed_data {
    my ($self) = @_;
    return $self->{len_eed_data};
}

sub eed_data {
    my ($self) = @_;
    return $self->{eed_data};
}

sub _raw_eed_data {
    my ($self) = @_;
    return $self->{_raw_eed_data};
}

########################################################################
package CAD::Format::DWG::AC1009::Header;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{magic} = $self->{_io}->read_bytes(6);
    $self->{zeros} = $self->{_io}->read_bytes(6);
    $self->{zero_one_or_three} = $self->{_io}->read_s1();
    $self->{unknown_3} = $self->{_io}->read_s2le();
    $self->{num_sections} = $self->{_io}->read_s2le();
    $self->{num_header_vars} = $self->{_io}->read_s2le();
    $self->{dwg_version} = $self->{_io}->read_s1();
    $self->{entities_start} = $self->{_io}->read_s4le();
    $self->{entities_end} = $self->{_io}->read_s4le();
    $self->{blocks_start} = $self->{_io}->read_s4le();
    $self->{blocks_size_raw} = $self->{_io}->read_u4le();
    $self->{blocks_end} = $self->{_io}->read_s4le();
    $self->{unknown4b} = $self->{_io}->read_bytes(2);
    $self->{unknown4c} = $self->{_io}->read_bytes(2);
    $self->{table_block} = CAD::Format::DWG::AC1009::Table->new($self->{_io}, $self, $self->{_root});
    $self->{table_layer} = CAD::Format::DWG::AC1009::Table->new($self->{_io}, $self, $self->{_root});
    $self->{table_style} = CAD::Format::DWG::AC1009::Table->new($self->{_io}, $self, $self->{_root});
    $self->{table_linetype} = CAD::Format::DWG::AC1009::Table->new($self->{_io}, $self, $self->{_root});
    $self->{table_view} = CAD::Format::DWG::AC1009::Table->new($self->{_io}, $self, $self->{_root});
    $self->{variables} = CAD::Format::DWG::AC1009::HeaderVariables->new($self->{_io}, $self, $self->{_root});
    $self->{crc16} = $self->{_io}->read_bytes(2);
}

sub blocks_size_unknown {
    my ($self) = @_;
    return $self->{blocks_size_unknown} if ($self->{blocks_size_unknown});
    $self->{blocks_size_unknown} = (($self->blocks_size_raw() & 4278190080) >> 24);
    return $self->{blocks_size_unknown};
}

sub blocks_size {
    my ($self) = @_;
    return $self->{blocks_size} if ($self->{blocks_size});
    $self->{blocks_size} = ($self->blocks_size_raw() & 16777215);
    return $self->{blocks_size};
}

sub magic {
    my ($self) = @_;
    return $self->{magic};
}

sub zeros {
    my ($self) = @_;
    return $self->{zeros};
}

sub zero_one_or_three {
    my ($self) = @_;
    return $self->{zero_one_or_three};
}

sub unknown_3 {
    my ($self) = @_;
    return $self->{unknown_3};
}

sub num_sections {
    my ($self) = @_;
    return $self->{num_sections};
}

sub num_header_vars {
    my ($self) = @_;
    return $self->{num_header_vars};
}

sub dwg_version {
    my ($self) = @_;
    return $self->{dwg_version};
}

sub entities_start {
    my ($self) = @_;
    return $self->{entities_start};
}

sub entities_end {
    my ($self) = @_;
    return $self->{entities_end};
}

sub blocks_start {
    my ($self) = @_;
    return $self->{blocks_start};
}

sub blocks_size_raw {
    my ($self) = @_;
    return $self->{blocks_size_raw};
}

sub blocks_end {
    my ($self) = @_;
    return $self->{blocks_end};
}

sub unknown4b {
    my ($self) = @_;
    return $self->{unknown4b};
}

sub unknown4c {
    my ($self) = @_;
    return $self->{unknown4c};
}

sub table_block {
    my ($self) = @_;
    return $self->{table_block};
}

sub table_layer {
    my ($self) = @_;
    return $self->{table_layer};
}

sub table_style {
    my ($self) = @_;
    return $self->{table_style};
}

sub table_linetype {
    my ($self) = @_;
    return $self->{table_linetype};
}

sub table_view {
    my ($self) = @_;
    return $self->{table_view};
}

sub variables {
    my ($self) = @_;
    return $self->{variables};
}

sub crc16 {
    my ($self) = @_;
    return $self->{crc16};
}

########################################################################
package CAD::Format::DWG::AC1009::ExtraFlag;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{flag1} = $self->{_io}->read_bits_int_be(1);
    $self->{flag2} = $self->{_io}->read_bits_int_be(1);
    $self->{flag3} = $self->{_io}->read_bits_int_be(1);
    $self->{flag4} = $self->{_io}->read_bits_int_be(1);
    $self->{flag5} = $self->{_io}->read_bits_int_be(1);
    $self->{has_viewport} = $self->{_io}->read_bits_int_be(1);
    $self->{has_eed} = $self->{_io}->read_bits_int_be(1);
    $self->{flag8} = $self->{_io}->read_bits_int_be(1);
}

sub flag1 {
    my ($self) = @_;
    return $self->{flag1};
}

sub flag2 {
    my ($self) = @_;
    return $self->{flag2};
}

sub flag3 {
    my ($self) = @_;
    return $self->{flag3};
}

sub flag4 {
    my ($self) = @_;
    return $self->{flag4};
}

sub flag5 {
    my ($self) = @_;
    return $self->{flag5};
}

sub has_viewport {
    my ($self) = @_;
    return $self->{has_viewport};
}

sub has_eed {
    my ($self) = @_;
    return $self->{has_eed};
}

sub flag8 {
    my ($self) = @_;
    return $self->{flag8};
}

########################################################################
package CAD::Format::DWG::AC1009::RealEntities;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{entities} = ();
    while (!$self->{_io}->is_eof()) {
        push @{$self->{entities}}, CAD::Format::DWG::AC1009::Entity->new($self->{_io}, $self, $self->{_root});
    }
}

sub entities {
    my ($self) = @_;
    return $self->{entities};
}

########################################################################
package CAD::Format::DWG::AC1009::AppidFlag;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{flag1} = $self->{_io}->read_bits_int_be(1);
    $self->{flag2} = $self->{_io}->read_bits_int_be(1);
    $self->{flag3} = $self->{_io}->read_bits_int_be(1);
    $self->{flag4} = $self->{_io}->read_bits_int_be(1);
    $self->{flag5} = $self->{_io}->read_bits_int_be(1);
    $self->{flag6} = $self->{_io}->read_bits_int_be(1);
    $self->{flag7} = $self->{_io}->read_bits_int_be(1);
    $self->{flag8} = $self->{_io}->read_bits_int_be(1);
}

sub flag1 {
    my ($self) = @_;
    return $self->{flag1};
}

sub flag2 {
    my ($self) = @_;
    return $self->{flag2};
}

sub flag3 {
    my ($self) = @_;
    return $self->{flag3};
}

sub flag4 {
    my ($self) = @_;
    return $self->{flag4};
}

sub flag5 {
    my ($self) = @_;
    return $self->{flag5};
}

sub flag6 {
    my ($self) = @_;
    return $self->{flag6};
}

sub flag7 {
    my ($self) = @_;
    return $self->{flag7};
}

sub flag8 {
    my ($self) = @_;
    return $self->{flag8};
}

########################################################################
package CAD::Format::DWG::AC1009::Vport;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{flag} = CAD::Format::DWG::AC1009::VportFlag->new($self->{_io}, $self, $self->{_root});
    $self->{vport_name} = Encode::decode("ASCII", IO::KaitaiStruct::Stream::bytes_terminate($self->{_io}->read_bytes(32), 0, 0));
    $self->{used} = $self->{_io}->read_s2le();
    $self->{view_size_vport_10_20} = CAD::Format::DWG::AC1009::Point2d->new($self->{_io}, $self, $self->{_root});
    $self->{view_ctrl_vport_11_21} = CAD::Format::DWG::AC1009::Point2d->new($self->{_io}, $self, $self->{_root});
    $self->{view_taget_vport_17_27_37} = CAD::Format::DWG::AC1009::Point3d->new($self->{_io}, $self, $self->{_root});
    $self->{vport_16_26_36} = CAD::Format::DWG::AC1009::Point3d->new($self->{_io}, $self, $self->{_root});
    $self->{vport_51_in_radians} = $self->{_io}->read_f8le();
    $self->{vport_40} = $self->{_io}->read_f8le();
    $self->{vport_12_22} = CAD::Format::DWG::AC1009::Point2d->new($self->{_io}, $self, $self->{_root});
    $self->{vport_41} = $self->{_io}->read_f8le();
    $self->{vport_42} = $self->{_io}->read_f8le();
    $self->{vport_43} = $self->{_io}->read_f8le();
    $self->{vport_44} = $self->{_io}->read_f8le();
    $self->{vport_71} = $self->{_io}->read_u2le();
    $self->{vport_72} = $self->{_io}->read_u2le();
    $self->{vport_73} = $self->{_io}->read_u2le();
    $self->{vport_74} = $self->{_io}->read_u2le();
    $self->{vport_75} = $self->{_io}->read_u2le();
    $self->{vport_76} = $self->{_io}->read_u2le();
    $self->{vport_77} = $self->{_io}->read_u2le();
    $self->{vport_78} = $self->{_io}->read_u2le();
    $self->{vport_50} = $self->{_io}->read_f8le();
    $self->{vport_13_23} = CAD::Format::DWG::AC1009::Point2d->new($self->{_io}, $self, $self->{_root});
    $self->{vport_14_24} = CAD::Format::DWG::AC1009::Point2d->new($self->{_io}, $self, $self->{_root});
    $self->{vport_15_25} = CAD::Format::DWG::AC1009::Point2d->new($self->{_io}, $self, $self->{_root});
    $self->{crc16} = $self->{_io}->read_bytes(2);
}

sub flag {
    my ($self) = @_;
    return $self->{flag};
}

sub vport_name {
    my ($self) = @_;
    return $self->{vport_name};
}

sub used {
    my ($self) = @_;
    return $self->{used};
}

sub view_size_vport_10_20 {
    my ($self) = @_;
    return $self->{view_size_vport_10_20};
}

sub view_ctrl_vport_11_21 {
    my ($self) = @_;
    return $self->{view_ctrl_vport_11_21};
}

sub view_taget_vport_17_27_37 {
    my ($self) = @_;
    return $self->{view_taget_vport_17_27_37};
}

sub vport_16_26_36 {
    my ($self) = @_;
    return $self->{vport_16_26_36};
}

sub vport_51_in_radians {
    my ($self) = @_;
    return $self->{vport_51_in_radians};
}

sub vport_40 {
    my ($self) = @_;
    return $self->{vport_40};
}

sub vport_12_22 {
    my ($self) = @_;
    return $self->{vport_12_22};
}

sub vport_41 {
    my ($self) = @_;
    return $self->{vport_41};
}

sub vport_42 {
    my ($self) = @_;
    return $self->{vport_42};
}

sub vport_43 {
    my ($self) = @_;
    return $self->{vport_43};
}

sub vport_44 {
    my ($self) = @_;
    return $self->{vport_44};
}

sub vport_71 {
    my ($self) = @_;
    return $self->{vport_71};
}

sub vport_72 {
    my ($self) = @_;
    return $self->{vport_72};
}

sub vport_73 {
    my ($self) = @_;
    return $self->{vport_73};
}

sub vport_74 {
    my ($self) = @_;
    return $self->{vport_74};
}

sub vport_75 {
    my ($self) = @_;
    return $self->{vport_75};
}

sub vport_76 {
    my ($self) = @_;
    return $self->{vport_76};
}

sub vport_77 {
    my ($self) = @_;
    return $self->{vport_77};
}

sub vport_78 {
    my ($self) = @_;
    return $self->{vport_78};
}

sub vport_50 {
    my ($self) = @_;
    return $self->{vport_50};
}

sub vport_13_23 {
    my ($self) = @_;
    return $self->{vport_13_23};
}

sub vport_14_24 {
    my ($self) = @_;
    return $self->{vport_14_24};
}

sub vport_15_25 {
    my ($self) = @_;
    return $self->{vport_15_25};
}

sub crc16 {
    my ($self) = @_;
    return $self->{crc16};
}

########################################################################
package CAD::Format::DWG::AC1009::EntityCircle;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{entity_mode} = CAD::Format::DWG::AC1009::EntityMode->new($self->{_io}, $self, $self->{_root});
    $self->{entity_size} = $self->{_io}->read_s2le();
    $self->{entity_layer_index} = $self->{_io}->read_s2le();
    $self->{entity_common} = CAD::Format::DWG::AC1009::EntityCommon->new($self->{_io}, $self, $self->{_root});
    if ($self->entity_mode()->has_color()) {
        $self->{entity_color} = $self->{_io}->read_s1();
    }
    if ($self->entity_mode()->has_linetype()) {
        $self->{entity_linetype_index} = $self->{_io}->read_s2le();
    }
    if ($self->entity_mode()->has_thickness()) {
        $self->{entity_thickness} = $self->{_io}->read_f8le();
    }
    if ($self->entity_mode()->has_elevation()) {
        $self->{entity_elevation} = $self->{_io}->read_f8le();
    }
    if ($self->entity_mode()->has_pspace()) {
        $self->{extra_flag} = CAD::Format::DWG::AC1009::ExtraFlag->new($self->{_io}, $self, $self->{_root});
    }
    if ( (($self->entity_mode()->has_pspace()) && ($self->extra_flag()->has_eed())) ) {
        $self->{eed} = CAD::Format::DWG::AC1009::Eed->new($self->{_io}, $self, $self->{_root});
    }
    if ($self->entity_mode()->has_handling()) {
        $self->{len_handling_id} = $self->{_io}->read_u1();
    }
    if ($self->entity_mode()->has_handling()) {
        $self->{handling_id} = $self->{_io}->read_bytes($self->len_handling_id());
    }
    if ( (($self->entity_mode()->has_pspace()) && ($self->extra_flag()->has_viewport())) ) {
        $self->{viewport} = $self->{_io}->read_u2le();
    }
    $self->{center_point} = CAD::Format::DWG::AC1009::Point2d->new($self->{_io}, $self, $self->{_root});
    $self->{radius} = $self->{_io}->read_f8le();
    if ($self->entity_common()->flag2_8()) {
        $self->{extrusion} = CAD::Format::DWG::AC1009::Point3d->new($self->{_io}, $self, $self->{_root});
    }
    $self->{crc16} = $self->{_io}->read_bytes(2);
}

sub entity_mode {
    my ($self) = @_;
    return $self->{entity_mode};
}

sub entity_size {
    my ($self) = @_;
    return $self->{entity_size};
}

sub entity_layer_index {
    my ($self) = @_;
    return $self->{entity_layer_index};
}

sub entity_common {
    my ($self) = @_;
    return $self->{entity_common};
}

sub entity_color {
    my ($self) = @_;
    return $self->{entity_color};
}

sub entity_linetype_index {
    my ($self) = @_;
    return $self->{entity_linetype_index};
}

sub entity_thickness {
    my ($self) = @_;
    return $self->{entity_thickness};
}

sub entity_elevation {
    my ($self) = @_;
    return $self->{entity_elevation};
}

sub extra_flag {
    my ($self) = @_;
    return $self->{extra_flag};
}

sub eed {
    my ($self) = @_;
    return $self->{eed};
}

sub len_handling_id {
    my ($self) = @_;
    return $self->{len_handling_id};
}

sub handling_id {
    my ($self) = @_;
    return $self->{handling_id};
}

sub viewport {
    my ($self) = @_;
    return $self->{viewport};
}

sub center_point {
    my ($self) = @_;
    return $self->{center_point};
}

sub radius {
    my ($self) = @_;
    return $self->{radius};
}

sub extrusion {
    my ($self) = @_;
    return $self->{extrusion};
}

sub crc16 {
    my ($self) = @_;
    return $self->{crc16};
}

########################################################################
package CAD::Format::DWG::AC1009::EntityShape;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{entity_mode} = CAD::Format::DWG::AC1009::EntityMode->new($self->{_io}, $self, $self->{_root});
    $self->{entity_size} = $self->{_io}->read_s2le();
    $self->{entity_layer_index} = $self->{_io}->read_s2le();
    $self->{entity_common} = CAD::Format::DWG::AC1009::EntityCommon->new($self->{_io}, $self, $self->{_root});
    if ($self->entity_mode()->has_color()) {
        $self->{entity_color} = $self->{_io}->read_s1();
    }
    if ($self->entity_mode()->has_linetype()) {
        $self->{entity_linetype_index} = $self->{_io}->read_s2le();
    }
    if ($self->entity_mode()->has_thickness()) {
        $self->{entity_thickness} = $self->{_io}->read_f8le();
    }
    if ($self->entity_mode()->has_elevation()) {
        $self->{entity_elevation} = $self->{_io}->read_f8le();
    }
    if ($self->entity_mode()->has_pspace()) {
        $self->{extra_flag} = CAD::Format::DWG::AC1009::ExtraFlag->new($self->{_io}, $self, $self->{_root});
    }
    if ( (($self->entity_mode()->has_pspace()) && ($self->extra_flag()->has_eed())) ) {
        $self->{eed} = CAD::Format::DWG::AC1009::Eed->new($self->{_io}, $self, $self->{_root});
    }
    if ($self->entity_mode()->has_handling()) {
        $self->{len_handling_id} = $self->{_io}->read_u1();
    }
    if ($self->entity_mode()->has_handling()) {
        $self->{handling_id} = $self->{_io}->read_bytes($self->len_handling_id());
    }
    if ( (($self->entity_mode()->has_pspace()) && ($self->extra_flag()->has_viewport())) ) {
        $self->{viewport} = $self->{_io}->read_u2le();
    }
    $self->{x} = $self->{_io}->read_f8le();
    $self->{y} = $self->{_io}->read_f8le();
    $self->{height} = $self->{_io}->read_f8le();
    $self->{item_num} = $self->{_io}->read_u1();
    if ($self->entity_common()->flag2_8()) {
        $self->{angle_in_radians} = $self->{_io}->read_f8le();
    }
    if ($self->entity_common()->flag2_7()) {
        $self->{load_num} = $self->{_io}->read_u1();
    }
    if ($self->entity_common()->flag2_6()) {
        $self->{width_factor} = $self->{_io}->read_f8le();
    }
    if ($self->entity_common()->flag2_5()) {
        $self->{oblique_angle} = $self->{_io}->read_f8le();
    }
    $self->{crc16} = $self->{_io}->read_bytes(2);
}

sub entity_mode {
    my ($self) = @_;
    return $self->{entity_mode};
}

sub entity_size {
    my ($self) = @_;
    return $self->{entity_size};
}

sub entity_layer_index {
    my ($self) = @_;
    return $self->{entity_layer_index};
}

sub entity_common {
    my ($self) = @_;
    return $self->{entity_common};
}

sub entity_color {
    my ($self) = @_;
    return $self->{entity_color};
}

sub entity_linetype_index {
    my ($self) = @_;
    return $self->{entity_linetype_index};
}

sub entity_thickness {
    my ($self) = @_;
    return $self->{entity_thickness};
}

sub entity_elevation {
    my ($self) = @_;
    return $self->{entity_elevation};
}

sub extra_flag {
    my ($self) = @_;
    return $self->{extra_flag};
}

sub eed {
    my ($self) = @_;
    return $self->{eed};
}

sub len_handling_id {
    my ($self) = @_;
    return $self->{len_handling_id};
}

sub handling_id {
    my ($self) = @_;
    return $self->{handling_id};
}

sub viewport {
    my ($self) = @_;
    return $self->{viewport};
}

sub x {
    my ($self) = @_;
    return $self->{x};
}

sub y {
    my ($self) = @_;
    return $self->{y};
}

sub height {
    my ($self) = @_;
    return $self->{height};
}

sub item_num {
    my ($self) = @_;
    return $self->{item_num};
}

sub angle_in_radians {
    my ($self) = @_;
    return $self->{angle_in_radians};
}

sub load_num {
    my ($self) = @_;
    return $self->{load_num};
}

sub width_factor {
    my ($self) = @_;
    return $self->{width_factor};
}

sub oblique_angle {
    my ($self) = @_;
    return $self->{oblique_angle};
}

sub crc16 {
    my ($self) = @_;
    return $self->{crc16};
}

########################################################################
package CAD::Format::DWG::AC1009::EntityVertex;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{entity_mode} = CAD::Format::DWG::AC1009::EntityMode->new($self->{_io}, $self, $self->{_root});
    $self->{entity_size} = $self->{_io}->read_s2le();
    $self->{entity_layer_index} = $self->{_io}->read_s2le();
    $self->{entity_common} = CAD::Format::DWG::AC1009::EntityCommon->new($self->{_io}, $self, $self->{_root});
    if ($self->entity_mode()->has_color()) {
        $self->{entity_color} = $self->{_io}->read_s1();
    }
    if ($self->entity_mode()->has_linetype()) {
        $self->{entity_linetype_index} = $self->{_io}->read_s2le();
    }
    if ($self->entity_mode()->has_thickness()) {
        $self->{entity_thickness} = $self->{_io}->read_f8le();
    }
    if ($self->entity_mode()->has_elevation()) {
        $self->{entity_elevation} = $self->{_io}->read_f8le();
    }
    if ($self->entity_mode()->has_pspace()) {
        $self->{extra_flag} = CAD::Format::DWG::AC1009::ExtraFlag->new($self->{_io}, $self, $self->{_root});
    }
    if ( (($self->entity_mode()->has_pspace()) && ($self->extra_flag()->has_eed())) ) {
        $self->{eed} = CAD::Format::DWG::AC1009::Eed->new($self->{_io}, $self, $self->{_root});
    }
    if ($self->entity_mode()->has_handling()) {
        $self->{len_handling_id} = $self->{_io}->read_u1();
    }
    if ($self->entity_mode()->has_handling()) {
        $self->{handling_id} = $self->{_io}->read_bytes($self->len_handling_id());
    }
    if ( (($self->entity_mode()->has_pspace()) && ($self->extra_flag()->has_viewport())) ) {
        $self->{viewport} = $self->{_io}->read_u2le();
    }
    $self->{x} = $self->{_io}->read_f8le();
    $self->{y} = $self->{_io}->read_f8le();
    if ($self->entity_common()->flag2_8()) {
        $self->{start_width} = $self->{_io}->read_f8le();
    }
    if ($self->entity_common()->flag2_7()) {
        $self->{end_width} = $self->{_io}->read_f8le();
    }
    if ($self->entity_common()->flag2_6()) {
        $self->{bulge} = $self->{_io}->read_f8le();
    }
    if ($self->entity_common()->flag2_5()) {
        $self->{vertex_extra_flag} = CAD::Format::DWG::AC1009::VertexExtraFlag->new($self->{_io}, $self, $self->{_root});
    }
    if ($self->entity_common()->flag2_4()) {
        $self->{tangent_dir_in_radians} = $self->{_io}->read_f8le();
    }
    $self->{crc16} = $self->{_io}->read_bytes(2);
}

sub entity_mode {
    my ($self) = @_;
    return $self->{entity_mode};
}

sub entity_size {
    my ($self) = @_;
    return $self->{entity_size};
}

sub entity_layer_index {
    my ($self) = @_;
    return $self->{entity_layer_index};
}

sub entity_common {
    my ($self) = @_;
    return $self->{entity_common};
}

sub entity_color {
    my ($self) = @_;
    return $self->{entity_color};
}

sub entity_linetype_index {
    my ($self) = @_;
    return $self->{entity_linetype_index};
}

sub entity_thickness {
    my ($self) = @_;
    return $self->{entity_thickness};
}

sub entity_elevation {
    my ($self) = @_;
    return $self->{entity_elevation};
}

sub extra_flag {
    my ($self) = @_;
    return $self->{extra_flag};
}

sub eed {
    my ($self) = @_;
    return $self->{eed};
}

sub len_handling_id {
    my ($self) = @_;
    return $self->{len_handling_id};
}

sub handling_id {
    my ($self) = @_;
    return $self->{handling_id};
}

sub viewport {
    my ($self) = @_;
    return $self->{viewport};
}

sub x {
    my ($self) = @_;
    return $self->{x};
}

sub y {
    my ($self) = @_;
    return $self->{y};
}

sub start_width {
    my ($self) = @_;
    return $self->{start_width};
}

sub end_width {
    my ($self) = @_;
    return $self->{end_width};
}

sub bulge {
    my ($self) = @_;
    return $self->{bulge};
}

sub vertex_extra_flag {
    my ($self) = @_;
    return $self->{vertex_extra_flag};
}

sub tangent_dir_in_radians {
    my ($self) = @_;
    return $self->{tangent_dir_in_radians};
}

sub crc16 {
    my ($self) = @_;
    return $self->{crc16};
}

########################################################################
package CAD::Format::DWG::AC1009::LayerFlag;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{flag1} = $self->{_io}->read_bits_int_be(1);
    $self->{referenced} = $self->{_io}->read_bits_int_be(1);
    $self->{flag3} = $self->{_io}->read_bits_int_be(1);
    $self->{flag4} = $self->{_io}->read_bits_int_be(1);
    $self->{flag5} = $self->{_io}->read_bits_int_be(1);
    $self->{flag6} = $self->{_io}->read_bits_int_be(1);
    $self->{frozen_in_new_viewports} = $self->{_io}->read_bits_int_be(1);
    $self->{frozen} = $self->{_io}->read_bits_int_be(1);
}

sub flag1 {
    my ($self) = @_;
    return $self->{flag1};
}

sub referenced {
    my ($self) = @_;
    return $self->{referenced};
}

sub flag3 {
    my ($self) = @_;
    return $self->{flag3};
}

sub flag4 {
    my ($self) = @_;
    return $self->{flag4};
}

sub flag5 {
    my ($self) = @_;
    return $self->{flag5};
}

sub flag6 {
    my ($self) = @_;
    return $self->{flag6};
}

sub frozen_in_new_viewports {
    my ($self) = @_;
    return $self->{frozen_in_new_viewports};
}

sub frozen {
    my ($self) = @_;
    return $self->{frozen};
}

########################################################################
package CAD::Format::DWG::AC1009::EedData;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{eeds} = ();
    while (!$self->{_io}->is_eof()) {
        push @{$self->{eeds}}, CAD::Format::DWG::AC1009::EedDetect->new($self->{_io}, $self, $self->{_root});
    }
}

sub eeds {
    my ($self) = @_;
    return $self->{eeds};
}

########################################################################
package CAD::Format::DWG::AC1009::EntityMode;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{has_attributes} = $self->{_io}->read_bits_int_be(1);
    $self->{has_pspace} = $self->{_io}->read_bits_int_be(1);
    $self->{has_handling} = $self->{_io}->read_bits_int_be(1);
    $self->{entity_mode4} = $self->{_io}->read_bits_int_be(1);
    $self->{has_thickness} = $self->{_io}->read_bits_int_be(1);
    $self->{has_elevation} = $self->{_io}->read_bits_int_be(1);
    $self->{has_linetype} = $self->{_io}->read_bits_int_be(1);
    $self->{has_color} = $self->{_io}->read_bits_int_be(1);
}

sub has_attributes {
    my ($self) = @_;
    return $self->{has_attributes};
}

sub has_pspace {
    my ($self) = @_;
    return $self->{has_pspace};
}

sub has_handling {
    my ($self) = @_;
    return $self->{has_handling};
}

sub entity_mode4 {
    my ($self) = @_;
    return $self->{entity_mode4};
}

sub has_thickness {
    my ($self) = @_;
    return $self->{has_thickness};
}

sub has_elevation {
    my ($self) = @_;
    return $self->{has_elevation};
}

sub has_linetype {
    my ($self) = @_;
    return $self->{has_linetype};
}

sub has_color {
    my ($self) = @_;
    return $self->{has_color};
}

########################################################################
package CAD::Format::DWG::AC1009::Eed1070;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{value} = $self->{_io}->read_u2le();
}

sub value {
    my ($self) = @_;
    return $self->{value};
}

########################################################################
package CAD::Format::DWG::AC1009::EntityLine;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{entity_mode} = CAD::Format::DWG::AC1009::EntityMode->new($self->{_io}, $self, $self->{_root});
    $self->{entity_size} = $self->{_io}->read_s2le();
    $self->{entity_layer_index} = $self->{_io}->read_s2le();
    $self->{entity_common} = CAD::Format::DWG::AC1009::EntityCommon->new($self->{_io}, $self, $self->{_root});
    if ($self->entity_mode()->has_color()) {
        $self->{entity_color} = $self->{_io}->read_s1();
    }
    if ($self->entity_mode()->has_linetype()) {
        $self->{entity_linetype_index} = $self->{_io}->read_s2le();
    }
    if ($self->entity_mode()->has_thickness()) {
        $self->{entity_thickness} = $self->{_io}->read_f8le();
    }
    if ($self->entity_mode()->has_pspace()) {
        $self->{extra_flag} = CAD::Format::DWG::AC1009::ExtraFlag->new($self->{_io}, $self, $self->{_root});
    }
    if ( (($self->entity_mode()->has_pspace()) && ($self->extra_flag()->has_eed())) ) {
        $self->{eed} = CAD::Format::DWG::AC1009::Eed->new($self->{_io}, $self, $self->{_root});
    }
    if ($self->entity_mode()->has_handling()) {
        $self->{len_handling_id} = $self->{_io}->read_u1();
    }
    if ($self->entity_mode()->has_handling()) {
        $self->{handling_id} = $self->{_io}->read_bytes($self->len_handling_id());
    }
    if ( (($self->entity_mode()->has_pspace()) && ($self->extra_flag()->has_viewport())) ) {
        $self->{viewport} = $self->{_io}->read_u2le();
    }
    $self->{x1} = $self->{_io}->read_f8le();
    $self->{y1} = $self->{_io}->read_f8le();
    if ($self->entity_mode()->has_elevation() == 0) {
        $self->{z1} = $self->{_io}->read_f8le();
    }
    $self->{x2} = $self->{_io}->read_f8le();
    $self->{y2} = $self->{_io}->read_f8le();
    if ($self->entity_mode()->has_elevation() == 0) {
        $self->{z2} = $self->{_io}->read_f8le();
    }
    if ($self->entity_common()->flag2_8()) {
        $self->{extrusion} = CAD::Format::DWG::AC1009::Point3d->new($self->{_io}, $self, $self->{_root});
    }
    $self->{crc16} = $self->{_io}->read_bytes(2);
}

sub entity_mode {
    my ($self) = @_;
    return $self->{entity_mode};
}

sub entity_size {
    my ($self) = @_;
    return $self->{entity_size};
}

sub entity_layer_index {
    my ($self) = @_;
    return $self->{entity_layer_index};
}

sub entity_common {
    my ($self) = @_;
    return $self->{entity_common};
}

sub entity_color {
    my ($self) = @_;
    return $self->{entity_color};
}

sub entity_linetype_index {
    my ($self) = @_;
    return $self->{entity_linetype_index};
}

sub entity_thickness {
    my ($self) = @_;
    return $self->{entity_thickness};
}

sub extra_flag {
    my ($self) = @_;
    return $self->{extra_flag};
}

sub eed {
    my ($self) = @_;
    return $self->{eed};
}

sub len_handling_id {
    my ($self) = @_;
    return $self->{len_handling_id};
}

sub handling_id {
    my ($self) = @_;
    return $self->{handling_id};
}

sub viewport {
    my ($self) = @_;
    return $self->{viewport};
}

sub x1 {
    my ($self) = @_;
    return $self->{x1};
}

sub y1 {
    my ($self) = @_;
    return $self->{y1};
}

sub z1 {
    my ($self) = @_;
    return $self->{z1};
}

sub x2 {
    my ($self) = @_;
    return $self->{x2};
}

sub y2 {
    my ($self) = @_;
    return $self->{y2};
}

sub z2 {
    my ($self) = @_;
    return $self->{z2};
}

sub extrusion {
    my ($self) = @_;
    return $self->{extrusion};
}

sub crc16 {
    my ($self) = @_;
    return $self->{crc16};
}

########################################################################
package CAD::Format::DWG::AC1009::DimType;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{flag_text_in_user_location} = $self->{_io}->read_bits_int_be(1);
    $self->{flag_x_type_ordinate} = $self->{_io}->read_bits_int_be(1);
    $self->{flag_block_for_dim_only} = $self->{_io}->read_bits_int_be(1);
    $self->{flag_u4} = $self->{_io}->read_bits_int_be(1);
    $self->{type} = $self->{_io}->read_bits_int_be(4);
}

sub flag_text_in_user_location {
    my ($self) = @_;
    return $self->{flag_text_in_user_location};
}

sub flag_x_type_ordinate {
    my ($self) = @_;
    return $self->{flag_x_type_ordinate};
}

sub flag_block_for_dim_only {
    my ($self) = @_;
    return $self->{flag_block_for_dim_only};
}

sub flag_u4 {
    my ($self) = @_;
    return $self->{flag_u4};
}

sub type {
    my ($self) = @_;
    return $self->{type};
}

########################################################################
package CAD::Format::DWG::AC1009::Ucs;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{flag} = CAD::Format::DWG::AC1009::UcsFlag->new($self->{_io}, $self, $self->{_root});
    $self->{ucs_name} = Encode::decode("ASCII", IO::KaitaiStruct::Stream::bytes_terminate($self->{_io}->read_bytes(32), 0, 0));
    $self->{ucs_org} = CAD::Format::DWG::AC1009::Point3d->new($self->{_io}, $self, $self->{_root});
    $self->{ucs_x_dir} = CAD::Format::DWG::AC1009::Point3d->new($self->{_io}, $self, $self->{_root});
    $self->{ucs_y_dir} = CAD::Format::DWG::AC1009::Point3d->new($self->{_io}, $self, $self->{_root});
}

sub flag {
    my ($self) = @_;
    return $self->{flag};
}

sub ucs_name {
    my ($self) = @_;
    return $self->{ucs_name};
}

sub ucs_org {
    my ($self) = @_;
    return $self->{ucs_org};
}

sub ucs_x_dir {
    my ($self) = @_;
    return $self->{ucs_x_dir};
}

sub ucs_y_dir {
    my ($self) = @_;
    return $self->{ucs_y_dir};
}

########################################################################
package CAD::Format::DWG::AC1009::Eed1002;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{value} = $self->{_io}->read_u1();
}

sub value {
    my ($self) = @_;
    return $self->{value};
}

########################################################################
package CAD::Format::DWG::AC1009::Table;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{item_size} = $self->{_io}->read_u2le();
    $self->{items} = $self->{_io}->read_u2le();
    $self->{unknown} = $self->{_io}->read_bytes(2);
    $self->{begin} = $self->{_io}->read_u4le();
}

sub item_size {
    my ($self) = @_;
    return $self->{item_size};
}

sub items {
    my ($self) = @_;
    return $self->{items};
}

sub unknown {
    my ($self) = @_;
    return $self->{unknown};
}

sub begin {
    my ($self) = @_;
    return $self->{begin};
}

########################################################################
package CAD::Format::DWG::AC1009::EntityPolyline;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{entity_mode} = CAD::Format::DWG::AC1009::EntityMode->new($self->{_io}, $self, $self->{_root});
    $self->{entity_size} = $self->{_io}->read_s2le();
    $self->{entity_layer_index} = $self->{_io}->read_s2le();
    $self->{entity_common} = CAD::Format::DWG::AC1009::EntityCommon->new($self->{_io}, $self, $self->{_root});
    if ($self->entity_mode()->has_color()) {
        $self->{entity_color} = $self->{_io}->read_s1();
    }
    if ($self->entity_mode()->has_linetype()) {
        $self->{entity_linetype_index} = $self->{_io}->read_s2le();
    }
    if ($self->entity_mode()->has_thickness()) {
        $self->{entity_thickness} = $self->{_io}->read_f8le();
    }
    if ($self->entity_mode()->has_elevation()) {
        $self->{entity_elevation} = $self->{_io}->read_f8le();
    }
    if ($self->entity_mode()->has_pspace()) {
        $self->{extra_flag} = CAD::Format::DWG::AC1009::ExtraFlag->new($self->{_io}, $self, $self->{_root});
    }
    if ( (($self->entity_mode()->has_pspace()) && ($self->extra_flag()->has_eed())) ) {
        $self->{eed} = CAD::Format::DWG::AC1009::Eed->new($self->{_io}, $self, $self->{_root});
    }
    if ($self->entity_mode()->has_handling()) {
        $self->{len_handling_id} = $self->{_io}->read_u1();
    }
    if ($self->entity_mode()->has_handling()) {
        $self->{handling_id} = $self->{_io}->read_bytes($self->len_handling_id());
    }
    if ( (($self->entity_mode()->has_pspace()) && ($self->extra_flag()->has_viewport())) ) {
        $self->{viewport} = $self->{_io}->read_u2le();
    }
    if ($self->entity_common()->flag2_8()) {
        $self->{flag} = CAD::Format::DWG::AC1009::PolylineFlags->new($self->{_io}, $self, $self->{_root});
    }
    if ($self->entity_common()->flag2_7()) {
        $self->{start_width} = $self->{_io}->read_f8le();
    }
    if ($self->entity_common()->flag2_6()) {
        $self->{end_width} = $self->{_io}->read_f8le();
    }
    if ($self->entity_common()->flag2_5()) {
        $self->{extrusion} = CAD::Format::DWG::AC1009::Point3d->new($self->{_io}, $self, $self->{_root});
    }
    if ($self->entity_common()->flag2_4()) {
        $self->{num_m_verts} = $self->{_io}->read_u2le();
    }
    if ($self->entity_common()->flag2_3()) {
        $self->{num_n_verts} = $self->{_io}->read_u2le();
    }
    if ($self->entity_common()->flag2_2()) {
        $self->{m_density} = $self->{_io}->read_u2le();
    }
    if ($self->entity_common()->flag2_1()) {
        $self->{n_density} = $self->{_io}->read_u2le();
    }
    if ($self->entity_common()->flag3_8()) {
        $self->{curve_type} = $self->{_io}->read_u2le();
    }
    if ($self->entity_common()->flag3_1()) {
        $self->{z} = $self->{_io}->read_f8le();
    }
    $self->{crc16} = $self->{_io}->read_bytes(2);
}

sub entity_mode {
    my ($self) = @_;
    return $self->{entity_mode};
}

sub entity_size {
    my ($self) = @_;
    return $self->{entity_size};
}

sub entity_layer_index {
    my ($self) = @_;
    return $self->{entity_layer_index};
}

sub entity_common {
    my ($self) = @_;
    return $self->{entity_common};
}

sub entity_color {
    my ($self) = @_;
    return $self->{entity_color};
}

sub entity_linetype_index {
    my ($self) = @_;
    return $self->{entity_linetype_index};
}

sub entity_thickness {
    my ($self) = @_;
    return $self->{entity_thickness};
}

sub entity_elevation {
    my ($self) = @_;
    return $self->{entity_elevation};
}

sub extra_flag {
    my ($self) = @_;
    return $self->{extra_flag};
}

sub eed {
    my ($self) = @_;
    return $self->{eed};
}

sub len_handling_id {
    my ($self) = @_;
    return $self->{len_handling_id};
}

sub handling_id {
    my ($self) = @_;
    return $self->{handling_id};
}

sub viewport {
    my ($self) = @_;
    return $self->{viewport};
}

sub flag {
    my ($self) = @_;
    return $self->{flag};
}

sub start_width {
    my ($self) = @_;
    return $self->{start_width};
}

sub end_width {
    my ($self) = @_;
    return $self->{end_width};
}

sub extrusion {
    my ($self) = @_;
    return $self->{extrusion};
}

sub num_m_verts {
    my ($self) = @_;
    return $self->{num_m_verts};
}

sub num_n_verts {
    my ($self) = @_;
    return $self->{num_n_verts};
}

sub m_density {
    my ($self) = @_;
    return $self->{m_density};
}

sub n_density {
    my ($self) = @_;
    return $self->{n_density};
}

sub curve_type {
    my ($self) = @_;
    return $self->{curve_type};
}

sub z {
    my ($self) = @_;
    return $self->{z};
}

sub crc16 {
    my ($self) = @_;
    return $self->{crc16};
}

########################################################################
package CAD::Format::DWG::AC1009::VportFlag;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{deleted} = $self->{_io}->read_bits_int_be(1);
    $self->{flag2} = $self->{_io}->read_bits_int_be(1);
    $self->{flag3} = $self->{_io}->read_bits_int_be(1);
    $self->{flag4} = $self->{_io}->read_bits_int_be(1);
    $self->{flag5} = $self->{_io}->read_bits_int_be(1);
    $self->{flag6} = $self->{_io}->read_bits_int_be(1);
    $self->{flag7} = $self->{_io}->read_bits_int_be(1);
    $self->{flag8} = $self->{_io}->read_bits_int_be(1);
}

sub deleted {
    my ($self) = @_;
    return $self->{deleted};
}

sub flag2 {
    my ($self) = @_;
    return $self->{flag2};
}

sub flag3 {
    my ($self) = @_;
    return $self->{flag3};
}

sub flag4 {
    my ($self) = @_;
    return $self->{flag4};
}

sub flag5 {
    my ($self) = @_;
    return $self->{flag5};
}

sub flag6 {
    my ($self) = @_;
    return $self->{flag6};
}

sub flag7 {
    my ($self) = @_;
    return $self->{flag7};
}

sub flag8 {
    my ($self) = @_;
    return $self->{flag8};
}

########################################################################
package CAD::Format::DWG::AC1009::View;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{u1} = $self->{_io}->read_bytes(4);
    $self->{view_name} = Encode::decode("ASCII", IO::KaitaiStruct::Stream::bytes_terminate($self->{_io}->read_bytes(32), 46, 0));
    $self->{view_size} = $self->{_io}->read_f8le();
    $self->{center_point} = CAD::Format::DWG::AC1009::Point2d->new($self->{_io}, $self, $self->{_root});
    $self->{view_width} = $self->{_io}->read_f8le();
    $self->{view_dir} = CAD::Format::DWG::AC1009::Point3d->new($self->{_io}, $self, $self->{_root});
    $self->{flag_3d} = $self->{_io}->read_u2le();
    $self->{u4} = $self->{_io}->read_bytes(58);
}

sub u1 {
    my ($self) = @_;
    return $self->{u1};
}

sub view_name {
    my ($self) = @_;
    return $self->{view_name};
}

sub view_size {
    my ($self) = @_;
    return $self->{view_size};
}

sub center_point {
    my ($self) = @_;
    return $self->{center_point};
}

sub view_width {
    my ($self) = @_;
    return $self->{view_width};
}

sub view_dir {
    my ($self) = @_;
    return $self->{view_dir};
}

sub flag_3d {
    my ($self) = @_;
    return $self->{flag_3d};
}

sub u4 {
    my ($self) = @_;
    return $self->{u4};
}

1;
