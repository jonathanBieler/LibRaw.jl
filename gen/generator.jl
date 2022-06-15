using Clang.Generators
using LibRaw_jll  # replace this with your jll package

cd(@__DIR__)

include_dir = normpath(LibRaw_jll.artifact_dir, "include")
libraw_dir = joinpath(include_dir, "libraw")

options = load_options(joinpath(@__DIR__, "generator.toml"))

# add compiler flags, e.g. "-DXXXXXXXXX"
args = get_default_args()  # Note you must call this function firstly and then append your own flags
push!(args, "-I$include_dir")

headers = [joinpath(libraw_dir, header) for header in readdir(libraw_dir) if endswith(header, ".h")]
# there is also an experimental `detect_headers` function for auto-detecting top-level headers in the directory
# headers = detect_headers(clang_dir, args)
headers = [joinpath(libraw_dir, "libraw.h")]

# create context
ctx = create_context(headers, args, options)

# run generator
build!(ctx)