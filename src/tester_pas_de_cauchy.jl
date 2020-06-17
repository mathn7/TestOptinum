using Test

"""
Tester l'algorithme de pas de Cauchy 

#Entrées :
   * affichage : (Bool) affichage ou non des résultats de chaque test
	
"""

function tester_pas_de_cauchy(affichage,Pas_De_Cauchy::Function)

	tol_erreur = 1e-6
	sol_exacte_q1 = [0; 0]
	sol_exacte_q2 = [-0.9230769230769234; -0.30769230769230776]
	sol_exacte_q3 = [5.000000000000001; -2.5000000000000004]
	
	"# Pour la quadratique 1"
	g1 = [0; 0]
	H1 = [7 0 ; 0 2]
	delta1 = 1
	s1, e1 = Pas_De_Cauchy(g1,H1,delta1)

	"# Pour la quadratique 2"
	g2 = [6; 2]
	H2 = [7 0 ; 0 2]
	delta2 = 3	
	s2, e2 = Pas_De_Cauchy(g2,H2,delta2)

	"# Pour la quadratique 3"
	g3 = [-2; 1]
	H3 = [-2 0 ; 0 10]
	delta3 = 10
	s3, e3 = Pas_De_Cauchy(g3,H3,delta3)

	res = @testset "Pas de Cauchy" begin 
		@test e1 == 0 && (s1 ≈ sol_exacte_q1 atol=tol_erreur)
		@test e2 == 1 && (s2 ≈ sol_exacte_q2 atol=tol_erreur)
		@test e3 == 1 && (s3 ≈ sol_exacte_q3 atol=tol_erreur)		  
	end
	println("\n")

	return 

end
