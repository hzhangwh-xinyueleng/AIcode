params = struct();
params.cell_name = 'BASIC_UNIT';
params.unit_um = 1.0;
params.body_w_um = 120.0;
params.body_h_um = 80.0;
params.marker_size_um = 12.0;
params.marker_offset_um = [76.0, 56.0];
params.add_label = false;
params.out_gds = fullfile(pwd, 'basic_unit_demo.gds');

assert_gdsii_toolbox_ready();
layers = layer_map_demo();
cell_struct = build_basic_cell(params, layers);
writer_name = write_basic_gds(cell_struct, params);

fprintf('GDS written: %s\n', params.out_gds);
fprintf('Writer: %s\n', writer_name);
fprintf('Cell name: %s\n', params.cell_name);
fprintf('Body size (um): %.3f x %.3f\n', params.body_w_um, params.body_h_um);
fprintf('Marker center (um): [%.3f, %.3f]\n', ...
    params.marker_offset_um(1), params.marker_offset_um(2));
