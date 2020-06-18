using Test

"""
Tester l'algorithme du Lagrangien augmenté

# Entrées :
   * affichage : (Bool) affichage ou non des résultats de chaque test

# Les cas de test (dans l'ordre)
   * Newton 
      * fct1 : x01, x02
	  * fct2 : x03, x04
   * gct
      * fct1 : x01, x02
	  * fct2 : x03, x04
   * Cauchy
      * fct1 : x01, x02
      * fct2 : x03, x04  
"""
function tester_Lagrangien_Augmente(afficher,Lagrangien_Augmente::Function)

	"# initialisation des paramètres"
	lambda0 = 2
	mu0 = 10
	tho = 2
	epsilon = 1e-8
	tol = 1e-5
	max_iters = 1000
	options = [epsilon,tol,max_iters,lambda0,mu0,tho]
	"# La tolérance utilisée dans les tests"
	tol_erreur = 1e-4
	
	"# Les trois algorithmes d'optimisations sans contraintes utlisés"
	algos = ["Newton","gct","Cauchy"]

	for algo in algos
												
		# le cas de test 1
		xmin1,fxmin1,flag,nbiters = Lagrangien_Augmente(algo,fct1,contrainte1,grad_fct1,hess_fct1,grad_contrainte1,
		hess_contrainte1,pts2.x01,options)
		if (afficher)
			afficher_resultats("Lagrangien augmenté avec "*algo,"fonction 1","x01",xmin1,fxmin1,flag,sol_fct1_augm,nbiters)
		end

		# le cas de test 2
		xmin2 ,fxmin2,flag,nbiters = Lagrangien_Augmente(algo,fct1,contrainte1,grad_fct1,hess_fct1,grad_contrainte1,
		hess_contrainte1,pts2.x02,options)
		if (afficher)
			afficher_resultats("Lagrangien augmenté avec "*algo,"fonction 1","x02",xmin2,fxmin2,flag,sol_fct1_augm,nbiters)
		end

		# le cas de test 3
		xmin3,fxmin3,flag,nbiters = Lagrangien_Augmente(algo,fct2,contrainte2,grad_fct2,hess_fct2,grad_contrainte2,
		hess_contrainte2,pts2.x03,options)
		if (afficher)
			afficher_resultats("Lagrangien augmenté avec "*algo,"fonction 2","x03",xmin3,fxmin3,flag,sol_fct2_augm,nbiters)
		end

		# le cas de test 4
		xmin4 ,fxmin4,flag,nbiters = Lagrangien_Augmente(algo,fct2,contrainte2,grad_fct2,hess_fct2,grad_contrainte2,
		hess_contrainte2,pts2.x04,options)
		if (afficher)
			afficher_resultats("Lagrangien augmenté avec "*algo,"fonction 2","x04",xmin4,fxmin4,flag,sol_fct2_augm,nbiters)
		end

		"# tester les résultats"
		nom_algo = "Lagrangien augmenté avec "*algo

		try
			res = @testset "$nom_algo"  begin
					@test isapprox(xmin1,sol_fct1_augm ,atol=tol_erreur)
					@test xmin2 ≈ sol_fct1_augm atol=tol_erreur
					@test xmin3 ≈ sol_fct2_augm atol=tol_erreur
					@test xmin4 ≈ sol_fct2_augm atol=tol_erreur
					end
		catch
			println("\n")
		end
	end
	return
end
