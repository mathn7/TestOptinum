@doc doc"""
Tester l'algorithme du gradient conjugué tronqué

# Entrées :
   * afficher : (Bool) affichage ou non des résultats de chaque test

# Les cas de test (dans l'ordre)
   * la quadratique 1
   * la quadratique 2
   * la quadratique 3
   * la quadratique 4
   * la quadratique 5
   * la quadratique 6   
"""
function tester_gct(afficher::Bool,Gradient_Conjugue_Tronque::Function)

    effacer_stacktrace()
    tol = 1e-7
    max_iter = 100
    # Tolérance utilisé dans les tests
    tol_test = 1e-3

    res = @testset "Gradient conjugué tronqué" begin 
        # le cas de test 1
        grad = [0 ; 0]
        Hess = [7 0 ; 0 2]
        delta = 1  
        s = Gradient_Conjugue_Tronque(grad,Hess,[delta;max_iter;tol])        
        @test  s ≈ [0.0 ; 0.0] atol = tol_test

        # le cas de test 2
        grad = [6 ; 2]
        Hess = [7 0 ; 0 2]
        delta = 3  
        s = Gradient_Conjugue_Tronque(grad,Hess,[delta;max_iter;tol])        
        @test  s ≈ [-0.857142857142857 ; -1.0] atol = tol_test

        # le cas de test 3
        grad = [-2 ; 1]
        Hess = [-2 0 ; 0 10]
        delta = 10  
        s = Gradient_Conjugue_Tronque(grad,Hess,[delta;max_iter;tol])        
        @test  s ≈ [9.102342582478453; -4.140937032991381] atol = tol_test

        # le cas de test 4
        grad = [0 ; 0]
        Hess = [-2 0 ; 0 10]
        delta = 1  
        s = Gradient_Conjugue_Tronque(grad,Hess,[delta;max_iter;tol])        
        @test  s ≈ [0.0 ; 0.0]  atol = tol_test

        # le cas de test 5
        grad = [2 ; 3]
        Hess = [4 6 ; 6 5]
        delta = 3  
        s = Gradient_Conjugue_Tronque(grad,Hess,[delta;max_iter;tol])        
        @test  s ≈ [1.9059020876695578 ; -2.3167946029410595] atol = tol_test

        # le cas de test 6
        grad = [2 ; 0]
        Hess = [4 0 ; 0 -15]
        delta = 2  
        s = Gradient_Conjugue_Tronque(grad,Hess,[delta;max_iter;tol])        
        @test  s ≈ [-0.5 ; 0.0] atol = tol_test                                      
   end 
end