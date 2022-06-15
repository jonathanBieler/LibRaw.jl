
abstract type DemosaicMethod end

struct BayerAverage <: DemosaicMethod end

function demoisaic(algorithm::T, image::Image) where T <: DemosaicMethod
    w, h = width(image), height(image)
    debayered = zeros(w, h, 3)
    
    !image.isunpacked && unpack!(image)
    demoisaic!(algorithm, debayered, image)
    debayered
end

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

function demoisaic!(algorithm::BayerAverage, debayered, image::Image)

    col_indices = color_index(image)
    raw_data = raw_image(image)

    @assert size(col_indices) == size(raw_data)
    @assert size(col_indices) == size(debayered)[1:2]
    @assert size(debayered, 3) == 3

    @assert LibRaw.color_description(image) == "RGBG" # Color index is hardcoded right now

    @inbounds for i = 2:size(debayered,1)-1
        for j = 2:size(debayered,2)-1
            colidx = col_indices[i,j]
            colidx = colidx == 4 ? 2 : colidx #channel 4 is also green

            for channel in 1:3
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

