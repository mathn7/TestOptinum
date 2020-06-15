# Test_Optinum
Module de tests

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
