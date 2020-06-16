module Test_Optinum

## ajouter les fonctions de test
include("fonctions_de_tests.jl")
export pts1,pts2
export sol_exacte_fct1,fct1,grad_fct1,hess_fct1
export sol_exacte_fct2,fct2,grad_fct2,hess_fct2
export sol_fct1_augm,contrainte1,grad_contrainte1,hess_contrainte1
export sol_fct2_augm,contrainte2,grad_contrainte2,hess_contrainte2,phi

include("test_Algo_Newton.jl")
export test_Algo_Newton

include("test_pas_de_cauchy.jl")
export test_pas_de_cauchy

include("test_regions_de_confiance.jl")
export test_regions_de_confiance

include("test_Lagrangien_Augmente.jl")
export test_Lagrangien_Augmente



end # module
