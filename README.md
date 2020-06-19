# Test_Optinum
Module de tests
| **Documentation** | **Intégration continue** | **Julia doc** |
|:-----------------:|:------------------------:|:-------------:|
| [![](https://img.shields.io/badge/docs-dev-blue.svg)](https://mathn7.github.io/Test_Optinum/dev/) |[![Build Status](https://travis-ci.com/mathn7/Test_Optinum.svg?branch=master)](https://travis-ci.com/mathn7/Test_Optinum)|[![](https://img.shields.io/badge/Julia--docs-v1-informational)](https://docs.julialang.org) |


## installation

```julia
julia> ]
pkg> add https://github.com/mathn7/Test_Optinum.git
julia> using Test_Optinum
```
## Exemple d'utilisation des fonctions de test

sachant que la fonction ``Lagrangien_Augmente`` est dèjà inclus
,on peut la tester avec la ligne de commande :
```julia
julia>Test_Optinum.test_Lagrangien_Augmente(false,Lagrangien_Augmente)
```
le premier paramètre est pour l'affichage des details du test.
