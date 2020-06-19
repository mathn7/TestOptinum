using Documenter
using TestOptinum

makedocs(
    modules = [TestOptinum],
    sitename = "TestOptinum.jl",
    authors = "Saloua Naama, Mohamed El Waghf et Rachid ELMontassir",
    format = Documenter.HTML(prettyurls = get(ENV, "CI", nothing) == "true"),
    pages = [
	     "Acceuil" =>"index.md" ,
	     "Index des fonctions" =>"fct_index.md"	                       
            ]
    )

deploydocs(repo   = "github.com/mathn7/TestOptinum.git")
