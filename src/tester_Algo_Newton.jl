using Test

"""
Tester l'algorithme de Newton local

#Entrées :
   * affichage : (Bool) affichage ou non des résultats de chaque test

"""

function tester_Algo_Newton(affichage,Algorithme_De_Newton::Function)

	eps = 1e-6
	maxits = 50
	tol = 1e-15

	options = [eps;maxits;tol]


	tol_erreur = 1e-2

	x_min11, fx_min, flag, nb_iters = Algorithme_De_Newton(fct1,grad_fct1,hess_fct1,pts1.x011,options)
	if (affichage)
		afficher_resultats("algorithme de Newton ","fct1","x011",x_min11,fx_min,flag,sol_exacte_fct1,nb_iters)
	end

	x_min12, fx_min, flag, nb_iters = Algorithme_De_Newton(fct1,grad_fct1,hess_fct1,pts1.x012,options)
	if (affichage)
		afficher_resultats("algorithme de Newton ","fct1","x012",x_min12,fx_min,flag,sol_exacte_fct1,nb_iters)
	end

	x_min21, fx_min, flag, nb_iters = Algorithme_De_Newton(fct2,grad_fct2,hess_fct2,pts1.x021,options)
	if (affichage)
		afficher_resultats("algorithme de Newton ","fct2","x021",x_min21,fx_min,flag,sol_exacte_fct2,nb_iters)
	end

	x_min22, fx_min, flag, nb_iters = Algorithme_De_Newton(fct2,grad_fct2,hess_fct2,pts1.x022,options)
	if (affichage)
		afficher_resultats("algorithme de Newton ","fct2","x022",x_min22,fx_min,flag,sol_exacte_fct2,nb_iters)
		println("\n")
	end


	#=
	x_min, fx_min, flag, nb_iters = Algorithme_De_Newton(fct2,grad_fct2,hess_fct2,pts1.x023,eps,maxits)
	#@test norm(x_min-sol_exacte_fct2,2) < 1e-2
	#@test norm(fx_min)<1e-5
	if norm(x_min-sol_exacte_fct2,2) < 1e-2
		nbtest_reu = nbtest_reu + 1
	end
	printstyled("=> ",bold=true,color=:white)
	nbtest_total = nbtest_total + 1

	if (affichage)
		println("-------------------------------------------------------------------------")
		println("Résultats de l'algorithme de Newton avec la fct2 et le point initial x023:")
		println("    * xsol = ",x_min)
		println("    * f(xsol) = ",fx_min)
		println("    * flag = ",flag)
		println("    * nb_iters = ",nb_iters)
	end
	=#


	"# tests avec les annotations de la librairie Test"

	res = @testset "L'algorithme de Newton" begin 
		   @test isapprox(x_min11, sol_exacte_fct1 ,atol=tol_erreur)
		   @test x_min12 ≈ sol_exacte_fct1 atol=tol_erreur
		   @test x_min21 ≈ sol_exacte_fct2 atol=tol_erreur
		   @test x_min22 ≈ sol_exacte_fct2 atol=tol_erreur
	end
	println("\n")

	return 

end
