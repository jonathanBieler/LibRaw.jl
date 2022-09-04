
abstract type DemosaicMethod end

struct BayerAverage <: DemosaicMethod end

"""
    demoisaic(algorithm::T, image::RawImage) where T <: DemosaicMethod

Demoisaic the raw `image` using `algorithm` method (e.g. `BayerAverage`).

The resulting array will contains 4 channels (e.g. it will have two green channels),
use `LibRaw.color_description` to get the description of the channels.
"""
function demoisaic(algorithm::T, image::RawImage) where T <: DemosaicMethod
    w, h = raw_width(image), raw_height(image)
    debayered = zeros(h, w, 4)
    
    !image.isunpacked && unpack!(image)
    demoisaic!(algorithm, debayered, image)
    debayered
end

# get the  pixels corresponding to channel in a 3x3 area around pixel and average them
function get_local_average(raw_data, col_indices, i, j, channel)
    sum_val = UInt16(0)
    n = 0
    @inbounds for io in -1:1, jo in -1:1
        iloc, jloc = i + io, j + jo
        colidx = col_indices[iloc, jloc]
        if colidx == channel
            sum_val += raw_data[iloc,jloc]
            n += 1
        end
    end
    sum_val / n
end

function demoisaic!(algorithm::BayerAverage, debayered, image::RawImage)

    col_indices = color_index(image)
    raw_data = raw_image(image)

    @assert size(col_indices) == size(raw_data)
    @assert size(col_indices) == size(debayered)[1:2]
    @assert size(debayered, 3) == 4

    # this could be used to directly merge the two green channels together
    # cdesc = LibRaw.color_description(image)
    # _to_channel = Dict(zip(1:4, [findfirst(c == x for x in ['R','G','B']) for c in cdesc]))
    # to_channel = c -> _to_channel[c]

    @inbounds for i = 2:size(debayered,1)-1
        for j = 2:size(debayered,2)-1
            colidx = col_indices[i,j]
            
            for channel in 1:4
                if colidx == channel
                    debayered[i,j,channel] = raw_data[i,j]
                else
                    debayered[i,j,channel] = get_local_average(raw_data, col_indices,  i, j, channel)
                end
            end
        end
    end
    debayered
end

