meta:
  id: dwg_ac1009
  title: AutoCAD drawing (AC1009)
  application: AutoCAD
  file-extension:
    - dwg
  xref:
    justsolve: DWG
    pronom:
      fmt: 32
    mime:
      - application/x-dwg
      - image/vnd.dwg
    wikidata: Q27863127
  license: CC0-1.0
  endian: le
seq:
  - id: header
    type: header
  - id: entities
    type: entities
  - id: table_blocks
    type: table_blocks
  - id: unknown1
    size: header.table_layer.begin - _io.pos - 16
  - id: table_layers
    type: table_layers
  - id: unknown2
    size: header.table_style.begin - _io.pos - 16
  - id: table_styles
    type: table_styles
  - id: unknown3
    size: header.table_linetype.begin - _io.pos - 16
  - id: table_linetypes
    type: table_linetypes
  - id: unknown4
    size: header.table_view.begin - _io.pos - 16
  - id: table_views
    type: table_views
  - id: unknown5
    size: header.variables.table_ucs.begin - _io.pos - 16
  - id: table_ucss
    type: table_ucss
  - id: unknown6
    size: header.variables.table_vport.begin - _io.pos - 16
  - id: table_vports
    type: table_vports
  - id: unknown7
    size: header.variables.table_appid.begin - _io.pos - 16
  - id: table_appids
    type: table_appids
  - id: unknown8
    size: header.variables.table_dimstyle.begin - _io.pos - 16
  - id: table_dimstyles
    type: table_dimstyles
  - id: unknown9
    size: header.variables.table_vx.begin - _io.pos - 16
  - id: table_vxs
    type: table_vxs
  - id: entities_block
    type: entities_block
  - id: entities_extra
    type: entities_extra
  - id: aux_header
    type: aux_header
    size: 170
  - id: todo
    size-eos: true
    repeat: eos
    if: not _io.eof
types:
  aux_header:
    seq:
      - id: aux_header_sentinel_begin
        contents: [0x29, 0x8D, 0xD1, 0x49, 0xA9, 0x73, 0x1F, 0xEA, 0x99, 0xDE, 0x32, 0xF9, 0x4D, 0x0A, 0xE0, 0x19]
      - id: num_aux_header_variables
        type: s2
      - id: aux_header_size
        type: s2
      - id: entities_start
        type: s4
      - id: entities_end
        type: s4
      - id: block_entities_start
        type: s4
      - id: extra_entities_start
        type: s4
      - id: handling
        type: u2
      - id: handseed
        size: 8
      - id: num_aux_tables
        type: u2
      - id: aux_tables
        type: aux_header_table
        repeat: expr
        repeat-expr: num_aux_tables
      - id: aux_header_address
        type: s4
      - id: crc16
        size: 2
      - id: aux_header_sentinel_end
        contents: [0xD6, 0x72, 0x2E, 0xB6, 0x56, 0x8C, 0xE0, 0x15, 0x66, 0x21, 0xCD, 0x06, 0xB2, 0xF5, 0x1F, 0xE6]
  aux_header_table:
    seq:
      - id: table_num
        type: u2
        enum: aux_table
      - id: item_size
        type: u2
      - id: items
        type: u2
      - id: begin
        type: u4
  block:
    seq:
      - id: flag
        type: block_flag
        doc: BLOCK/70
      - id: block_name
        size: 32
        type: str
        encoding: ASCII
        terminator: 0x00
        doc: BLOCK/2
      - id: used
        type: s2
      - id: begin_address_in_block_table_raw
        type: u4
      - id: block_entity
        type: s2
      - id: flag2
        type: block_flag2
      - id: u1
        type: s1
      - id: crc16
        size: 2
    instances:
      begin_address_in_block_table_unknown:
        value: (begin_address_in_block_table_raw & 0xff000000) >> 24
      begin_address_in_block_table:
        value: (begin_address_in_block_table_raw & 0x00ffffff)
  block_flag:
    seq:
      - id: references_external_reference
        type: b1
      - id: resolved_external_reference
        type: b1
      - id: flag3
        type: b1
      - id: flag4
        type: b1
      - id: flag5
        type: b1
      - id: flag6
        type: b1
      - id: none
        type: b1
      - id: anonymous
        type: b1
  block_flag2:
    seq:
      - id: flag1
        type: b1
      - id: flag2
        type: b1
      - id: flag3
        type: b1
      - id: flag4
        type: b1
      - id: flag5
        type: b1
      - id: flag6
        type: b1
      - id: flag7
        type: b1
      - id: flag8
        type: b1
  entities:
    seq:
      - id: entities_sentinel_begin
        contents: [0xC4, 0x6E, 0x68, 0x54, 0xF8, 0x6E, 0x33, 0x30, 0x63, 0x3E, 0xC1, 0x85, 0x2A, 0xDC, 0x94, 0x01]
      - id: entities
        type: real_entities
        size: _parent.header.entities_size
      - id: entities_sentinel_end
        contents: [0x3B, 0x91, 0x97, 0xAB, 0x07, 0x91, 0xCC, 0xCF, 0x9C, 0xC1, 0x3E, 0x7A, 0xD5, 0x23, 0x6B, 0xFE]
  entities_block:
    seq:
      - id: entities_block_sentinel_begin
        contents: [0x72, 0x2B, 0x7D, 0xEC, 0x3E, 0x8C, 0x88, 0x6C, 0x7A, 0x72, 0x0A, 0xFD, 0xC8, 0x6C, 0x84, 0x26]
      - id: entities_block
        type: real_entities
        size: _parent.header.block_entities_size
      - id: entities_block_sentinel_end
        contents: [0x8D, 0xD4, 0x82, 0x13, 0xC1, 0x73, 0x77, 0x93, 0x85, 0x8D, 0xF5, 0x02, 0x37, 0x93, 0x7B, 0xD9]
  entities_extra:
    seq:
      - id: entities_extra_sentinel_begin
        contents: [0xD5, 0xF9, 0xD3, 0xBB, 0x0A, 0xA9, 0x69, 0xA6, 0xCD, 0x1C, 0x87, 0xC7, 0xEE, 0x80, 0x4B, 0x17]
      - id: entities_extra
        type: real_entities
        size: _parent.header.extra_entities_size
      - id: entities_extra_sentinel_end
        contents: [0x2A, 0x06, 0x2C, 0x44, 0xF5, 0x56, 0x96, 0x59, 0x32, 0xE3, 0x78, 0x38, 0x11, 0x7F, 0xB4, 0xE8]
  extra_flag:
    seq:
      - id: flag1
        type: b1
      - id: flag2
        type: b1
      - id: flag3
        type: b1
      - id: flag4
        type: b1
      - id: flag5
        type: b1
      - id: has_viewport
        type: b1
      - id: has_eed
        type: b1
      - id: flag8
        type: b1
  header:
    seq:
      - id: magic
        contents: [0x41, 0x43, 0x31, 0x30, 0x30, 0x39]
        doc: 0x0000-0x0005, $ACADVER/1
      - id: zeros
        size: 6
      - id: zero_one_or_three
        type: s1
      - id: num_entity_sections
        type: s2
      - id: num_sections
        type: s2
      - id: num_header_vars
        type: s2
      - id: dwg_version
        type: s1
      - id: entities_start
        type: s4
      - id: entities_end
        type: s4
      - id: block_entities_start
        type: s4
      - id: block_entities_size_raw
        type: u4
      - id: extra_entities_start
        type: s4
      - id: extra_entities_size_raw
        type: u4
      - id: table_block
        type: header_table
      - id: table_layer
        type: header_table
      - id: table_style
        type: header_table
      - id: table_linetype
        type: header_table
      - id: table_view
        type: header_table
      - id: variables
        type: header_variables
      - id: crc16
        size: 2
    instances:
      entities_size:
        value: entities_end - entities_start
      extra_entities_size_unknown:
        value: (extra_entities_size_raw & 0xff000000) >> 24
      extra_entities_size:
        value: (extra_entities_size_raw & 0x00ffffff)
      block_entities_size_unknown:
        value: (block_entities_size_raw & 0xff000000) >> 24
      block_entities_size:
        value: (block_entities_size_raw & 0x00ffffff)
  header_table:
    seq:
      - id: item_size
        type: u2
      - id: items
        type: u2
      - id: unknown
        size: 2
      - id: begin
        type: u4
  header_variables:
    seq:
      - id: insertion_base
        type: point_3d
        doc: 0x005e-0x0075, $INSBASE/10|20|30
      - id: plinegen
        type: s2
        doc: 0x0076-0x0077, $PLINEGEN/70
      - id: drawing_first
        type: point_3d
        doc: 0x0078-0x008f, $EXTMIN/10|20|30
      - id: drawing_second
        type: point_3d
        doc: 0x0090-0x00a7, $EXTMAX/10|20|30
      - id: limits_min
        type: point_2d
        doc: 0x00a8-0x00b7, $LIMMIN/10|20
      - id: limits_max
        type: point_2d
        doc: 0x00b8-0x00c7, $LIMMAX/10|20
      - id: view_ctrl
        type: point_3d
        doc: 0x00c8-0x00da, $VIEWCTRL/10|20|30
      - id: view_size
        type: f8
        doc: 0x00e0-0x00e7, $VIEWSIZE/40
      - id: snap
        type: s2
        doc: 0x00e8-0x00e9, $SNAPMODE
      - id: snap_resolution
        type: point_2d
        doc: 0x00ea-0x00f9, $SNAPUNIT/10|20
      - id: snap_base
        type: point_2d
        doc: 0x00fa-0x0109, $SNAPBASE/10|20
      - id: snap_angle
        type: f8
        doc: 0x010a-0x0111, $SNAPANG
      - id: snap_style
        type: s2
        doc: 0x0112-0x0113, $SNAPSTYLE
      - id: snap_iso_pair
        type: s2
        enum: iso_plane
        doc: 0x0114-0x0115, $SNAPISOPAIR
      - id: grid
        type: s2
        doc: 0x0116-0x0117, $GRIDMODE
      - id: grid_unit
        type: point_2d
        doc: 0x0118-0x0127, $GRIDUNIT/10|20
      - id: ortho
        type: s2
        doc: 0x0128-0x0129, $ORTHOMODE
      - id: regen
        type: s2
        doc: 0x012a-0x012b, $REGENMODE
      - id: fill
        type: s2
        doc: 0x012c-0x012d, $FILLMODE
      - id: qtext
        type: s2
        doc: 0x012e-0x012f, $QTEXTMODE
      - id: drag
        type: s2
        doc: 0x0130-0x0131, $DRAGMODE
      - id: linetype_scale
        type: f8
        doc: 0x0132-0x0139, $LTSCALE
      - id: text_size
        type: f8
        doc: 0x013a-0x0141, $TEXTSIZE
      - id: trace_width
        type: f8
        doc: 0x0142-0x0149, $TRACEWID
      - id: current_layer_index
        type: s2
        doc: 0x014a-0x014b, $CLAYER
      - id: current_color_convert_lo
        type: s4
        doc: 0x014c-0x014f
      - id: current_color_convert_hi
        type: s4
        doc: 0x0150-0x0153
      - id: unknown1
        type: u2
        doc: 0x0154-0x0155
      - id: psltscale
        type: u2
        doc: 0x0156-0x0157, $PSLTSCALE/70
      - id: tree_depth
        type: u2
        doc: 0x0158-0x0159, $TREEDEPTH/70
      - id: unknown7d
        size: 2
        doc: 0x015a-0x015b
      - id: aspect_ratio
        type: f8
        doc: 0x015c-0x0163
      - id: linear_units_format
        enum: unit_types
        type: s2
        doc: 0x0164-0x0165, $LUNITS
      - id: linear_units_precision
        type: s2
        doc: 0x0166-0x0167, $LUPREC
      - id: axis
        type: s2
        doc: 0x0168-0x0169, $AXISMODE/70
      - id: axis_value
        type: point_2d
        doc: 0x016a-0x0179, $AXISUNIT/10|20
      - id: sketch_increment
        type: f8
        doc: 0x017a-0x0181, $SKETCHINC
      - id: fillet_radius
        type: f8
        doc: $FILLETRAD/40
      - id: units_for_angles
        enum: units_for_angles
        type: s2
        doc: $AUNITS
      - id: angular_precision
        type: s2
        doc: $AUPREC
      - id: text_style_index
        type: s2
        doc: 0x018e-0x018f, $TEXTSTYLE (index)
      - id: osnap
        enum: osnap_modes
        type: s2
        doc: 0x0190-0x0191, $OSMODE
      - id: att_visibility
        enum: att_visibility
        type: s2
        doc: 0x0192-0x0193, $ATTMODE/70
      - id: menu
        size: 15
        type: str
        encoding: ASCII
        terminator: 0x00
        doc: 0x0194-0x01a2, $MENU
      - id: dim_scale
        type: f8
        doc: 0x01a3-0x01aa, $DIMSCALE
      - id: dim_arrowhead_size
        type: f8
        doc: $DIMASZ
      - id: dim_extension_line_offset
        type: f8
        doc: $DIMEXO
      - id: dim_baseline_spacing
        type: f8
        doc: $DIMDLI
      - id: dim_extension_line_extend
        type: f8
        doc: $DIMEXE
      - id: dim_maximum_tolerance_limit
        type: f8
        doc: 0x01cb-0x01d2, $DIMTP
      - id: dim_minimum_tolerance_limit
        type: f8
        doc: 0x01d3-0x01da, $DIMTM
      - id: dim_text_height
        type: f8
        doc: 0x01db-0x01e2, $DIMTXT
      - id: dim_center_mark_control
        type: f8
        doc: 0x01e3-0x01ea, $DIMCEN
      - id: dim_oblique_stroke_size
        type: f8
        doc: 0x01eb-0x01f2, $DIMTSZ
      - id: dim_tolerances
        type: s1
        doc: 0x01f3, $DIMTOL
      - id: dim_limits_default_text
        type: s1
        doc: 0x01f4, $DIMLIM
      - id: dim_text_ext_inside_line_position
        type: s1
        doc: 0x01f5, $DIMTIH
      - id: dim_text_ext_outside_line_position
        type: s1
        doc: 0x01f6, $DIMTOH
      - id: dim_extension_line_first_suppress
        type: s1
        doc: 0x01f7, $DIMSE1
      - id: dim_extension_line_second_suppress
        type: s1
        doc: 0x01f8, $DIMSE2
      - id: dim_text_vertical_position
        type: s1
        doc: 0x01f9, $DIMTAD
      - id: limits_check
        enum: limits_check
        type: s2
        doc: 0x01fa-0x01fb, $LIMCHECK
      - id: menu2
        size: 45
        type: str
        encoding: ASCII
        terminator: 0x00
        doc: 0x01fc-0x0228, $MENU continues
      - id: elevation
        type: f8
        doc: 0x0229-0x0230, $ELEVATION
      - id: thickness
        type: f8
        doc: 0x0231-0x0238, $THICKNESS
      - id: view_dir
        type: point_3d
        doc: 0x0239-0x0251, $VIEWDIR/10|20|30
      - id: view_point_x
        type: point_3d
      - id: view_point_y
        type: point_3d
      - id: view_point_z
        type: point_3d
      - id: view_point_x_alt
        type: point_3d
      - id: view_point_y_alt
        type: point_3d
      - id: view_point_z_alt
        type: point_3d
      - id: flag_3d
        type: s2
        doc: 0x02e1-0x02e2
      - id: blip
        type: s2
        doc: 0x02e3-0x02e4, $BLIPMODE
      - id: dim_suppression_of_zeros
        type: s1
        doc: 0x02e5, $DIMZIN
      - id: dim_rounding
        type: f8
        doc: 0x02e6-0x02ed, $DIMRND
      - id: dim_extension_line_extend2
        type: f8
        doc: 0x02ee-0x02f5, $DIMDLE
      - id: dim_arrowhead_block
        size: 33
        type: str
        encoding: ASCII
        terminator: 0x00
        doc: $DIMBLK
      - id: circle_zoom_percent
        type: s2
        doc: 0x0317-0x0318
      - id: coordinates
        enum: coordinates
        type: s2
        doc: 0x0319-0x031a, $COORDS
      - id: current_color
        enum: current_color
        type: s2
        doc: 256d - bylayer, 0d - byblock, other index (1-255), $CECOLOR
      - id: current_linetype
        enum: current_linetype
        type: s2
        doc: 256d - bylayer, 255d - byblock, other index, $CELTYPE
      - id: create_date_days
        type: u4
        doc: $TDCREATE/days
      - id: create_date_ms
        type: u4
        doc: $TDCREATE/ms
      - id: update_date_days
        type: u4
        doc: $TDUPDATE/days
      - id: update_date_ms
        type: u4
        doc: $TDUPDATE/ms
      - id: total_editing_time_days
        type: u4
        doc: $TDINDWG/days
      - id: total_editing_time_ms
        type: u4
        doc: $TDINDWG/ms
      - id: user_elapsed_timer_days
        type: u4
        doc: $TDUSRTIMER/days
      - id: user_elapsed_timer_ms
        type: u4
        doc: $TDUSRTIMER/ms
      - id: user_timer
        type: s2
        doc: 0x033f-0x0340, $USRTIMER/70
      - id: fast_zoom
        type: u2
        doc: 0x0341-0x0342, $FASTZOOM/70
      - id: sketch_type
        type: u2
        doc: 0x0343-0x0344, $SKPOLY/70
      - id: unknown_date
        type: unknown_date
      - id: angle_base
        type: f8
        doc: 0x0353-0x035a, $ANGBASE/50
      - id: angle_direction
        enum: angle_direction
        type: s2
        doc: 0x035b-0x035c, $ANGDIR/70
      - id: point_mode
        type: s2
        doc: 0x035d-0x035e, $PDMODE/70
      - id: point_size
        type: f8
        doc: $PDSIZE/40
      - id: polyline_width
        type: f8
        doc: $PLINEWID/40
      - id: user_integer_1
        type: s2
        doc: 0x035f-0x0360, $USERI1/70
      - id: user_integer_2
        type: s2
        doc: 0x0361-0x0362, $USERI2/70
      - id: user_integer_3
        type: s2
        doc: 0x0363-0x0364, $USERI3/70
      - id: user_integer_4
        type: s2
        doc: 0x0365-0x0366, $USERI4/70
      - id: user_integer_5
        type: s2
        doc: 0x0367-0x0368, $USERI5/70
      - id: user_real_1
        type: f8
        doc: $USERR1/40
      - id: user_real_2
        type: f8
        doc: $USERR2/40
      - id: user_real_3
        type: f8
        doc: $USERR3/40
      - id: user_real_4
        type: f8
        doc: $USERR4/40
      - id: user_real_5
        type: f8
        doc: $USERR5/40
      - id: dim_alternate_units
        type: s1
        doc: 0x03a1, $DIMALT/70
      - id: dim_alternate_units_decimal_places
        type: s1
        doc: 0x03a2, $DIMALTD/70
      - id: dim_associative
        type: s1
        doc: 0x03a3, $DIMASO/70
      - id: dim_sho
        type: s1
        doc: 0x03a4, $DIMSHO/70
      - id: dim_measurement_postfix
        size: 16
        type: str
        encoding: ASCII
        terminator: 0x00
        doc: $DIMPOST/1
      - id: dim_alternate_measurement_postfix
        size: 16
        type: str
        encoding: ASCII
        terminator: 0x00
        doc: $DIMAPOST/1
      - id: dim_alternate_units_multiplier
        type: f8
        doc: 0x03c5-0x03cc, $DIMALTF/40
      - id: dim_linear_measurements_scale_factor
        type: f8
        doc: 0x03cd-0x03d4, $DIMLFAC/40
      - id: spline_segs
        type: s2
        doc: 0x03d5-0x03d6, $SPLINESEGS/70
      - id: spline_frame
        type: s2
        doc: 0x03d7-0x03d8, $SPLFRAME/70
      - id: attreq
        type: u2
        doc: 0x03d9-0x03da, $ATTREQ/70
      - id: attdia
        type: u2
        doc: 0x03db-0x03dc, $ATTDIA/70
      - id: chamfera
        type: f8
        doc: 0x03dd-0x04e4, $CHAMFERA/40
      - id: chamferb
        type: f8
        doc: 0x04e5-0x04ec, $CHAMFERB/40
      - id: mirror_text
        type: s2
        doc: 0x03ed-0x03ee, $MIRRTEXT/70
      - id: table_ucs
        type: header_table
      - id: dwgcodepage
        type: u2
        enum: dwgcodepage
      - id: ucs_origin_point
        type: point_3d
        doc: $UCSORG/10|20|30
      - id: ucs_x_dir
        type: point_3d
        doc: $UCSXDIR/11|21|31 ~ $UCSXORI
      - id: ucs_y_dir
        type: point_3d
        doc: $UCSYDIR/12|22|32 ~ $UCSYORI
      - id: target
        type: point_3d
        doc: $TARGET
      - id: lens_length
        type: f8
        doc: $LENSLENGTH
      - id: view_rotation_angle_radians
        type: f8
        doc: $VIEWTWIST
      - id: frontz_z
        type: f8
        doc: $FRONTZ
      - id: backz_z
        type: f8
        doc: $BACKZ
      - id: view_mode
        type: u2
        doc: $VIEWMODE
      - id: dim_tofl
        type: u1
        doc: 0x047d, $DIMTOFL/70
      - id: dim_arrowhead_block1
        size: 33
        type: str
        encoding: ASCII
        terminator: 0x00
        doc: $DIMBLK1/1
      - id: dim_arrowhead_block2
        size: 33
        type: str
        encoding: ASCII
        terminator: 0x00
        doc: $DIMBLK2/1
      - id: dim_arrowhead_blocks_control
        type: u1
        doc: $DIMSAH/70
      - id: dim_text_between_ext_lines
        type: u1
        doc: $DIMTIX/70
      - id: dim_arrowhead_suppress
        type: u1
        doc: $DIMSOXD/70
      - id: dim_text_vertical_position_size
        type: f8
        doc: $DIMTVP/40
      - id: unknown_string
        size: 33
        type: str
        encoding: ASCII
        terminator: 0x00
      - id: handling
        type: u2
        doc: $HANDLING/70
      - id: handseed
        size: 8
        doc: 0x04ee-0x04f5, $HANDSEED/5, in hex
      - id: surfu
        type: u2
        doc: $SURFU/70
      - id: surfv
        type: u2
        doc: $SURFV/70
      - id: surftype
        type: u2
        doc: $SURFTYPE/70
      - id: surftab1
        type: u2
        doc: $SURFTAB1/70
      - id: surftab2
        type: u2
        doc: $SURFTAB2/70
      - id: table_vport
        type: header_table
      - id: flatland
        type: u2
        doc: 0x050a-0x050b, $FLATLAND
      - id: spline_type
        type: u2
        enum: spline_type
        doc: 0x050c-0x050d, $SPLINETYPE/70
      - id: ucs_icon
        type: u2
        doc: $UCSICON
      - id: ucs_name_index
        type: u2
        doc: $UCSNAME/2
      - id: table_appid
        type: header_table
        doc: 0x0512-0x051c
      - id: world_view
        type: u2
        doc: 0x051d-0x051e, $WORLDVIEW/70
      - id: unknown49a
        type: u2
      - id: unknown49b
        type: u2
      - id: table_dimstyle
        type: header_table
      - id: unknown49c
        size: 5
      - id: dim_line_color
        type: u2
        doc: $DIMCLRD_C/70
      - id: dim_clre_c
        type: u2
        doc: $DIMCLRE_C/70
      - id: dim_clrt_c
        type: u2
        doc: $DIMCLRT_C/70
      - id: shade_edge
        type: u2
        doc: $SHADEDGE/70
      - id: shade_dif
        type: u2
        doc: $SHADEDIF/70
      - id: unknown_pre50
        size: 2
      - id: unit_mode
        type: u2
        doc: $UNITMODE/70
      - id: unit1_ratio
        type: f8
      - id: unit2_ratio
        type: f8
      - id: unit3_ratio
        type: f8
      - id: unit4_ratio
        type: f8
      - id: unit1_name
        size: 32
        type: str
        encoding: ASCII
        terminator: 0x00
      - id: unit2_name
        size: 32
        type: str
        encoding: ASCII
        terminator: 0x00
      - id: unit3_name
        size: 32
        type: str
        encoding: ASCII
        terminator: 0x00
      - id: unit4_name
        size: 32
        type: str
        encoding: ASCII
        terminator: 0x00
      - id: dim_tfac
        type: f8
        doc: $DIMTFAC/40
      - id: p_ucs_org
        type: point_3d
        doc: $PUCSORG/10
      - id: p_ucs_xdir
        type: point_3d
        doc: $PUCSXDIR/11
      - id: p_ucs_ydir
        type: point_3d
        doc: $PUCSXDIR/12
      - id: p_ucs_name_index
        type: u2
        doc: $PUCSNAME/2
      - id: tile_mode
        type: u2
        doc: $TILEMODE/70
      - id: plim_check
        type: u2
        doc: $PLIMCHECK/70
      - id: unknown57
        type: u2
      - id: p_ext_min
        type: point_3d
        doc: $PEXTMIN/10
      - id: p_ext_max
        type: point_3d
        doc: $PEXTMAX/10
      - id: p_lim_min
        type: point_2d
        doc: $PLIMMIN/10
      - id: p_lim_max
        type: point_2d
        doc: $PLIMMAX/10
      - id: p_insertion_base
        type: point_3d
        doc: $PINSBASE/10|20|30
      - id: table_vx
        type: header_table
        doc: 0x069f-0x06a8
      - id: max_actvp
        type: u2
        doc: $MAXACTVP/70
      - id: dim_gap
        type: f8
        doc: $DIMGAP/40
      - id: p_elevation
        type: f8
        doc: $PELEVATION/40
      - id: vis_retain
        type: u2
        doc: $VISRETAIN/70
        if: _parent.num_header_vars == 205
    instances:
      create_date:
        value: create_date_days + (create_date_ms / 86400000.0)
      update_date:
        value: update_date_days + (update_date_ms / 86400000.0)
  unknown_repeating:
    seq:
      - id: unknown_repeating1
        type: f8
      - id: unknown_repeating2
        type: f8
      - id: unknown_repeating3
        type: f8
      - id: unknown_repeating4
        type: f8
      - id: unknown_repeating5
        type: f8
      - id: unknown_repeating6
        type: f8
      - id: unknown_repeating7
        type: f8
      - id: unknown_repeating8
        type: f8
      - id: unknown_repeating9
        type: f8
      - id: unknown_repeating10
        type: f8
      - id: unknown_repeating11
        type: f8
      - id: unknown_repeating12
        type: f8
      - id: unknown_repeating13
        type: f8
      - id: unknown_repeating14
        type: f8
      - id: unknown_repeating15
        type: f8
      - id: unknown_repeating16
        type: f8
      - id: unknown_repeating17
        type: f8
      - id: unknown_repeating18
        type: f8
  unknown_date:
    seq:
      - id: month
        type: u2
      - id: day
        type: u2
      - id: year
        type: u2
      - id: hour
        type: u2
      - id: minute
        type: u2
      - id: second
        type: u2
      - id: ms
        type: u2
  entity:
    seq:
      - id: entity_type
        type: s1
        enum: entities
      - id: data
        type:
          switch-on: entity_type
          cases:
            'entities::arc': entity_arc
            'entities::attdef': entity_attdef
            'entities::attrib': entity_attrib
            'entities::block_begin': entity_block_begin
            'entities::block_end': entity_block_end
            'entities::insert' : entity_insert
            'entities::circle': entity_circle
            'entities::dim': entity_dim
            'entities::face3d': entity_face3d
            'entities::jump': entity_jump
            'entities::line': entity_line
            'entities::point': entity_point
            'entities::polyline': entity_polyline
            'entities::seqend': entity_seqend
            'entities::shape': entity_shape
            'entities::solid': entity_solid
            'entities::text': entity_text
            'entities::trace': entity_trace
            'entities::vertex': entity_vertex
            'entities::vport': entity_vport
            _: entity_tmp
  entity_mode:
    seq:
      - id: has_attributes
        type: b1
      - id: has_pspace
        type: b1
      - id: has_handling
        type: b1
      - id: entity_mode4
        type: b1
      - id: has_thickness
        type: b1
      - id: has_elevation
        type: b1
      - id: has_linetype
        type: b1
      - id: has_color
        type: b1
  entity_common:
    seq:
      - id: flag2_1
        type: b1
      - id: flag2_2
        type: b1
      - id: flag2_3
        type: b1
      - id: flag2_4
        type: b1
      - id: flag2_5
        type: b1
      - id: flag2_6
        type: b1
      - id: flag2_7
        type: b1
      - id: flag2_8
        type: b1
      - id: flag3_1
        type: b1
      - id: flag3_2
        type: b1
      - id: flag3_3
        type: b1
      - id: flag3_4
        type: b1
      - id: flag3_5
        type: b1
      - id: flag3_6
        type: b1
      - id: flag3_7
        type: b1
      - id: flag3_8
        type: b1
  eed:
    seq:
      - id: len_eed_data
        type: u2
      - id: eed_data
        type: eed_data
        size: len_eed_data
  eed_data:
    seq:
      - id: eeds
        type: eed_detect
        repeat: eos
  eed_detect:
    seq:
      - id: separator
        type: u1
        enum: eeds
      - id: data
        type:
          switch-on: separator
          cases:
            'eeds::eed_1000': eed_1000
            'eeds::eed_1001': eed_1001
            'eeds::eed_1002': eed_1002
            'eeds::eed_1003': eed_1003
            'eeds::eed_1004': eed_1004
            'eeds::eed_1005': eed_1005
            'eeds::eed_1010': eed_1010
            'eeds::eed_1040': eed_1040
            'eeds::eed_1070': eed_1070
            'eeds::eed_1071': eed_1071
  eed_1000:
    seq:
      - id: name_size
        type: u1
      - id: name
        size: name_size
        type: str
        encoding: ASCII
  eed_1001:
    seq:
      - id: value
        type: u2
  eed_1002:
    seq:
      - id: value
        type: u1
  eed_1003:
    seq:
      - id: value
        type: u2
  eed_1004:
    seq:
      - id: len_value
        type: u1
      - id: value
        size: len_value
  eed_1005:
    seq:
      - id: value
        size: 8
  eed_1010:
    seq:
      - id: value
        type: point_3d
  eed_1040:
    seq:
      - id: value
        type: f8
  eed_1070:
    seq:
      - id: value
        type: u2
  eed_1071:
    seq:
      - id: value
        type: u4
  entity_arc:
    seq:
      - id: entity_mode
        type: entity_mode
      - id: entity_size
        type: s2
      - id: entity_layer_index
        type: s2
      - id: entity_common
        type: entity_common
      - id: extra_flag
        type: extra_flag
        if: entity_mode.has_pspace
      - id: eed
        type: eed
        if: entity_mode.has_pspace and extra_flag.has_eed
      - id: entity_color
        type: s1
        if: entity_mode.has_color
      - id: entity_linetype_index
        type: s2
        if: entity_mode.has_linetype
      - id: entity_thickness
        type: f8
        if: entity_mode.has_thickness
      - id: entity_elevation
        type: f8
        if: entity_mode.has_elevation
      - id: len_handling_id
        type: u1
        if: entity_mode.has_handling
      - id: handling_id
        size: len_handling_id
        if: entity_mode.has_handling
      - id: viewport
        type: u2
        if: entity_mode.has_pspace and extra_flag.has_viewport
      - id: center_point
        type: point_2d
        doc: ARC/10|20
      - id: radius
        type: f8
        doc: ARC/40
      - id: angle_from
        type: f8
        doc: ARC/50
      - id: angle_to
        type: f8
        doc: ARC/51
      - id: extrusion
        type: point_3d
        if: entity_common.flag2_8
        doc: ARC/210
      - id: crc16
        size: 2
  entity_attdef:
    seq:
      - id: entity_mode
        type: entity_mode
      - id: entity_size
        type: s2
      - id: entity_layer_index
        type: s2
      - id: entity_common
        type: entity_common
      - id: extra_flag
        type: extra_flag
        if: entity_mode.has_pspace
      - id: eed
        type: eed
        if: entity_mode.has_pspace and extra_flag.has_eed
      - id: entity_color
        type: s1
        if: entity_mode.has_color
      - id: entity_linetype_index
        type: s2
        if: entity_mode.has_linetype
      - id: entity_thickness
        type: f8
        if: entity_mode.has_thickness
      - id: entity_elevation
        type: f8
        if: entity_mode.has_elevation
      - id: len_handling_id
        type: u1
        if: entity_mode.has_handling
      - id: handling_id
        size: len_handling_id
        if: entity_mode.has_handling
      - id: viewport
        type: u2
        if: entity_mode.has_pspace and extra_flag.has_viewport
      - id: start_point
        type: point_2d
        doc: ATTDEF/10|20
      - id: height
        type: f8
        doc: ATTDEF/40
      - id: default_size
        type: s2
      - id: default
        size: default_size
        type: str
        encoding: ASCII
        terminator: 0x00
        doc: ATTDEF/1
      - id: prompt_size
        type: s2
      - id: prompt
        size: prompt_size
        type: str
        encoding: ASCII
        terminator: 0x00
        doc: ATTDEF/3
      - id: len_tag
        type: s2
      - id: tag
        size: len_tag
        type: str
        encoding: ASCII
        terminator: 0x00
        doc: ATTDEF/2
      - id: flags
        type: attdef_flags
        doc: ATTDEF/70
      - id: rotation_angle_in_radians
        type: f8
        if: entity_common.flag2_7
        doc: ATTDEF/50
      - id: width_scale_factor
        type: f8
        if: entity_common.flag2_6
        doc: ATTDEF/41
      - id: obliquing_angle_in_radians
        type: f8
        if: entity_common.flag2_5
        doc: ATTDEF/51
      - id: text_style_index
        type: u1
        if: entity_common.flag2_4
        doc: ATTDEF/7
      - id: generation
        type: generation_flags
        if: entity_common.flag2_3
        doc: ATTDEF/71
      - id: horiz_alignment
        type: u1
        enum: horiz_alignment
        if: entity_common.flag2_2
        doc: ATTDEF/72
      - id: end_point
        type: point_2d
        if: entity_common.flag2_1
        doc: ATTDEF/11|21
      - id: extrusion
        type: point_3d
        if: entity_common.flag3_8
        doc: ATTDEF/210|220|230
      - id: vertical_alignment
        type: u1
        if: entity_common.flag3_7
        doc: ATTDEF/74
      - id: crc16
        size: 2
  entity_attrib:
    seq:
      - id: entity_mode
        type: entity_mode
      - id: entity_size
        type: s2
      - id: entity_layer_index
        type: s2
      - id: entity_common
        type: entity_common
      - id: extra_flag
        type: extra_flag
        if: entity_mode.has_pspace
      - id: eed
        type: eed
        if: entity_mode.has_pspace and extra_flag.has_eed
      - id: entity_color
        type: s1
        if: entity_mode.has_color
      - id: entity_linetype_index
        type: s2
        if: entity_mode.has_linetype
      - id: entity_thickness
        type: f8
        if: entity_mode.has_thickness
      - id: entity_elevation
        type: f8
        if: entity_mode.has_elevation
      - id: len_handling_id
        type: u1
        if: entity_mode.has_handling
      - id: handling_id
        size: len_handling_id
        if: entity_mode.has_handling
      - id: viewport
        type: u2
        if: entity_mode.has_pspace and extra_flag.has_viewport
      - id: point_from
        type: point_2d
        doc: ATTRIB/10|20
      - id: height
        type: f8
        doc: ATTRIB/40
      - id: len_value
        type: s2
      - id: value
        size: len_value
        type: str
        encoding: ASCII
        terminator: 0x00
        doc: ATTRIB/1
      - id: len_tag
        type: s2
      - id: tag
        size: len_tag
        type: str
        encoding: ASCII
        terminator: 0x00
        doc: ATTRIB/2
      - id: flags
        type: attr_flags
        doc: ATTRIB/70
      - id: rotation_angle_in_radians
        type: f8
        if: entity_common.flag2_7
        doc: ATTRIB/50
      - id: width_scale_factor
        type: f8
        if: entity_common.flag2_6
        doc: ATTRIB/41
      - id: obliquing_angle_in_radians
        type: f8
        if: entity_common.flag2_5
        doc: ATTRIB/51
      - id: text_style_index
        type: u1
        if: entity_common.flag2_4
        doc: ATTRIB/7
      - id: generation
        type: generation_flags
        if: entity_common.flag2_3
        doc: ATTRIB/71
      - id: horiz_alignment
        type: u1
        enum: horiz_alignment
        if: entity_common.flag2_2
        doc: ATTRIB/72
      - id: aligned_to
        type: point_2d
        if: entity_common.flag2_1
        doc: ATTRIB/11|21
      - id: extrusion
        type: point_3d
        if: entity_common.flag3_8
        doc: ATTRIB/210|220|230
      - id: vertical_alignment
        type: u1
        if: entity_common.flag3_7
        doc: ATTRIB/74
      - id: crc16
        size: 2
  attr_flags:
    seq:
      - id: flag1
        type: b1
      - id: flag2
        type: b1
      - id: flag3
        type: b1
      - id: flag4
        type: b1
      - id: flag5
        type: b1
      - id: verify
        type: b1
      - id: constant
        type: b1
      - id: invisible
        type: b1
  entity_block_begin:
    seq:
      - id: entity_mode
        type: entity_mode
      - id: entity_size
        type: s2
      - id: entity_layer_index
        type: s2
      - id: entity_common
        type: entity_common
      - id: extra_flag
        type: extra_flag
        if: entity_mode.has_pspace
      - id: eed
        type: eed
        if: entity_mode.has_pspace and extra_flag.has_eed
      - id: entity_color
        type: s1
        if: entity_mode.has_color
      - id: entity_linetype_index
        type: s2
        if: entity_mode.has_linetype
      - id: entity_thickness
        type: f8
        if: entity_mode.has_thickness
      - id: entity_elevation
        type: f8
        if: entity_mode.has_elevation
      - id: len_handling_id
        type: u1
        if: entity_mode.has_handling
      - id: handling_id
        size: len_handling_id
        if: entity_mode.has_handling
      - id: viewport
        type: u2
        if: entity_mode.has_pspace and extra_flag.has_viewport
      - id: insert_point
        type: point_2d
        doc: BLOCK/10|20
      - id: len_xref_pname
        type: u2
        if: entity_common.flag2_7
      - id: xref_pname
        size: len_xref_pname
        type: str
        encoding: ASCII
        if: entity_common.flag2_7
        doc: BLOCK/1
      - id: len_name
        type: u2
        if: entity_common.flag2_6
      - id: name
        size: len_name
        type: str
        encoding: ASCII
        if: entity_common.flag2_6
        doc: BLOCK/3
      - id: crc16
        size: 2
  entity_block_end:
    seq:
      - id: entity_mode
        type: entity_mode
      - id: entity_size
        type: s2
      - id: entity_layer_index
        type: s2
      - id: entity_common
        type: entity_common
      - id: extra_flag
        type: extra_flag
        if: entity_mode.has_pspace
      - id: eed
        type: eed
        if: entity_mode.has_pspace and extra_flag.has_eed
      - id: entity_color
        type: s1
        if: entity_mode.has_color
      - id: entity_linetype_index
        type: s2
        if: entity_mode.has_linetype
      - id: entity_thickness
        type: f8
        if: entity_mode.has_thickness
      - id: entity_elevation
        type: f8
        if: entity_mode.has_elevation
      - id: len_handling_id
        type: u1
        if: entity_mode.has_handling
      - id: handling_id
        size: len_handling_id
        if: entity_mode.has_handling
      - id: viewport
        type: u2
        if: entity_mode.has_pspace and extra_flag.has_viewport
      - id: crc16
        size: 2
  entity_insert:
    seq:
      - id: entity_mode
        type: entity_mode
      - id: entity_size
        type: s2
      - id: entity_layer_index
        type: s2
      - id: entity_insert_flags
        type: entity_insert_flags
      - id: extra_flag
        type: extra_flag
        if: entity_mode.has_pspace
      - id: eed
        type: eed
        if: entity_mode.has_pspace and extra_flag.has_eed
      - id: entity_color
        type: s1
        if: entity_mode.has_color
      - id: entity_linetype_index
        type: s2
        if: entity_mode.has_linetype
      - id: entity_elevation
        type: f8
        if: entity_mode.has_elevation
      - id: entity_thickness
        type: f8
        if: entity_mode.has_thickness
      - id: len_handling_id
        type: u1
        if: entity_mode.has_handling
      - id: handling_id
        size: len_handling_id
        if: entity_mode.has_handling
      - id: viewport
        type: u2
        if: entity_mode.has_pspace and extra_flag.has_viewport
      - id: block_index
        type: s2
        doc: INSERT/2
      - id: x
        type: f8
        doc: INSERT/10
      - id: y
        type: f8
        doc: INSERT/20
      - id: x_scale
        type: f8
        if: entity_insert_flags.has_x_scale
        doc: INSERT/41
      - id: y_scale
        type: f8
        if: entity_insert_flags.has_y_scale
        doc: INSERT/42
      - id: rotation_angle_in_radians
        type: f8
        if: entity_insert_flags.has_rotation
        doc: INSERT/50
      - id: z_scale
        type: f8
        if: entity_insert_flags.has_z_scale
        doc: INSERT/43
      - id: columns
        type: u2
        if: entity_insert_flags.has_columns
        doc: INSERT/70
      - id: rows
        type: u2
        if: entity_insert_flags.has_rows
        doc: INSERT/71
      - id: column_spacing
        type: f8
        if: entity_insert_flags.has_column_spacing
        doc: INSERT/44
      - id: row_spacing
        type: f8
        if: entity_insert_flags.has_row_spacing
        doc: INSERT/45
      - id: extrusion
        type: point_3d
        if: entity_insert_flags.has_extrusion
        doc: INSERT/210
      - id: crc16
        size: 2
  entity_insert_flags:
    seq:
      - id: has_row_spacing
        type: b1
      - id: has_column_spacing
        type: b1
      - id: has_rows
        type: b1
      - id: has_columns
        type: b1
      - id: has_z_scale
        type: b1
      - id: has_rotation
        type: b1
      - id: has_y_scale
        type: b1
      - id: has_x_scale
        type: b1
      - id: flag3_1
        type: b1
      - id: flag3_2
        type: b1
      - id: flag3_3
        type: b1
      - id: flag3_4
        type: b1
      - id: flag3_5
        type: b1
      - id: flag3_6
        type: b1
      - id: flag3_7
        type: b1
      - id: has_extrusion
        type: b1
  entity_circle:
    seq:
      - id: entity_mode
        type: entity_mode
      - id: entity_size
        type: s2
      - id: entity_layer_index
        type: s2
      - id: entity_common
        type: entity_common
      - id: extra_flag
        type: extra_flag
        if: entity_mode.has_pspace
      - id: eed
        type: eed
        if: entity_mode.has_pspace and extra_flag.has_eed
      - id: entity_color
        type: s1
        if: entity_mode.has_color
      - id: entity_linetype_index
        type: s2
        if: entity_mode.has_linetype
      - id: entity_thickness
        type: f8
        if: entity_mode.has_thickness
      - id: entity_elevation
        type: f8
        if: entity_mode.has_elevation
      - id: len_handling_id
        type: u1
        if: entity_mode.has_handling
      - id: handling_id
        size: len_handling_id
        if: entity_mode.has_handling
      - id: viewport
        type: u2
        if: entity_mode.has_pspace and extra_flag.has_viewport
      - id: center_point
        type: point_2d
        doc: CIRCLE/10|20
      - id: radius
        type: f8
        doc: CIRCLE/40
      - id: extrusion
        type: point_3d
        if: entity_common.flag2_8
        doc: CIRCLE/210
      - id: crc16
        size: 2
  entity_dim:
    seq:
      - id: entity_mode
        type: entity_mode
      - id: entity_size
        type: s2
      - id: entity_layer_index
        type: s2
      - id: entity_common
        type: entity_common
      - id: extra_flag
        type: extra_flag
        if: entity_mode.has_pspace
      - id: eed
        type: eed
        if: entity_mode.has_pspace and extra_flag.has_eed
      - id: entity_color
        type: s1
        if: entity_mode.has_color
      - id: entity_linetype_index
        type: s2
        if: entity_mode.has_linetype
      - id: entity_thickness
        type: f8
        if: entity_mode.has_thickness
      - id: entity_elevation
        type: f8
        if: entity_mode.has_elevation
      - id: len_handling_id
        type: u1
        if: entity_mode.has_handling
      - id: handling_id
        size: len_handling_id
        if: entity_mode.has_handling
      - id: viewport
        type: u2
        if: entity_mode.has_pspace and extra_flag.has_viewport
      - id: block_index
        type: s2
      - id: dimension_line_defining_point
        type: point_3d
        doc: DIMENSION/10|20|30
      - id: default_text_position
        type: point_2d
        doc: DIMENSION/11|21
      - id: clone_ins_pt
        type: point_2d
        if: entity_common.flag2_8
        doc: DIMENSION/12|22
      - id: dim_type
        type: dim_type
        if: entity_common.flag2_7
        doc: DIMENSION/70
      - id: len_text
        type: s2
        if: entity_common.flag2_6
      - id: text
        size: len_text
        type: str
        encoding: ASCII
        terminator: 0x00
        if: entity_common.flag2_6
        doc: DIMENSION/1
      - id: extension_defining_point1
        type: point_3d
        if: entity_common.flag2_5
        doc: DIMENSION/13|23|33
      - id: extension_defining_point2
        type: point_3d
        if: entity_common.flag2_4
        doc: DIMENSION/14|24|34
      - id: defining_point
        type: point_3d
        if: entity_common.flag2_3
        doc: DIMENSION/15|25|35
      - id: dimension_line_arc_definition_point
        type: point_2d
        if: entity_common.flag2_2
      - id: leader_length
        type: point_2d
        if: entity_common.flag2_1
        doc: DIMENSION/40|50
      - id: leader_length_z
        type: f8
        if: entity_mode.has_elevation == true and entity_common.flag2_1
        doc: DIMENSION/60
      - id: rotation_in_radians
        type: f8
        if: entity_common.flag3_8
      - id: text_rotation_in_radians
        type: f8
        if: entity_common.flag3_6
        doc: DIMENSION/53
      - id: extrusion
        type: point_3d
        if: entity_common.flag3_2
        doc: DIMENSION/210|220|230
      - id: dimstyle
        type: u2
        if: entity_common.flag3_1
      - id: crc16
        size: 2
  dim_type:
    seq:
      - id: flag_text_in_user_location
        type: b1
      - id: flag_x_type_ordinate
        type: b1
      - id: flag_block_for_dim_only
        type: b1
      - id: flag_u4
        type: b1
      - id: type
        type: b4
        enum: dim_type
  entity_face3d:
    seq:
      - id: entity_mode
        type: entity_mode
      - id: entity_size
        type: s2
      - id: entity_layer_index
        type: s2
      - id: entity_common
        type: entity_common
      - id: extra_flag
        type: extra_flag
        if: entity_mode.has_pspace
      - id: eed
        type: eed
        if: entity_mode.has_pspace and extra_flag.has_eed
      - id: entity_color
        type: s1
        if: entity_mode.has_color
      - id: entity_linetype_index
        type: s2
        if: entity_mode.has_linetype
      - id: entity_thickness
        type: f8
        if: entity_mode.has_thickness
      - id: len_handling_id
        type: u1
        if: entity_mode.has_handling
      - id: handling_id
        size: len_handling_id
        if: entity_mode.has_handling
      - id: viewport
        type: u2
        if: entity_mode.has_pspace and extra_flag.has_viewport
      - id: first_point_x
        type: f8
      - id: first_point_y
        type: f8
      - id: first_point_z
        type: f8
        if: not entity_mode.has_elevation
      - id: second_point_x
        type: f8
      - id: second_point_y
        type: f8
      - id: second_point_z
        type: f8
        if: not entity_mode.has_elevation
      - id: third_point_x
        type: f8
      - id: third_point_y
        type: f8
      - id: third_point_z
        type: f8
        if: not entity_mode.has_elevation
      - id: fourth_point_x
        type: f8
      - id: fourth_point_y
        type: f8
      - id: fourth_point_z
        type: f8
        if: not entity_mode.has_elevation
      - id: invisible_edge_flags
        type: invisible_edge_flags
        if: entity_common.flag2_8
        doc: 3DFACE/70
      - id: crc16
        size: 2
  invisible_edge_flags:
    seq:
      - id: flag1
        type: b1
      - id: flag2
        type: b1
      - id: flag3
        type: b1
      - id: flag4
        type: b1
      - id: fourth_edge_is_invisible
        type: b1
      - id: third_edge_is_invisible
        type: b1
      - id: second_edge_is_invisible
        type: b1
      - id: first_edge_is_invisible
        type: b1
      - id: flag9
        type: b1
      - id: flag10
        type: b1
      - id: flag11
        type: b1
      - id: flag12
        type: b1
      - id: flag13
        type: b1
      - id: flag14
        type: b1
      - id: flag15
        type: b1
      - id: flag16
        type: b1
  entity_jump:
    seq:
      - id: entity_mode
        type: entity_mode
      - id: entity_size
        type: s2
      - id: address_raw
        type: u4
      - id: crc16
        size: 2
      - id: unknown_data
        size: entity_size - 10
        if: entity_size > 10
    instances:
      address_flag:
        value: (address_raw & 0xff000000) >> 24
      address:
        value: (address_raw & 0x00ffffff)
  entity_line:
    seq:
      - id: entity_mode
        type: entity_mode
      - id: entity_size
        type: s2
      - id: entity_layer_index
        type: s2
      - id: entity_common
        type: entity_common
      - id: extra_flag
        type: extra_flag
        if: entity_mode.has_pspace
      - id: eed
        type: eed
        if: entity_mode.has_pspace and extra_flag.has_eed
      - id: entity_color
        type: s1
        if: entity_mode.has_color
      - id: entity_linetype_index
        type: s2
        if: entity_mode.has_linetype
      - id: entity_thickness
        type: f8
        if: entity_mode.has_thickness
      - id: len_handling_id
        type: u1
        if: entity_mode.has_handling
      - id: handling_id
        size: len_handling_id
        if: entity_mode.has_handling
      - id: viewport
        type: u2
        if: entity_mode.has_pspace and extra_flag.has_viewport
      - id: x1
        type: f8
        doc: LINE/10
      - id: y1
        type: f8
        doc: LINE/20
      - id: z1
        type: f8
        if: entity_mode.has_elevation == false
        doc: LINE/30
      - id: x2
        type: f8
        doc: LINE/11
      - id: y2
        type: f8
        doc: LINE/21
      - id: z2
        type: f8
        if: entity_mode.has_elevation == false
        doc: LINE/31
      - id: extrusion
        type: point_3d
        if: entity_common.flag2_8
        doc: LINE/210
      - id: crc16
        size: 2
  entity_tmp:
    seq:
      - id: entity_mode
        type: entity_mode
      - id: entity_size
        type: s2
      - id: entity_layer_index
        type: s2
      - id: flag2_1
        type: b1
      - id: flag2_2
        type: b1
      - id: flag2_3
        type: b1
      - id: flag2_4
        type: b1
      - id: flag2_5
        type: b1
      - id: flag2_6
        type: b1
      - id: flag2_7
        type: b1
      - id: flag2_8
        type: b1
      - id: flag3_1
        type: b1
      - id: flag3_2
        type: b1
      - id: flag3_3
        type: b1
      - id: flag3_4
        type: b1
      - id: flag3_5
        type: b1
      - id: flag3_6
        type: b1
      - id: flag3_7
        type: b1
      - id: flag3_8
        type: b1
      - id: xxx
        size: entity_size - 10
      - id: crc16
        size: 2
  entity_point:
    seq:
      - id: entity_mode
        type: entity_mode
      - id: entity_size
        type: s2
      - id: entity_layer_index
        type: s2
      - id: entity_common
        type: entity_common
      - id: extra_flag
        type: extra_flag
        if: entity_mode.has_pspace
      - id: eed
        type: eed
        if: entity_mode.has_pspace and extra_flag.has_eed
      - id: entity_color
        type: s1
        if: entity_mode.has_color
      - id: entity_linetype_index
        type: s2
        if: entity_mode.has_linetype
      - id: entity_thickness
        type: f8
        if: entity_mode.has_thickness
      - id: len_handling_id
        type: u1
        if: entity_mode.has_handling
      - id: handling_id
        size: len_handling_id
        if: entity_mode.has_handling
      - id: viewport
        type: u2
        if: entity_mode.has_pspace and extra_flag.has_viewport
      - id: x
        type: f8
        doc: POINT/10
      - id: y
        type: f8
        doc: POINT/20
      - id: z
        type: f8
        if: entity_mode.has_elevation == false
        doc: POINT/30
      - id: extrusion
        type: point_3d
        if: entity_common.flag2_8
        doc: POINT/210
      - id: x_ang
        type: f8
        if: entity_common.flag2_7
        doc: POINT/50
      - id: crc16
        size: 2
  entity_polyline:
    seq:
      - id: entity_mode
        type: entity_mode
      - id: entity_size
        type: s2
      - id: entity_layer_index
        type: s2
      - id: entity_common
        type: entity_common
      - id: extra_flag
        type: extra_flag
        if: entity_mode.has_pspace
      - id: eed
        type: eed
        if: entity_mode.has_pspace and extra_flag.has_eed
      - id: entity_color
        type: s1
        if: entity_mode.has_color
      - id: entity_linetype_index
        type: s2
        if: entity_mode.has_linetype
      - id: entity_thickness
        type: f8
        if: entity_mode.has_thickness
      - id: entity_elevation
        type: f8
        if: entity_mode.has_elevation
      - id: len_handling_id
        type: u1
        if: entity_mode.has_handling
      - id: handling_id
        size: len_handling_id
        if: entity_mode.has_handling
      - id: viewport
        type: u2
        if: entity_mode.has_pspace and extra_flag.has_viewport
      - id: flag
        type: polyline_flags
        if: entity_common.flag2_8
        doc: POLYLINE/70
      - id: start_width
        type: f8
        if: entity_common.flag2_7
        doc: POLYLINE/40
      - id: end_width
        type: f8
        if: entity_common.flag2_6
        doc: POLYLINE/41
      - id: extrusion
        type: point_3d
        if: entity_common.flag2_5
      - id: num_m_verts
        type: u2
        if: entity_common.flag2_4
        doc: POLYLINE/71
      - id: num_n_verts
        type: u2
        if: entity_common.flag2_3
        doc: POLYLINE/72
      - id: m_density
        type: u2
        if: entity_common.flag2_2
        doc: POLYLINE/73
      - id: n_density
        type: u2
        if: entity_common.flag2_1
        doc: POLYLINE/74
      - id: curve_type
        type: u2
        enum: curve_type
        if: entity_common.flag3_8
# TODO Really?
      - id: z
        type: f8
        if: entity_common.flag3_1
        doc: POLYLINE/30
      - id: crc16
        size: 2
  polyline_flags:
    seq:
      - id: lt_pattern_continues
        type: b1
      - id: pface_mesh
        type: b1
      - id: mesh_closed
        type: b1
      - id: mesh
        type: b1
      - id: polyline_3d
        type: b1
      - id: spline_fit
        type: b1
      - id: curve_fit
        type: b1
      - id: closed
        type: b1
  entity_seqend:
    seq:
      - id: entity_mode
        type: entity_mode
      - id: entity_size
        type: s2
      - id: entity_layer_index
        type: s2
      - id: entity_common
        type: entity_common
      - id: extra_flag
        type: extra_flag
        if: entity_mode.has_pspace
      - id: eed
        type: eed
        if: entity_mode.has_pspace and extra_flag.has_eed
      - id: entity_color
        type: s1
        if: entity_mode.has_color
      - id: entity_linetype_index
        type: s2
        if: entity_mode.has_linetype
      - id: entity_thickness
        type: f8
        if: entity_mode.has_thickness
      - id: entity_elevation
        type: f8
        if: entity_mode.has_elevation
      - id: len_handling_id
        type: u1
        if: entity_mode.has_handling
      - id: handling_id
        size: len_handling_id
        if: entity_mode.has_handling
      - id: viewport
        type: u2
        if: entity_mode.has_pspace and extra_flag.has_viewport
      - id: begin_addr
        type: s4
      - id: crc16
        size: 2
  entity_shape:
    seq:
      - id: entity_mode
        type: entity_mode
      - id: entity_size
        type: s2
      - id: entity_layer_index
        type: s2
      - id: entity_common
        type: entity_common
      - id: extra_flag
        type: extra_flag
        if: entity_mode.has_pspace
      - id: eed
        type: eed
        if: entity_mode.has_pspace and extra_flag.has_eed
      - id: entity_color
        type: s1
        if: entity_mode.has_color
      - id: entity_linetype_index
        type: s2
        if: entity_mode.has_linetype
      - id: entity_thickness
        type: f8
        if: entity_mode.has_thickness
      - id: entity_elevation
        type: f8
        if: entity_mode.has_elevation
      - id: len_handling_id
        type: u1
        if: entity_mode.has_handling
      - id: handling_id
        size: len_handling_id
        if: entity_mode.has_handling
      - id: viewport
        type: u2
        if: entity_mode.has_pspace and extra_flag.has_viewport
      - id: x
        type: f8
        doc: SHAPE/10
      - id: y
        type: f8
        doc: SHAPE/20
      - id: height
        type: f8
        doc: SHAPE/40
      - id: item_num
        type: u1
        doc: SHAPE/2
      - id: angle_in_radians
        type: f8
        if: entity_common.flag2_8
        doc: SHAPE/50
      - id: load_num
        type: u1
        if: entity_common.flag2_7
      - id: width_factor
        type: f8
        if: entity_common.flag2_6
        doc: SHAPE/41
      - id: oblique_angle
        type: f8
        if: entity_common.flag2_5
        doc: SHAPE/51
      - id: crc16
        size: 2
  entity_solid:
    seq:
      - id: entity_mode
        type: entity_mode
      - id: entity_size
        type: s2
      - id: entity_layer_index
        type: s2
      - id: entity_common
        type: entity_common
      - id: extra_flag
        type: extra_flag
        if: entity_mode.has_pspace
      - id: eed
        type: eed
        if: entity_mode.has_pspace and extra_flag.has_eed
      - id: entity_color
        type: s1
        if: entity_mode.has_color
      - id: entity_linetype_index
        type: s2
        if: entity_mode.has_linetype
      - id: entity_thickness
        type: f8
        if: entity_mode.has_thickness
      - id: entity_elevation
        type: f8
        if: entity_mode.has_elevation
      - id: len_handling_id
        type: u1
        if: entity_mode.has_handling
      - id: handling_id
        size: len_handling_id
        if: entity_mode.has_handling
      - id: viewport
        type: u2
        if: entity_mode.has_pspace and extra_flag.has_viewport
      - id: from
        type: point_2d
      - id: from_and
        type: point_2d
      - id: to
        type: point_2d
      - id: to_and
        type: point_2d
      - id: extrusion
        type: point_3d
        if: entity_common.flag2_8
      - id: crc16
        size: 2
  entity_text:
    seq:
      - id: entity_mode
        type: entity_mode
      - id: entity_size
        type: s2
      - id: entity_layer_index
        type: s2
      - id: entity_common
        type: entity_common
      - id: extra_flag
        type: extra_flag
        if: entity_mode.has_pspace
      - id: eed
        type: eed
        if: entity_mode.has_pspace and extra_flag.has_eed
      - id: entity_color
        type: s1
        if: entity_mode.has_color
      - id: entity_linetype_index
        type: s2
        if: entity_mode.has_linetype
      - id: entity_thickness
        type: f8
        if: entity_mode.has_thickness
      - id: entity_elevation
        type: f8
        if: entity_mode.has_elevation
      - id: len_handling_id
        type: u1
        if: entity_mode.has_handling
      - id: handling_id
        size: len_handling_id
        if: entity_mode.has_handling
      - id: viewport
        type: u2
        if: entity_mode.has_pspace and extra_flag.has_viewport
      - id: insert_point
        type: point_2d
        doc: TEXT/10|20
      - id: height
        type: f8
        doc: TEXT/40
      - id: size
        type: s2
      - id: value
        size: size
        type: str
        encoding: ASCII
        terminator: 0x00
        doc: TEXT/1
      - id: angle
        type: f8
        if: entity_common.flag2_8
        doc: TEXT/50
      - id: width_factor
        type: f8
        if: entity_common.flag2_7
        doc: TEXT/41
      - id: obliquing_angle
        type: f8
        if: entity_common.flag2_6
        doc: TEXT/51
      - id: style_index
        type: u1
        if: entity_common.flag2_5
        doc: TEXT/7
      - id: generation
        type: generation_flags
        if: entity_common.flag2_4
        doc: TEXT/71
      - id: horiz_alignment
        enum: horiz_alignment
        type: u1
        if: entity_common.flag2_3
        doc: TEXT/72
      - id: aligned_to
        type: point_2d
        if: entity_common.flag2_2
        doc: TEXT/11|21
      - id: vert_type
        enum: text_type_vert
        type: u1
        if: entity_common.flag3_8
        doc: TEXT/73
      - id: crc16
        size: 2
  entity_trace:
    seq:
      - id: entity_mode
        type: entity_mode
      - id: entity_size
        type: s2
      - id: entity_layer_index
        type: s2
      - id: entity_common
        type: entity_common
      - id: entity_color
        type: s1
        if: entity_mode.has_color
      - id: entity_linetype_index
        type: s2
        if: entity_mode.has_linetype
      - id: entity_thickness
        type: f8
        if: entity_mode.has_thickness
      - id: entity_elevation
        type: f8
        if: entity_mode.has_elevation
      - id: extra_flag
        type: extra_flag
        if: entity_mode.has_pspace
      - id: eed
        type: eed
        if: entity_mode.has_pspace and extra_flag.has_eed
      - id: len_handling_id
        type: u1
        if: entity_mode.has_handling
      - id: handling_id
        size: len_handling_id
        if: entity_mode.has_handling
      - id: viewport
        type: u2
        if: entity_mode.has_pspace and extra_flag.has_viewport
      - id: from
        type: point_2d
      - id: from_and
        type: point_2d
      - id: to
        type: point_2d
      - id: to_and
        type: point_2d
      - id: crc16
        size: 2
  entity_vertex:
    seq:
      - id: entity_mode
        type: entity_mode
      - id: entity_size
        type: s2
      - id: entity_layer_index
        type: s2
      - id: entity_common
        type: entity_common
      - id: entity_color
        type: s1
        if: entity_mode.has_color
      - id: entity_linetype_index
        type: s2
        if: entity_mode.has_linetype
      - id: entity_thickness
        type: f8
        if: entity_mode.has_thickness
      - id: entity_elevation
        type: f8
        if: entity_mode.has_elevation
      - id: extra_flag
        type: extra_flag
        if: entity_mode.has_pspace
      - id: eed
        type: eed
        if: entity_mode.has_pspace and extra_flag.has_eed
      - id: len_handling_id
        type: u1
        if: entity_mode.has_handling
      - id: handling_id
        size: len_handling_id
        if: entity_mode.has_handling
      - id: viewport
        type: u2
        if: entity_mode.has_pspace and extra_flag.has_viewport
      - id: x
        type: f8
        if: not entity_common.flag3_2
        doc: VERTEX/10
      - id: y
        type: f8
        if: not entity_common.flag3_2
        doc: VERTEX/20
      - id: start_width
        type: f8
        if: entity_common.flag2_8
        doc: VERTEX/40
      - id: end_width
        type: f8
        if: entity_common.flag2_7
      - id: bulge
        type: f8
        if: entity_common.flag2_6
        doc: VERTEX/42
      - id: vertex_extra_flag
        type: vertex_extra_flag
        if: entity_common.flag2_5
      - id: tangent_dir_in_radians
        type: f8
        if: entity_common.flag2_4
        doc: VERTEX/50
      - id: pface_mesh_index1
        type: s2
        if: entity_common.flag2_3
        doc: VERTEX/71
      - id: pface_mesh_index2
        type: s2
        if: entity_common.flag2_2
        doc: VERTEX/72
      - id: pface_mesh_index3
        type: s2
        if: entity_common.flag2_1
        doc: VERTEX/73
      - id: pface_mesh_index4
        type: s2
        if: entity_common.flag3_8
        doc: VERTEX/74
      - id: crc16
        size: 2
  vertex_extra_flag:
    seq:
      - id: pface_mesh
        type: b1
      - id: mesh
        type: b1
      - id: polyline_3d
        type: b1
      - id: spline_frame_control_point
        type: b1
      - id: spline_fit
        type: b1
      - id: not_used
        type: b1
      - id: curve_fit
        type: b1
      - id: extra_vertex
        type: b1
  entity_vport:
    seq:
      - id: entity_mode
        type: entity_mode
      - id: entity_size
        type: s2
      - id: entity_layer_index
        type: s2
      - id: entity_common
        type: entity_common
      - id: extra_flag
        type: extra_flag
        if: entity_mode.has_pspace
      - id: eed
        type: eed
        if: entity_mode.has_pspace and extra_flag.has_eed
      - id: entity_color
        type: s1
        if: entity_mode.has_color
      - id: entity_linetype_index
        type: s2
        if: entity_mode.has_linetype
      - id: entity_thickness
        type: f8
        if: entity_mode.has_thickness
      - id: entity_elevation
        type: f8
        if: entity_mode.has_elevation
      - id: len_handling_id
        type: u1
        if: entity_mode.has_handling
      - id: handling_id
        size: len_handling_id
        if: entity_mode.has_handling
      - id: viewport
        type: u2
        if: entity_mode.has_pspace and extra_flag.has_viewport
      - id: x
        type: f8
        doc: VIEWPORT/10
      - id: y
        type: f8
        doc: VIEWPORT/20
      - id: z
        type: f8
        doc: VIEWPORT/30
      - id: width
        type: f8
        doc: VIEWPORT/40
      - id: height
        type: f8
        doc: VIEWPORT/41
      - id: id
        type: s2
        doc: VIEWPORT/69
      - id: crc16
        size: 2
  table_appids:
    seq:
      - id: appids_sentinel_begin
        contents: [0xE1, 0x25, 0xC2, 0x50, 0x36, 0x68, 0x6C, 0x0C, 0x3B, 0xD3, 0x5D, 0x56, 0xC1, 0x79, 0x1C, 0x3A]
      - id: appids
        type: appid
        repeat: expr
        repeat-expr: _parent.header.variables.table_appid.items
      - id: appids_sentinel_end
        contents: [0x1E, 0xDA, 0x3D, 0xAF, 0xC9, 0x97, 0x93, 0xF3, 0xC4, 0x2C, 0xA2, 0xA9, 0x3E, 0x86, 0xE3, 0xC5]
  table_blocks:
    seq:
      - id: blocks_sentinel_begin
        contents: [0xDB, 0xEF, 0xB3, 0xF0, 0xC7, 0x3E, 0x6D, 0xA6, 0xC9, 0xB6, 0x24, 0x5C, 0x4C, 0x6F, 0x32, 0xCB]
      - id: blocks
        type: block
        repeat: expr
        repeat-expr: _parent.header.table_block.items
      - id: blocks_sentinel_end
        contents: [0x24, 0x10, 0x4C, 0x0F, 0x38, 0xC1, 0x92, 0x59, 0x36, 0x49, 0xDB, 0xA3, 0xB3, 0x90, 0xCD, 0x34]
  table_dimstyles:
    seq:
      - id: dimestyles_sentinel_begin
        contents: [0xB4, 0x18, 0x3E, 0x42, 0xC9, 0x9F, 0xFF, 0xE5, 0xB6, 0xE2, 0xCB, 0xB3, 0x75, 0xC3, 0xC3, 0xB0]
      - id: dimstyles
        type: dimstyle
        repeat: expr
        repeat-expr: _parent.header.variables.table_dimstyle.items
      - id: dimestyles_sentinel_end
        contents: [0x4B, 0xE7, 0xC1, 0xBD, 0x36, 0x60, 0x00, 0x1A, 0x49, 0x1D, 0x34, 0x4C, 0x8A, 0x3C, 0x3C, 0x4F]
  table_layers:
    seq:
      - id: layers_sentinel_begin
        contents: [0x0E, 0xC4, 0x64, 0x6F, 0xBB, 0x1D, 0xD3, 0x8B, 0x00, 0x49, 0xC2, 0xEF, 0x18, 0xEA, 0x6F, 0xFB]
      - id: layers
        type: layer
        repeat: expr
        repeat-expr: _parent.header.table_layer.items
      - id: layers_sentinel_end
        contents: [0xF1, 0x3B, 0x9B, 0x90, 0x44, 0xE2, 0x2C, 0x74, 0xFF, 0xB6, 0x3D, 0x10, 0xE7, 0x15, 0x90, 0x04]
  table_linetypes:
    seq:
      - id: linetypes_sentinel_begin
        contents: [0xAC, 0x90, 0x1A, 0xCA, 0x1C, 0xBD, 0x95, 0x15, 0x16, 0x16, 0x4C, 0x14, 0xCE, 0x18, 0x88, 0xAF]
      - id: linetypes
        type: linetype
        repeat: expr
        repeat-expr: _parent.header.table_linetype.items
      - id: linetypes_sentinel_end
        contents: [0x53, 0x6F, 0xE5, 0x35, 0xE3, 0x42, 0x6A, 0xEA, 0xE9, 0xE9, 0xB3, 0xEB, 0x31, 0xE7, 0x77, 0x50]
  table_styles:
    seq:
      - id: styles_sentinel_begin
        contents: [0xE2, 0x3E, 0xC1, 0x82, 0x43, 0x9F, 0x61, 0x77, 0x50, 0xAB, 0xC7, 0x66, 0x96, 0x00, 0x06, 0x18]
      - id: styles
        type: style
        repeat: expr
        repeat-expr: _parent.header.table_style.items
      - id: styles_sentinel_end
        contents: [0x1D, 0xC1, 0x3E, 0x7D, 0xBC, 0x60, 0x9E, 0x88, 0xAF, 0x54, 0x38, 0x99, 0x69, 0xFF, 0xF9, 0xE7]
  table_ucss:
    seq:
      - id: ucss_sentinel_begin
        contents: [0x60, 0x4A, 0xFA, 0x3D, 0x84, 0x90, 0xCC, 0x5B, 0xEF, 0xE7, 0xD6, 0xA5, 0x7F, 0x1E, 0x61, 0xCD]
      - id: ucss
        type: ucs
        repeat: expr
        repeat-expr: _parent.header.variables.table_ucs.items
      - id: ucss_sentinel_end
        contents: [0x9F, 0xB5, 0x05, 0xC2, 0x7B, 0x6F, 0x33, 0xA4, 0x10, 0x18, 0x29, 0x5A, 0x80, 0xE1, 0x9E, 0x32]
  table_views:
    seq:
      - id: views_sentinel_begin
        contents: [0xC1, 0x3C, 0xAA, 0x56, 0x68, 0xF4, 0xB4, 0x1E, 0x4B, 0x74, 0xF4, 0x08, 0x42, 0x4D, 0xBF, 0xA5]
      - id: views
        type: view
        repeat: expr
        repeat-expr: _parent.header.table_view.items
      - id: views_sentinel_end
        contents: [0x3E, 0xC3, 0x55, 0xA9, 0x97, 0x0B, 0x4B, 0xE1, 0xB4, 0x8B, 0x0B, 0xF7, 0xBD, 0xB2, 0x40, 0x5A]
  table_vports:
    seq:
      - id: vports_sentinel_begin
        contents: [0xF6, 0xED, 0x44, 0x61, 0x2A, 0xDC, 0xE4, 0x7B, 0x4E, 0xB9, 0x2B, 0xBB, 0x66, 0x60, 0x63, 0x8D]
      - id: vports
        type: vport
        repeat: expr
        repeat-expr: _parent.header.variables.table_vport.items
      - id: vports_sentinel_end
        contents: [0x09, 0x12, 0xBB, 0x9E, 0xD5, 0x23, 0x1B, 0x84, 0xB1, 0x46, 0xD4, 0x44, 0x99, 0x9F, 0x9C, 0x72]
  table_vxs:
    seq:
      - id: vxs_sentinel_begin
        contents: [0xE0, 0xCA, 0x36, 0x7C, 0xCE, 0xE7, 0x58, 0x6F, 0x2B, 0x7D, 0x74, 0x55, 0x05, 0xF1, 0x44, 0x7F]
      - id: vxs
        type: vx
        repeat: expr
        repeat-expr: _parent.header.variables.table_vx.items
      - id: vxs_sentinel_end
        contents: [0x1F, 0x35, 0xC9, 0x83, 0x31, 0x18, 0xA7, 0x90, 0xD4, 0x82, 0x8B, 0xAA, 0xFA, 0x0E, 0xBB, 0x80]
  attdef_flags:
    seq:
      - id: flag_1
        type: b1
      - id: flag_2
        type: b1
      - id: flag_3
        type: b1
      - id: flag_4
        type: b1
      - id: flag_5
        type: b1
      - id: invisible
        type: b1
      - id: constant
        type: b1
      - id: verify
        type: b1
  attdef_flags2:
    seq:
## TODO Tohle je divne
      - id: flag_1
        type: b1
      - id: flag_2
        type: b1
      - id: flag_3
        type: b1
      - id: flag_4
        type: b1
      - id: flag_5
        type: b1
      - id: middle
        type: b1
      - id: right
        type: b1
      - id: center
        type: b1
  layer:
    seq:
      - id: flag
        type: layer_flag
        doc: LAYER/70
      - id: layer_name
        size: 32
        type: str
        encoding: ASCII
        terminator: 0x00
        doc: LAYER/2
      - id: used
        type: s2
      - id: color
        type: s2
        doc: LAYER/62
      - id: linetype_index
        type: s2
        doc: LAYER/6
      - id: crc16
        size: 2
  layer_flag:
    seq:
      - id: flag1
        type: b1
      - id: referenced
        type: b1
      - id: flag3
        type: b1
      - id: flag4
        type: b1
      - id: flag5
        type: b1
      - id: flag6
        type: b1
      - id: frozen_in_new_viewports
        type: b1
      - id: frozen
        type: b1
  linetype:
    seq:
      - id: flag
        type: linetype_flag
        doc: LTYPE/70
      - id: linetype_name
        size: 32
        type: str
        encoding: ASCII
        terminator: 0x00
        doc: LTYPE/2
      - id: used
        type: s2
      - id: description
        size: 48
        type: str
        encoding: ASCII
        terminator: 0x00
        doc: LTYPE/3
      - id: alignment
        type: u1
        doc: LTYPE/72
      - id: num_dashes
        type: u1
        doc: LTYPE/73
      - id: pattern_len
        type: f8
        doc: LTYPE/40
      - id: pattern
        type: pattern
        doc: LTYPE/49
      - id: crc16
        size: 2
  pattern:
    seq:
      - id: pattern1
        type: f8
      - id: pattern2
        type: f8
      - id: pattern3
        type: f8
      - id: pattern4
        type: f8
      - id: pattern5
        type: f8
      - id: pattern6
        type: f8
      - id: pattern7
        type: f8
      - id: pattern8
        type: f8
      - id: pattern9
        type: f8
      - id: pattern10
        type: f8
      - id: pattern11
        type: f8
      - id: pattern12
        type: f8
  linetype_flag:
    seq:
      - id: flag1
        type: b1
      - id: referenced
        type: b1
      - id: flag3
        type: b1
      - id: flag4
        type: b1
      - id: flag5
        type: b1
      - id: flag6
        type: b1
      - id: flag7
        type: b1
      - id: flag8
        type: b1
  real_entities:
    seq:
      - id: entities
        type: entity
        repeat: eos
  style:
    seq:
      - id: flag
        type: style_flag
        doc: STYLE/70
      - id: style_name
        size: 32
        type: str
        encoding: ASCII
        terminator: 0x00
        doc: STYLE/2
      - id: used
        type: s2
      - id: height
        type: f8
        doc: STYLE/40
      - id: width_factor
        type: f8
        doc: STYLE/41
      - id: obliquing_angle_in_radians
        type: f8
        doc: STYLE/50
      - id: generation
        type: generation_flags
        doc: STYLE/71
      - id: last_height
        type: f8
        doc: STYLE/42
      - id: font_file
        size: 64
        type: str
        encoding: ASCII
        terminator: 0x00
        doc: STYLE/3
      - id: bigfont_file
        size: 64
        type: str
        encoding: ASCII
        terminator: 0x00
        doc: STYLE/4
      - id: crc16
        size: 2
  style_flag:
    seq:
      - id: flag1
        type: b1
      - id: flag2
        type: b1
      - id: flag3
        type: b1
      - id: flag4
        type: b1
      - id: flag5
        type: b1
      - id: vertical
        type: b1
      - id: flag7
        type: b1
      - id: load
        type: b1
  view:
    seq:
      - id: flag
        type: view_flag
        doc: VIEW/70
      - id: view_name
        size: 32
        type: str
        encoding: ASCII
        terminator: 0x2e
      - id: used
        type: s2
      - id: view_size
        type: f8
        doc: VIEW/40
      - id: center_point
        type: point_2d
        doc: VIEW/10|20
      - id: view_width
        type: f8
        doc: VIEW/41
      - id: view_dir
        type: point_3d
        doc: VIEW/11|21|31
      - id: flag_3d
        type: u2
      - id: view_target
        type: point_3d
        doc: VIEW/12/22/32
      - id: view_mode
        type: u2
      - id: lens_length
        type: f8
        doc: VIEW/42
      - id: front_clip_z
        type: f8
        doc: VIEW/43
      - id: back_clip_z
        type: f8
        doc: VIEW/44
      - id: twist_angle_in_radians
        type: f8
        doc: VIEW/50
      - id: crc16
        size: 2
  view_flag:
    seq:
      - id: flag1
        type: b1
      - id: flag2
        type: b1
      - id: flag3
        type: b1
      - id: flag4
        type: b1
      - id: flag5
        type: b1
      - id: flag6
        type: b1
      - id: flag7
        type: b1
      - id: flag8
        type: b1
  ucs:
    seq:
      - id: flag
        type: ucs_flag
        doc: UCS/70
      - id: ucs_name
        size: 32
        type: str
        encoding: ASCII
        terminator: 0x00
        doc: UCS/2
      - id: used
        type: s2
      - id: ucs_org
        type: point_3d
        doc: UCS/10|20|30
      - id: ucs_x_dir
        type: point_3d
        doc: UCS/11|21|31
      - id: ucs_y_dir
        type: point_3d
        doc: UCS/12|22|32
      - id: crc16
        size: 2
  ucs_flag:
    seq:
      - id: flag1
        type: b1
      - id: flag2
        type: b1
      - id: flag3
        type: b1
      - id: flag4
        type: b1
      - id: flag5
        type: b1
      - id: flag6
        type: b1
      - id: flag7
        type: b1
      - id: flag8
        type: b1
  vport:
    seq:
      - id: flag
        type: vport_flag
        doc: VPORT/70
      - id: vport_name
        size: 32
        type: str
        encoding: ASCII
        terminator: 0x00
        doc: VPORT/2
      - id: used
        type: s2
      - id: view_size_vport_10_20
        type: point_2d
        doc: VPORT/10|20
      - id: view_ctrl_vport_11_21
        type: point_2d
        doc: VPORT/11|21
      - id: view_taget_vport_17_27_37
        type: point_3d
        doc: VPORT/17|27|37
      - id: vport_16_26_36
        type: point_3d
        doc: VPORT/16|26|36
      - id: vport_51_in_radians
        type: f8
        doc: VPORT/51
      - id: vport_40
        type: f8
        doc: VPORT/40
      - id: vport_12_22
        type: point_2d
        doc: VPORT/12|22
      - id: vport_41
        type: f8
        doc: VPORT/41
      - id: vport_42
        type: f8
        doc: VPORT/42
      - id: vport_43
        type: f8
        doc: VPORT/43
      - id: vport_44
        type: f8
        doc: VPORT/44
      - id: vport_71
        type: u2
        doc: VPORT/71
      - id: vport_72
        type: u2
        doc: VPORT/72
      - id: vport_73
        type: u2
        doc: VPORT/73
      - id: vport_74
        type: u2
        doc: VPORT/74
      - id: vport_75
        type: u2
        doc: VPORT/75
      - id: vport_76
        type: u2
        doc: VPORT/76
      - id: vport_77
        type: u2
        doc: VPORT/77
      - id: vport_78
        type: u2
        doc: VPORT/78
      - id: vport_50
        type: f8
        doc: VPORT/50
      - id: vport_13_23
        type: point_2d
        doc: VPORT/13|23
      - id: vport_14_24
        type: point_2d
        doc: VPORT/14|24
      - id: vport_15_25
        type: point_2d
        doc: VPORT/15|25
      - id: crc16
        size: 2
  vport_flag:
    seq:
      - id: deleted
        type: b1
      - id: flag2
        type: b1
      - id: flag3
        type: b1
      - id: flag4
        type: b1
      - id: flag5
        type: b1
      - id: flag6
        type: b1
      - id: flag7
        type: b1
      - id: flag8
        type: b1
  appid:
    seq:
      - id: flag
        type: appid_flag
        doc: APPID/70
      - id: appid_name
        size: 32
        type: str
        encoding: ASCII
        terminator: 0x00
        doc: APPID/2
      - id: usage
        type: s2
      - id: crc16
        size: 2
  appid_flag:
    seq:
      - id: flag1
        type: b1
      - id: flag2
        type: b1
      - id: flag3
        type: b1
      - id: flag4
        type: b1
      - id: flag5
        type: b1
      - id: flag6
        type: b1
      - id: flag7
        type: b1
      - id: flag8
        type: b1
  dimstyle:
    seq:
      - id: flag
        type: dimstyle_flag
        doc: DIMSTYLE/70
      - id: dimstyle_name
        size: 32
        type: str
        encoding: ASCII
        terminator: 0x00
        doc: DIMSTYLE/2
      - id: usage
        type: s2
      - id: dim_scale
        type: f8
        doc: DIMSTYLE/$DIMSCALE/40
      - id: dim_arrowhead_size
        type: f8
        doc: DIMSTYLE/$DIMASZ/41
      - id: dim_extension_line_offset
        type: f8
        doc: DIMSTYLE/$DIMEXO/42
      - id: dim_baseline_spacing
        type: f8
        doc: DIMSTYLE/$DIMDLI/43
      - id: dim_extension_line_extend
        type: f8
        doc: DIMSTYLE/$DIMEXE/44
      - id: dim_rounding
        type: f8
        doc: DIMSTYLE/$DIMRND/45
      - id: dim_extension_line_extend2
        type: f8
        doc: DIMSTYLE/$DIMDLE/46
      - id: dim_maximum_tolerance_limit
        type: f8
        doc: DIMSTYLE/$DIMTP/47
      - id: dim_minimum_tolerance_limit
        type: f8
        doc: DIMSTYLE/$DIMTM/48
      - id: dim_text_height
        type: f8
        doc: DIMSTYLE/$DIMTXT/140
      - id: dim_center_mark_control
        type: f8
        doc: DIMSTYLE/$DIMCEN/141
      - id: dim_oblique_stroke_size
        type: f8
        doc: DIMSTYLE/$DIMTSZ/142
      - id: dim_alternate_units_multiplier
        type: f8
        doc: DIMSTYLE/$DIMALTF/143
      - id: dim_linear_measurements_scale_factor
        type: f8
        doc: DIMSTYLE/$DIMLFAC/144
      - id: dim_text_vertical_position_size
        type: f8
        doc: DIMSTYLE/$DIMTVP/145
      - id: dim_tolerances
        type: u1
        doc: DIMSTYLE/$DIMTOL/71
      - id: dim_limits_default_text
        type: u1
        doc: DIMSTYLE/$DIMLIM/72
      - id: dim_text_ext_inside_line_position
        type: u1
        doc: DIMSTYLE/$DIMTIH/73
      - id: dim_text_ext_outside_line_position
        type: u1
        doc: DIMSTYLE/$DIMTOH/74
      - id: dim_extension_line_first_suppress
        type: u1
        doc: DIMSTYLE/$DIMSE1/75
      - id: dim_extension_line_second_suppress
        type: u1
        doc: DIMSTYLE/$DIMSE2/76
      - id: dim_text_vertical_position
        type: u1
        doc: DIMSTYLE/$DIMTAD/77
      - id: dim_suppression_of_zeros
        type: u1
        doc: DIMSTYLE/$DIMZIN/78
      - id: dim_alternate_units
        type: u1
        doc: DIMSTYLE/$DIMALT/170
      - id: dim_alternate_units_decimal_places
        type: u1
        doc: DIMSTYLE/$DIMALTD/171
      - id: dim_tofl
        type: u1
        doc: DIMSTYLE/$DIMTOFL/172
      - id: dim_arrowhead_blocks_control
        type: u1
        doc: DIMSTYLE/$DIMSAH/173
      - id: dim_text_between_ext_lines
        type: u1
        doc: DIMSTYLE/$DIMTIX/174
      - id: dim_arrowhead_suppress
        type: u1
        doc: DIMSTYLE/$DIMSOXD/175
      - id: dim_measurement_postfix
        size: 16
        type: str
        encoding: ASCII
        terminator: 0x00
        doc: DIMSTYLE/$DIMPOST/3
      - id: dim_alternate_measurement_postfix
        size: 16
        type: str
        encoding: ASCII
        terminator: 0x00
        doc: DIMSTYLE/$DIMAPOST/4
      - id: dimblk_t
        size: 16
        type: str
        encoding: ASCII
        terminator: 0x00
        doc: DIMSTYLE/$DIMBLK_T/5
      - id: dimblk1_t
        size: 16
        type: str
        encoding: ASCII
        terminator: 0x00
        doc: DIMSTYLE/$DIMBLK1_T/6
      - id: dimblk2_t
        size: 66
        type: str
        encoding: ASCII
        terminator: 0x00
        doc: DIMSTYLE/$DIMBLK2_T/7
      - id: dimclrd_n
        type: u2
        doc: DIMSTYLE/$DIMCLRD_N/176
      - id: dimclre_n
        type: u2
        doc: DIMSTYLE/$DIMCLRE_N/177
      - id: dimclrt_n
        type: u2
        doc: DIMSTYLE/$DIMCLRT_N/178
      - id: dimupt
        type: u1
        doc: DIMSTYLE/$DIMUPT
      - id: dim_tfac
        type: f8
        doc: DIMSTYLE/$DIMTFAC/146
      - id: dim_gap
        type: f8
        doc: DIMSTYLE/$DIMGAP/147
      - id: crc16
        size: 2
  dimstyle_flag:
    seq:
      - id: flag1
        type: b1
      - id: flag2
        type: b1
      - id: flag3
        type: b1
      - id: flag4
        type: b1
      - id: flag5
        type: b1
      - id: flag6
        type: b1
      - id: flag7
        type: b1
      - id: flag8
        type: b1
  vx:
    seq:
      - id: flag
        type: vx_flag
        doc: APPID/70
      - id: vx_name
        size: 32
        type: str
        encoding: ASCII
        terminator: 0x00
        doc: VX/2
      - id: usage
        type: s2
      - id: vport_entity_address
        type: u2
      - id: viewport_index
        type: u2
      - id: prev_entry_index
        type: u2
      - id: crc16
        size: 2
  vx_flag:
    seq:
      - id: flag1
        type: b1
      - id: flag2
        type: b1
      - id: flag3
        type: b1
      - id: flag4
        type: b1
      - id: flag5
        type: b1
      - id: flag6
        type: b1
      - id: flag7
        type: b1
      - id: is_on
        type: b1
  generation_flags:
    seq:
      - id: flag1
        type: b1
      - id: flag2
        type: b1
      - id: flag3
        type: b1
      - id: flag4
        type: b1
      - id: flag5
        type: b1
      - id: upside_down
        type: b1
      - id: backwards
        type: b1
      - id: flag8
        type: b1
  point_2d:
    seq:
      - id: x
        type: f8
      - id: y
        type: f8
  point_3d:
    seq:
      - id: x
        type: f8
      - id: y
        type: f8
      - id: z
        type: f8
enums:
  entities:
    1: line
    2: point
    3: circle
    4: shape
    # NOT_USED 5: repeat_begin
    # NOT_USED 6: repeat_end
    7: text
    8: arc
    9: trace
    # NOT_USED 10: load
    11: solid
    12: block_begin
    13: block_end
    14: insert
    15: attdef
    16: attrib
    17: seqend
    18: jump
    19: polyline
    20: vertex
    # NOT_USED 21: line3d
    22: face3d
    23: dim
    24: vport
  osnap_modes:
    0: none
    1: endpoint
    2: midpoint
    4: center
    8: node
    16: quadrant
    32: intersection
    64: insertion
    128: perpendicular
    256: tangent
    512: nearest
  unit_types:
    1: scientific
    2: decimal
    3: engineering
    4: architectural
    5: fractional
  units_for_angles:
    0: decimal_degrees
    1: degrees_minutes_seconds
    2: gradians
    3: radians
    4: surveyor_s_units
  angle_direction:
    0: counterclockwise
    1: clockwise
  limits_check:
    0: objects_can_outside_grid
    1: objects_cannot_outside_grid
  coordinates:
    0: absolute_coordinates
    1: absolute_coordinates_realtime
    2: relative_polar_coordinates
  att_visibility:
    0: off
    1: normal
    2: all
  current_color:
    0: byblock
    1: red
    2: yellow
    3: green
    4: cyan
    5: blue
    6: magenta
    7: white
    256: bylayer
  current_linetype:
    255: byblock
    256: bylayer
  iso_plane:
    0: left
    1: top
    2: right
  horiz_alignment:
    0: left
    1: center
    2: right
    3: aligned
    4: middle
    5: fit
  text_type_vert:
    0: baseline
    1: bottom
    2: middle
    3: top
  dim_type:
    0: rotated_horizontal_or_vertical
    1: aligned
    2: angular
    3: diameter
    4: radius
    5: angular_3_point
    6: ordinate
  spline_type:
    5: quadratic_b_spline
    6: cubic_b_spline
  curve_type:
    5: quadratic_b_spline
    6: cubic_b_spline
    8: bezier
  eeds:
    0: eed_1000
    1: eed_1001
    2: eed_1002
    3: eed_1003
    4: eed_1004
    5: eed_1005
    10: eed_1010
    40: eed_1040
    70: eed_1070
    71: eed_1071
  aux_table:
    1: block
    2: layer
    3: style
    5: linetype
    6: view
    7: ucs
    8: vport
    9: appid
    10: dimstyle
    11: vx
  dwgcodepage:
    0: ansi_1252
    1: us_ascii
    2: iso_8859_1
    3: iso_8859_2
    4: iso_8859_3
    5: iso_8859_4
    6: iso_8859_5
    7: iso_8859_6
    8: iso_8859_7
    9: iso_8859_8
    10: iso_8859_9
    11: cp437
    12: cp850
    13: cp852
    14: cp855
    15: cp857
    16: cp860
    17: cp861
    18: cp863
    19: cp864
    20: cp865
    21: cp869
    22: cp932
    23: macintosh
    24: big5
    25: cp949
    26: johab
    27: cp866
    28: ansi_1250
    29: ansi_1251
    30: utf_8
    31: gb2312
    32: ansi_1253
    33: ansi_1254
    34: ansi_1255
    35: ansi_1256
    36: ansi_1257
    37: ansi_874
    38: ansi_932
    39: ansi_936
    40: ansi_949
    41: ansi_950
    42: ansi_1361
    43: utf_16
    44: ansi_1258
