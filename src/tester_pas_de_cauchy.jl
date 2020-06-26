@doc doc"""
Tester l'algorithme de pas de Cauchy 

# Entrées :
   * afficher : (Bool) affichage ou non des résultats de chaque test
   
# Les cas de test (dans l'ordre)
   * quadratique 1
   * quadratique 2
   * quadratique 3	
"""
function tester_pas_de_cauchy(afficher::Bool,Pas_De_Cauchy::Function)
	
	tol_erreur = 1e-6
					
	@testset "Pas de Cauchy" begin 	 	
		"# Pour la quadratique 1"
		g = [0; 0]
		H = [7 0 ; 0 2]
		delta = 1
		s, e = Pas_De_Cauchy(g,H,delta)
		@test (e == 0) && (isapprox(s,[0; 0],atol=tol_erreur))

		"# Pour la quadratique 2"
		g = [6; 2]
		H = [7 0 ; 0 2]
		delta = 3	
		s, e = Pas_De_Cauchy(g,H,delta)
		@test (e == 1) && (isapprox(s,[-0.9230769230769234; -0.30769230769230776],atol=tol_erreur))

		"# Pour la quadratique 3"
		g = [-2; 1]
		H = [-2 0 ; 0 10]
		delta = 10
		s, e = Pas_De_Cauchy(g,H,delta)
		@test (e == 1) && (isapprox(s,[5.0; -2.5],atol=tol_erreur))		 
	end
end
