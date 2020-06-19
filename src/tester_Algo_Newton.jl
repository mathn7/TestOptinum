@doc doc"""
Tester l'algorithme de Newton local

# Entrées :
   * afficher : (Bool) affichage ou non des résultats de chaque test

# Les cas de test (dans l'ordre)
   * fct 1 : x011,x012
   * fct 2 : x021,x022
"""
function tester_Algo_Newton(afficher::Bool,Algorithme_De_Newton::Function)
	
    # consommer le stacktrace des tests
	effacer_stacktrace()

	eps = 1e-6
	max_iters = 50
	tol = 1e-15
	options = [eps; max_iters; tol]
	tol_erreur = 1e-2

	res = @testset "L'algorithme de Newton" begin 
		# le cas de test 1
		x_min, fx_min, flag, nb_iters = Algorithme_De_Newton(fct1,grad_fct1,hess_fct1,pts1.x011,options)
		if (afficher)
			afficher_resultats("algorithme de Newton ","fct1","x011",x_min,fx_min,flag,sol_exacte_fct1,nb_iters)
		end
		@test isapprox(x_min, sol_exacte_fct1 , atol = tol_erreur)

		# le cas de test 2
		x_min, fx_min, flag, nb_iters = Algorithme_De_Newton(fct1,grad_fct1,hess_fct1,pts1.x012,options)
		if (afficher)
			afficher_resultats("algorithme de Newton ","fct1","x012",x_min,fx_min,flag,sol_exacte_fct1,nb_iters)
		end
		@test x_min ≈ sol_exacte_fct1  atol = tol_erreur

		# le cas de test 3
		x_min, fx_min, flag, nb_iters = Algorithme_De_Newton(fct2,grad_fct2,hess_fct2,pts1.x021,options)
		if (afficher)
			afficher_resultats("algorithme de Newton ","fct2","x021",x_min,fx_min,flag,sol_exacte_fct2,nb_iters)
		end
		@test x_min ≈ sol_exacte_fct2  atol = tol_erreur

		# le cas de test 4
		x_min, fx_min, flag, nb_iters = Algorithme_De_Newton(fct2,grad_fct2,hess_fct2,pts1.x022,options)
		if (afficher)
			afficher_resultats("algorithme de Newton ","fct2","x022",x_min,fx_min,flag,sol_exacte_fct2,nb_iters)
		end
		@test x_min ≈ sol_exacte_fct2  atol = tol_erreur 
	end
end