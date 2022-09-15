using Colors, FileIO, Statistics, LibRaw, Test
using PyCall

cd("/Users/jbieler/.julia/dev/LibRaw/examples/")

rawpy = pyimport("rawpy")
np = pyimport("numpy")

filename = "../test/data/ccp2.nef"
#filename = "../test/data/iris.3.nef"
#filename = "../test/data/_MG_0321.CR2"

img = LibRaw.RawImage(filename)
LibRaw.unpack!(img)
raw_img = LibRaw.raw_image(img)

rawpy_img = rawpy.imread(filename)

@test raw_img == rawpy_img.raw_image

LibRaw.black_level(img) 

@test LibRaw.maximum(img) == rawpy_img.white_level
@test LibRaw.pre_multipliers(img) == rawpy_img.daylight_whitebalance

LibRaw.camera_rgb(img) 

@test LibRaw.camera_xyz(img) == rawpy_img.rgb_xyz_matrix

@test np.linalg.inv(rawpy_img.rgb_xyz_matrix[1:3,:]) ≈ inv(LibRaw.camera_xyz(img)[1:3,:])

