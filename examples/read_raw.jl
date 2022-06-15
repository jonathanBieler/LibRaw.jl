using Colors, FileIO, Statistics, LibRaw

to_color(x, i, j) = Colors.RGB(x[i,j,1], x[i,j,2], x[i,j,3])
to_power(c) = sqrt(c.r^2 + c.g^2 + c.b^2)
sigmoid(x, σ, μ) = 1 / (1 + exp(-(x-μ)/σ))

function scale_rgb(c, s)
    p = to_power(c)
    p == 0 && return c
    t = x -> clamp(s * x / p, 0, 1)
    RGB(t(c.r), t(c.g), t(c.b))
end

img = LibRaw.Image("../test/data/iris.3.nef")
LibRaw.unpack!(img)
LibRaw.subtract_black!(img)
d = LibRaw.demoisaic(LibRaw.BayerAverage(), img)

out = log10.(d[2:end-1, 2:end-1,:] )
out .-= mean(out)

scaled = sigmoid.(out, 0.1, 0.1)
col = [to_color(scaled,i,j) for i in axes(scaled,1), j in axes(scaled,2)]

FileIO.save("test.png", col); run(`open test.png`)