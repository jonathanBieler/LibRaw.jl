module LibRaw

    using LoopVectorization
    import Base.maximum

    include("lib/LibRaw.jl")
    include("Image.jl")
    include("demosaic.jl")
    include("post_processing.jl")
    include("auxiliary.jl")
    
end
