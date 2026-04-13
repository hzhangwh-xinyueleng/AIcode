function writer_name = write_basic_gds(cell_struct, params)
%WRITE_BASIC_GDS Write a single-cell GDS file using GDSII Toolbox only.

validateattributes(params, {'struct'}, {'scalar'}, mfilename, 'params');

if ~isfield(params, 'cell_name') || ~isfield(params, 'unit_um') || ~isfield(params, 'out_gds')
    error('write_basic_gds:MissingParam', ...
        'params must contain cell_name, unit_um, and out_gds.');
end

library_name = normalize_name(params.cell_name, 32);
uunit_m = params.unit_um * 1e-6;
dbunit_m = 1e-9;

assert_gdsii_toolbox_ready();

gds_lib = gds_library( ...
    library_name, ...
    'uunit', uunit_m, ...
    'dbunit', dbunit_m, ...
    cell_struct);

write_gds_library(gds_lib, params.out_gds);
writer_name = 'GDSII Toolbox';
end

function normalized = normalize_name(raw_name, max_length)
normalized = char(string(raw_name));
normalized = regexprep(strtrim(normalized), '\s+', '_');
normalized = regexprep(normalized, '[^A-Za-z0-9_]', '_');

if isempty(normalized)
    normalized = 'LAYOUT';
end

normalized = normalized(1:min(numel(normalized), max_length));
end
