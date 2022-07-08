mutable struct RawImage
    filename::String
    data::Ptr{libraw_data_t}
    isunpacked::Bool
end

Base.close(image::RawImage) = begin
    image.data == C_NULL && return
    libraw_close(image.data)
end

function RawImage(path::String) 
    data = libraw_init(0)
    image = RawImage(path, data, false)
    finalizer(close, image)
    
    err = libraw_open_file(data, path)
    err ≠ 0 && error("Got error code $err when opening file $path")
    
    image
end

"""
    LibRaw.height(image::RawImage)

returns height of the image (height).
"""
height(image::RawImage) = libraw_get_iheight(image.data)

"""
    LibRaw.width(image::RawImage)

returns width of the image (iwidth).
"""
width(image::RawImage)  = libraw_get_iwidth(image.data)

"""
    LibRaw.raw_height(image::RawImage)

returns raw height of the image.
"""
raw_height(image::RawImage) = libraw_get_raw_height(image.data)

"""
    LibRaw.raw_width(image::RawImage)

returns raw width of image.
"""
raw_width(image::RawImage)  = libraw_get_raw_width(image.data)

"""
    LibRaw.unpack!(image::RawImage)

Unpacks the RAW files of the image, calculates the black level.
"""
function unpack!(image::RawImage)
    if !image.isunpacked
        err = libraw_unpack(image.data)
        err == 0 || err("Error code $error recovered while unpacking image")
        image.isunpacked = true
    end
    image
end

"""
    LibRaw.subtract_black!(image::RawImage)

This call will subtract black level values from RAW data (for suitable RAW data).
"""
function subtract_black!(image::RawImage)
    LibRaw.libraw_subtract_black(image.data)
    image
end

"""
    LibRaw.color_index(image::LibRawImage)

Returns a matrix with the same dimension as the RAW image containing the color index.
"""
function color_index(image::RawImage)
    w,h = raw_width(image), raw_height(image)

    idx = zeros(Cint, h, w)
    for i=1:h, j=1:w
        idx[i,j] = color_index(image.data, i, j)
    end
    idx
end
color_index(ptr::Ptr{libraw_data_t}, i, j) = libraw_COLOR(ptr, i-1, j-i) + 1


# Accessors

function image(image::RawImage)
    ptr = Ptr{Ptr{NTuple{4, ushort}}}(image.data + fieldoffset(libraw_data_t, 1))
    @assert ptr != C_NULL
    unsafe_load(ptr)
end

function rawdata(image::RawImage)
    ptr = Ptr{libraw_rawdata_t}(image.data + fieldoffset(libraw_data_t, 13))
    @assert ptr != C_NULL
    ptr
end

"""
    iparams(image::RawImage)

Returns `iparams` struct from `libraw_data_t`.
"""
function iparams(image::RawImage)
    ptr = Ptr{libraw_iparams_t}(image.data + fieldoffset(libraw_data_t, 3))
    @assert ptr != C_NULL
    unsafe_load(ptr)
end

char_to_string(c::NTuple{N,Cchar})  where N = String([Char(c) for c in c if c != 0])

"""
    color_description(image::RawImage)

Description of colors numbered from 0 to 3 (RGBG,RGBE,GMCY, or GBTG).
"""
function color_description(image::RawImage)
    ip = iparams(image)
    char_to_string(ip.cdesc)
end

"""
    LibRaw.raw_image(image::RawImage)

Wraps the `raw_image` field of `libraw_rawdata_t` in an Array. The data might become 
corrupted when `image` is GC'ed.
"""
function raw_image(image::RawImage)
    rd = LibRaw.rawdata(image)
    ptr = Ptr{Ptr{LibRaw.ushort}}(rd + fieldoffset(LibRaw.libraw_rawdata_t, 2))
    @assert ptr != C_NULL
    raw_data = unsafe_load(ptr)

    w, h = raw_width(image), raw_height(image)

    return unsafe_wrap(Array, raw_data, (w,h))'
end

"""
    camera_multiplier(image:RawImage)

Return of vector of length 4 containing the camera multipliers
https://www.libraw.org/node/2411
"""
function camera_multiplier(image::RawImage)
    @assert image.data != C_NULL
    [libraw_get_cam_mul(image.data, i) for i in 0:3]
end
