# LibRaw

[![Stable](https://img.shields.io/badge/docs-stable-blue.svg)](https://jonathanBieler.github.io/LibRaw.jl/stable)
[![Dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://jonathanBieler.github.io/LibRaw.jl/dev)

[![Build Status](https://github.com/jonathanBieler/LibRaw.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/jonathanBieler/LibRaw.jl/actions/workflows/CI.yml?query=branch%3Amain)
[![Coverage](https://codecov.io/gh/jonathanBieler/LibRaw.jl/branch/main/graph/badge.svg)](https://codecov.io/gh/jonathanBieler/LibRaw.jl)

[![Project Status: WIP – Initial development is in progress, but there has not yet been a stable, usable release suitable for the public.](https://www.repostatus.org/badges/latest/wip.svg)](https://www.repostatus.org/#wip)

Minimal bindings for the [LibRaw](https://www.libraw.org/) library. The purpose of this package to read
raw file and access the data, but not to do post-processing (although a navie demoisaic algorithm is provided for debugging). Colors.jl
and Images.jl coulld be used for further post-processing.

Bindings were automatically generated using [Clang.jl](https://github.com/JuliaInterop/Clang.jl), see `gen/generator.jl`.

Please open an issue if a functionality is missing or broken.

## Known issues

The matrix returned by `LibRaw.camera_rgb` might be wrong (possible row/column major issue).

## Example

```julia
raw_img = LibRaw.RawImage("data/ccp2.nef")
LibRaw.unpack!(raw_img)
LibRaw.subtract_black!(raw_img)

@assert LibRaw.color_description(raw_img) == "RGBG"

img = LibRaw.demoisaic(LibRaw.BayerAverage(), raw_img)#h x w x 4 Array
```