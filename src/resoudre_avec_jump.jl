# Voici comment résoudre un problème d'optimisation 
# en utlisant le package JuMP avec l'optimiseur Ipopt  

"""
import Pkg
Pkg.add("JuMP") # à exécuter juste la première fois
Pkg.add("Ipopt") # à exécuter juste la première fois
"""
"""
using JuMP
using Ipopt
"""

# Le cas des contraintes linéaires
"""
# création du model
m = Model(Ipopt.Optimizer)

# Ajouter des variables au model (faites attention à la dimension de x !)
@variable(m, x[1:3])
# Définir la fonction à minimiser
@objective(m, Min, fct1(x))
# Ajouter une contrainte
@constraint(m, contrainte1(x) == 0)
# résoudre le problème
optimize!(m);						
"""

# Le cas des contraintes non linéaires
"""
# Attention : les variables doivent être scalaires dans le cas des contraintes non linéaires 
# création du model
m = Model(Ipopt.Optimizer)

# Ajouter une variable
@variable(m, x[1:2])
cont2(x,y) = x^2 + y^2 - 1.5
fonct2(x,y)=100*(y-x^2)^2+(1-x)^2
register(m, :fonct2,2,fonct2,autodiff=true)
register(m, :cont2,2,cont2,autodiff=true)

# Définir la fonction à minimiser
@NLobjective(m, Min, fonct2(x[1],x[2]))
# Ajouter une contrainte
@NLconstraint(m, cont2(x[1],x[2]) == 0)

# résoudre le problème
optimize!(m);
"""