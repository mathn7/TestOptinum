using Documenter
using Test_Optinum

makedocs(
    modules = [Test_Optinum],
    sitename = "Test_Optinum.jl",
    authors = "Saloua Naama, Mohamed El Waghf et Rachid ELMontassir",
    format = Documenter.HTML(prettyurls = get(ENV, "CI", nothing) == "true"),
    pages = [
	     "Acceuil" =>"index.md" ,
	     "Index des fonctions" =>"fct_index.md"	                       
            ]
    )

deploydocs(repo   = "github.com/mathn7/Test_Optinum.git")
