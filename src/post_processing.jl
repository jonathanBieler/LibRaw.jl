function apply_camera_multiplier!(image::RawImage, d::Array{T, 3}) where T
    @assert size(d, 3) == 4
    mult = LibRaw.camera_multiplier(image)
    mult ./= minimum(mult[1:3]) 
    @assert mult[4] > 0.0
    for channel in 1:4
        d[:,:, channel] .*= mult[channel]
    end
    d
end