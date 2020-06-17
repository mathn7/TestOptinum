using Test

"""
Tester l'algorithme du Lagrangien augmenté

#Entrées :
   * affichage : (Bool) affichage ou non des résultats de chaque test

"""

function tester_Lagrangien_Augmente(afficher,Lagrangien_Augmente::Function)

	"#initialisation des paramétres"
	lambda0 = 2
	mu0 = 10
	tho = 2

	"#paramétres utilisés pour définir les critéres d'arrêts "
	epsilon = 1e-8
	tol = 1e-5
	itermax = 1000
	options = [epsilon,tol,itermax,lambda0,mu0,tho]

	"#ensemble d'algorithmes d'optimisation sans contraintes"
	algos = ["newton","gct","cauchy"]

	"#norme de l'écart entre la solution trouvée et celle attendue"
	tol_erreur = 1e-4


	for algo in algos

			"# Test sur fct1 avec x01 comme solution initiale"
			"#résolution du problème avec la libraire JuMP"
			#=
			import Pkg
			Pkg.add("JuMP") # à exécuter une seule fois
			Pkg.add("Ipopt") # à exécuter une seule fois
			using JuMP
			using Ipopt
			
			#création du model
			m = Model(Ipopt.Optimizer)
			#définir les paramétres du model (faites attention à la dimension de x !)
			@variable(m, x[1:3])
			@objective(m, Min, fct1(x))
			@constraint(m, contrainte1(x) == 0)
			"#sauvegarder puis restorer la sortie pour empêcher l'affichage des résultats de 'optimize' "
			TT = stdout
			# sauvegarder la sortie
			redirect_stdout()
			#résoudre le problème
			optimize!(m);
			# restaurer la sortie
			redirect_stdout(TT)

			=#

			#résolution du problème avec le Lagrangien augmenté
			xmin1,fxmin1,flag,nbiters = Lagrangien_Augmente(algo,fct1,contrainte1,grad_fct1,hess_fct1,grad_contrainte1,
			hess_contrainte1,pts2.x01,options)

			#affichage des résultats du test
			if (afficher)
				afficher_resultats("Lagrangien augmenté avec "*algo,"fonction 1","x01",xmin1,fxmin1,flag,sol_fct1_augm,nbiters)
			end

			# Test sur fct1 avec x02 comme solution initiale

			#résolution du problème avec le Lagrangien augmenté
			xmin2 ,fxmin2,flag,nbiters = Lagrangien_Augmente(algo,fct1,contrainte1,grad_fct1,hess_fct1,grad_contrainte1,
			hess_contrainte1,pts2.x02,[])

			#affichage des résultats du test
			if (afficher)
				afficher_resultats("Lagrangien augmenté avec "*algo,"fonction 1","x02",xmin2,fxmin2,flag,sol_fct1_augm,nbiters)
			end


			"# Test sur fct2 avec x03 comme solution initiale"

			"#résolution du problème avec la libraire JumP"
			#=
			#création du model
			m = Model(Ipopt.Optimizer)

			#définir les paramétres du model (faites attention à la dimension de x !)
			@variable(m, x[1:2])
			register(m, :fonct2,2,fonct2,autodiff=true)
			register(m, :cont2,2,cont2,autodiff=true)
			"""#Attention : pour les contraintes non linéaires les variables ne peuvent être que des scalaires """

			@NLobjective(m, Min, fonct2(x[1],x[2]))
			@NLconstraint(m, cont2(x[1],x[2]) == 0)

			"#sauvegarder puis restorer la sortie pour empêcher l'affichage des résultats de 'optimize' "
			TT = stdout
			# sauvegarder la sortie
			redirect_stdout()
			#résoudre le problème
			optimize!(m);
			# restaurer la sortie
			redirect_stdout(TT)

			=#

			#résolution du problème avec le Lagrangien augmenté
			xmin3,fxmin3,flag,nbiters = Lagrangien_Augmente(algo,fct2,contrainte2,grad_fct2,hess_fct2,grad_contrainte2,
			hess_contrainte2,pts2.x03,[])


			#affichage des résultats du test
			if (afficher)
				afficher_resultats("Lagrangien augmenté avec "*algo,"fonction 2","x03",xmin3,fxmin3,flag,sol_fct2_augm,nbiters)
			end


			"# Test sur fct2 avec x04 comme solution initiale"

			#résolution du problème avec le Lagrangien augmenté
			xmin4 ,fxmin4,flag,nbiters = Lagrangien_Augmente(algo,fct2,contrainte2,grad_fct2,hess_fct2,grad_contrainte2,
			hess_contrainte2,pts2.x04,[])

			#affichage des résultats du test
			if (afficher)
				afficher_resultats("Lagrangien augmenté avec "*algo,"fonction 2","x04",xmin4,fxmin4,flag,sol_fct2_augm,nbiters)
			end



			"#tester les résultats obtenues"
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
			println("\n")

	end

	return
end
