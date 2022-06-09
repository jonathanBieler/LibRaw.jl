using LibRaw
using Documenter

DocMeta.setdocmeta!(LibRaw, :DocTestSetup, :(using LibRaw); recursive=true)

makedocs(;
    modules=[LibRaw],
    authors="Jonathan Bieler <jonathan.bieler@alumni.epfl.ch> and contributors",
    repo="https://github.com/jonathanBieler/LibRaw.jl/blob/{commit}{path}#{line}",
    sitename="LibRaw.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://jonathanBieler.github.io/LibRaw.jl",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/jonathanBieler/LibRaw.jl",
    devbranch="main",
)
