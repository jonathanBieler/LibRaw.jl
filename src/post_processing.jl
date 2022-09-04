
function apply_multipliers!(d::Array{T, 3}, multipliers; normalize = true) where T
    @assert size(d, 3) == 4
    if normalize
        multipliers ./= minimum(multipliers[1:3]) 
        @assert multipliers[4] > 0.0
    end
    for channel in 1:4
        d[:,:, channel] .*= multipliers[channel]
    end
    d
end

function apply_maxtrix!(d::Array{T, 3}, matrix) where T
    @assert size(d, 3) == 4 
    for i in axes(d, 1), j in axes(d,2)
        d[i,j,1:3] .= matrix * d[i,j,:]
    end
    d
end