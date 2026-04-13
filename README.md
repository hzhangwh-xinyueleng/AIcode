# AIcode

A minimal MATLAB example for building a parameterized layout cell and exporting it to GDS using the GDSII Toolbox.

## What This Project Does

This repository creates a simple single-cell layout with:

- a main rectangular body
- an optional square marker
- an optional text label

The generated layout is written to a GDS file through the GDSII Toolbox API.

## Requirements

- MATLAB
- GDSII Toolbox available on the MATLAB path
- Required GDSII Toolbox MEX files compiled successfully

The helper function `assert_gdsii_toolbox_ready` checks both toolbox functions and required MEX binaries before layout generation starts.

## Files

- `demo_basic_gds.m`: demo entry point that defines parameters, builds the cell, and writes the GDS file
- `build_basic_cell.m`: creates the layout geometry and optional text label
- `write_basic_gds.m`: wraps the GDS library creation and file export
- `layer_map_demo.m`: defines the demo layer map
- `assert_gdsii_toolbox_ready.m`: validates that the GDSII Toolbox installation is usable
- `basic_unit_demo.gds`: example generated output currently included in the repo

## Quick Start

1. Add the GDSII Toolbox to the MATLAB path.
2. If needed, build the toolbox MEX files in the toolbox root.
3. Run the demo script.

```matlab
addpath(genpath('path/to/gdsii-toolbox'));
demo_basic_gds
```

If everything is configured correctly, the script writes:

```text
basic_unit_demo.gds
```

to the current working directory.

## Default Demo Parameters

The demo currently uses:

- cell name: `BASIC_UNIT`
- unit: `1.0 um`
- body size: `120 um x 80 um`
- marker size: `12 um`
- marker center: `[76, 56] um`
- label output: disabled by default

You can change these values in `demo_basic_gds.m`.

## Layer Mapping

The default layer map in `layer_map_demo.m` is:

- main boundary: layer `1`, datatype `0`
- marker boundary: layer `10`, datatype `0`
- text label: layer `20`, texttype `0`

## Customization

- Edit `demo_basic_gds.m` to change output filename, dimensions, and options.
- Edit `layer_map_demo.m` to match your process layer definitions.
- Edit `build_basic_cell.m` to generate different geometry.

## Toolbox Setup Notes

If the toolbox is found but its compiled components are missing, the code will stop and prompt you to:

```matlab
mex -setup C
mex -setup C++
```

and then run `makemex` in the GDSII Toolbox root.
