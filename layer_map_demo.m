function layers = layer_map_demo()
%LAYER_MAP_DEMO Demo layer map for the minimal GDS example.

layers.main = struct('layer', 1, 'datatype', 0);
layers.marker = struct('layer', 10, 'datatype', 0);
layers.label = struct('layer', 20, 'texttype', 0);
end
