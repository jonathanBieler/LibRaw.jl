
function apply_multipliers!(d::Array{T, 3}, multipliers; normalize = true) where T
    @assert size(d, 3) == 4
    if normalize
        multipliers ./= minimum(multipliers[1:3]) 
        @assert multipliers[4] > 0.0
    end
    
    @turbo for i in axes(d, 1), j in axes(d,2), channel in axes(d,3)
        d[i, j, channel] *= multipliers[channel]
    end
    d
end

function apply_maxtrix!(d::Array{T, 3}, matrix) where T 
    @turbo for i in axes(d, 1), j in axes(d,2), k in axes(d,3)
        d[i,j,k] = 
            matrix[k,1]*d[i,j,1] + 
            matrix[k,2]*d[i,j,2] + 
            matrix[k,3]*d[i,j,3]
    end
    d
end