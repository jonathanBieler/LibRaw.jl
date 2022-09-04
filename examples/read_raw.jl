using Colors, FileIO, Statistics, LibRaw

to_color(x, i, j) = Colors.RGB(x[i,j,1], x[i,j,2], x[i,j,3])
sigmoid(x, σ, μ) = 1 / (1 + exp(-(x-μ)/σ))

img = LibRaw.RawImage("../test/data/iris.3.nef")
img = LibRaw.RawImage("../test/data/ccp2.nef")
#img = LibRaw.RawImage("../test/data/_MG_0321.CR2")

LibRaw.unpack!(img)
LibRaw.subtract_black!(img)

@time d = LibRaw.demoisaic(LibRaw.BayerAverage(), img)

mult = LibRaw.camera_multipliers(img)
LibRaw.apply_multipliers!(d, mult)

mult = LibRaw.pre_multipliers(img)
#mult[4] = mult[2]
#LibRaw.apply_multipliers!(d, mult)

# image is RGBG, average the two green channels
@. d[:,:,2] = d[:,:,2]/2 + d[:,:,4]/2

cam_rgb = LibRaw.camera_rgb(img)
#LibRaw.apply_maxtrix!(d, cam_rgb)

method = :log_sigmoid

if method == :log_sigmoid
    out = log10.(d[2:end-1, 2:end-1, 1:3] )
    out .-= mean(out, dims = (1,2))# "white-balance"
    #out .-= mean(out)
    scaled = sigmoid.(out, 0.15, 0.1)
elseif method == :linear
    scaled = d[2:end-1, 2:end-1, 1:3]
    scaled = scaled ./ maximum(scaled)
end

col = [to_color(scaled,i,j) for i in axes(scaled,1), j in axes(scaled,2)]

FileIO.save("test.png", col); 
run(`open test.png`)

