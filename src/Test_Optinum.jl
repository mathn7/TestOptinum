module Test_Optinum

include("test_Algo_Newton.jl")
export test_Algo_Newton

include("test_pas_de_cauchy.jl")
export test_pas_de_cauchy

include("test_regions_de_confiance.jl")
export test_regions_de_confiance

include("test_Lagrangien_Augmente.jl")
export test_Lagrangien_Augmente

end # module
