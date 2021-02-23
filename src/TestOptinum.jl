module TestOptinum

using Test
using Markdown

# ne pas afficher le stacktrace des tests
#include("cacher_stacktrace.jl")
#export cacher_stacktrace


# Tolérance pour les tests d'égalité
tol_erreur = sqrt(eps())
export tol_erreur

## ajouter les fonctions de test
include("fonctions_de_tests.jl")
export pts1,pts2
export sol_exacte_fct1,fct1,grad_fct1,hess_fct1
export sol_exacte_fct2,fct2,grad_fct2,hess_fct2
export sol_fct1_augm,contrainte1,grad_contrainte1,hess_contrainte1
export sol_fct2_augm,contrainte2,grad_contrainte2,hess_contrainte2
export afficher_resultats

include("tester_algo_newton.jl")
export tester_algo_newton

include("tester_pas_de_cauchy.jl")
export tester_pas_de_cauchy

include("tester_gct.jl")
export tester_gct

include("tester_regions_de_confiance.jl")
export tester_regions_de_confiance

include("tester_lagrangien_augmente.jl")
export tester_lagrangien_augmente

end # module
