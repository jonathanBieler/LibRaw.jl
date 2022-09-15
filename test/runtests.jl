using LibRaw
using Test

@testset "LibRaw.jl" begin
    LibRaw.libraw_version()

    img = LibRaw.RawImage("data/iris.3.nef")

    clist = LibRaw.camera_list()
    @test length(clist) == LibRaw.libraw_cameraCount()
    @test "Apple iPad Pro" ∈ clist

    @test LibRaw.width(img) == 6064
    @test LibRaw.height(img) == 4040

    @test LibRaw.raw_width(img) == 6064
    @test LibRaw.raw_height(img) == 4040

    @test LibRaw.color_description(img) == "RGBG"

    @test length(LibRaw.camera_multipliers(img)) == 4
    @test length(LibRaw.pre_multipliers(img)) == 4
    @test size(LibRaw.camera_rgb(img)) == (3,3)

    LibRaw.unpack!(img)
    LibRaw.subtract_black!(img)

    col_index = LibRaw.color_index(img)
    @test sort(unique(col_index)) == Int32.([1,2,3,4])

    raw_data = LibRaw.raw_image(img) # checked with rawpy ✓

    image = LibRaw.demoisaic(LibRaw.BayerAverage(), img)
    @test size(image) == (LibRaw.height(img), LibRaw.width(img), 4)

    @test LibRaw.black_level(img) == 1008 # checked with rawpy ✓
    @test LibRaw.maximum(img) == 16383 # checked with rawpy ✓

    LibRaw.apply_multipliers!(image, LibRaw.camera_multipliers(img))

    image = image[:,:,1:3]
    color_matrix = LibRaw.camera_rgb(img)[:,1:3]
    LibRaw.apply_maxtrix!(image, color_matrix)
  
end



##

