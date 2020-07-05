# TestOptinum
Module de tests
| **Documentation** | **Intégration continue** | **Julia** |
|:-----------------:|:------------------------:|:---------:|
| [![](https://img.shields.io/badge/docs-dev-blue.svg)](https://mathn7.github.io/TestOptinum/dev/) |[![Build Status](https://travis-ci.com/mathn7/TestOptinum.svg?branch=master)](https://travis-ci.com/mathn7/TestOptinum)| [![](https://img.shields.io/github/v/release/JuliaLang/julia.svg)](https://docs.julialang.org) |


## installation

```julia
julia> ]
pkg> add https://github.com/mathn7/TestOptinum.git
julia> using TestOptinum
```
## Exemple d'utilisation des fonctions de test

sachant que la fonction ``Lagrangien_Augmente`` est dèjà inclus
,on peut la tester avec la ligne de commande :
```julia
julia>TestOptinum.test_Lagrangien_Augmente(false,Lagrangien_Augmente)
```
le premier paramètre est pour l'affichage des details du test.
