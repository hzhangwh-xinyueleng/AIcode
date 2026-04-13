# AIcode

中文：这是一个基于 MATLAB 和 GDSII Toolbox 的最小示例项目，用来构建一个参数化版图单元并导出为 GDS 文件。  
English: A minimal MATLAB example for building a parameterized layout cell and exporting it to GDS with the GDSII Toolbox.

## 中文说明

### 项目作用

这个仓库演示了如何生成一个简单的单元版图，包含：

- 一个主体矩形
- 一个可选的方形标记
- 一个可选的文本标签

最终版图通过 GDSII Toolbox 写出为 `.gds` 文件。

### 运行依赖

- MATLAB
- 已加入 MATLAB 路径的 GDSII Toolbox
- 已正确编译的 GDSII Toolbox MEX 文件

`assert_gdsii_toolbox_ready.m` 会在生成版图前检查工具箱函数和关键 MEX 文件是否可用。

### 文件说明

- `demo_basic_gds.m`：示例入口，设置参数、构建单元并导出 GDS
- `build_basic_cell.m`：生成几何图形和可选标签
- `write_basic_gds.m`：创建 GDS library 并写出文件
- `layer_map_demo.m`：定义示例图层映射
- `assert_gdsii_toolbox_ready.m`：检查 GDSII Toolbox 是否安装完整
- `basic_unit_demo.gds`：当前仓库内附带的示例输出文件

### 快速开始

1. 将 GDSII Toolbox 加入 MATLAB 路径。
2. 如果工具箱的 MEX 文件尚未编译，先在工具箱目录完成编译。
3. 运行示例脚本。

```matlab
addpath(genpath('path/to/gdsii-toolbox'));
demo_basic_gds
```

运行成功后，脚本会在当前工作目录生成：

```text
basic_unit_demo.gds
```

### 默认参数

当前示例默认使用：

- 单元名：`BASIC_UNIT`
- 版图单位：`1.0 um`
- 主体尺寸：`120 um x 80 um`
- 标记尺寸：`12 um`
- 标记中心：`[76, 56] um`
- 标签输出：默认关闭

这些参数可以直接在 `demo_basic_gds.m` 中修改。

### 默认图层映射

`layer_map_demo.m` 当前定义为：

- 主体边界：layer `1`，datatype `0`
- 标记边界：layer `10`，datatype `0`
- 文本标签：layer `20`，texttype `0`

### 自定义建议

- 修改 `demo_basic_gds.m` 可以调整输出文件名、尺寸和功能开关
- 修改 `layer_map_demo.m` 可以适配你的工艺图层定义
- 修改 `build_basic_cell.m` 可以扩展更复杂的版图几何

### 工具箱编译说明

如果工具箱函数存在，但编译后的组件缺失，代码会提示先执行：

```matlab
mex -setup C
mex -setup C++
```

然后到 GDSII Toolbox 根目录运行 `makemex`。

## English

### Overview

This repository demonstrates how to generate a simple single-cell layout containing:

- a main rectangular body
- an optional square marker
- an optional text label

The resulting layout is exported as a `.gds` file through the GDSII Toolbox API.

### Requirements

- MATLAB
- GDSII Toolbox added to the MATLAB path
- Required GDSII Toolbox MEX files compiled successfully

The helper `assert_gdsii_toolbox_ready.m` verifies both toolbox functions and required MEX binaries before layout generation starts.

### File Guide

- `demo_basic_gds.m`: demo entry point that defines parameters, builds the cell, and writes the GDS file
- `build_basic_cell.m`: creates the layout geometry and optional text label
- `write_basic_gds.m`: wraps GDS library creation and file export
- `layer_map_demo.m`: defines the demo layer map
- `assert_gdsii_toolbox_ready.m`: validates that the GDSII Toolbox installation is usable
- `basic_unit_demo.gds`: example generated output currently included in the repository

### Quick Start

1. Add the GDSII Toolbox to the MATLAB path.
2. Build the toolbox MEX files if needed.
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

### Default Demo Parameters

The demo currently uses:

- cell name: `BASIC_UNIT`
- unit: `1.0 um`
- body size: `120 um x 80 um`
- marker size: `12 um`
- marker center: `[76, 56] um`
- label output: disabled by default

You can change these values in `demo_basic_gds.m`.

### Layer Mapping

The default mapping in `layer_map_demo.m` is:

- main boundary: layer `1`, datatype `0`
- marker boundary: layer `10`, datatype `0`
- text label: layer `20`, texttype `0`

### Customization

- Edit `demo_basic_gds.m` to change output filename, dimensions, and options.
- Edit `layer_map_demo.m` to match your process layer definitions.
- Edit `build_basic_cell.m` to generate different geometry.

### Toolbox Setup Notes

If the toolbox is found but its compiled components are missing, the code will prompt you to run:

```matlab
mex -setup C
mex -setup C++
```

and then run `makemex` in the GDSII Toolbox root.
