using LibRaw
using Test

@testset "LibRaw.jl" begin
    LibRaw.libraw_version()

    img = LibRaw.Image("data/iris.3.nef")

    @test LibRaw.width(img) == 6064
    @test LibRaw.height(img) == 4040

    @test LibRaw.raw_width(img) == 6064
    @test LibRaw.raw_height(img) == 4040

    @test LibRaw.color_description(img) == "RGBG"

    LibRaw.unpack!(img)
    LibRaw.subtract_black!(img)

    col_index = LibRaw.color_index(img)
    @test sort(unique(col_index)) == Int32.([1,2,3,4])

    raw_data = LibRaw.raw_image(img)

    image = LibRaw.demoisaic(LibRaw.BayerAverage(), img)
    @test size(image) == (LibRaw.width(img), LibRaw.height(img), 3)

    #@show img
end



##

