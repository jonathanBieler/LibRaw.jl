"""
    camera_list()

Returns list of supported cameras.
"""
function camera_list()
    camera_count = libraw_cameraCount()
    ptr = libraw_cameraList()
    @assert ptr != C_NULL
    [unsafe_string(unsafe_load(ptr,i)) for i in 1:camera_count]
end