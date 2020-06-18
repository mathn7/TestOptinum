using Test

"""
Tester l'algorithme du gradient conjugué tronqué

# Entrées :
   * affichage : (Bool) affichage ou non des résultats de chaque test

# Les cas de test (dans l'ordre)
   * la quadratique 1
   * la quadratique 2
   * la quadratique 3
   * la quadratique 4
   * la quadratique 5
   * la quadratique 6   
"""
function tester_gct(affichage,Gradient_Conjugue_Tronque::Function)

    tol = 1e-7
    max_iter = 100
    # Tolérance utilisé dans les tests
    tol_test = 1e-3

    # le cas de test 1
    grad = [0 ; 0]
    Hess = [7 0 ; 0 2]
    delta = 1  
    s1 = Gradient_Conjugue_Tronque(grad,Hess,[delta;max_iter;tol])
    # le résultat attendu
    sol_quad1 = [0.0 ; 0.0]

    # le cas de test 2
    grad = [6 ; 2]
    Hess = [7 0 ; 0 2]
    delta = 3  
    s2 = Gradient_Conjugue_Tronque(grad,Hess,[delta;max_iter;tol])
    # le résultat attendu
    sol_quad2 = [-0.857142857142857 ; -1.0]               

    # le cas de test 3
    grad = [-2 ; 1]
    Hess = [-2 0 ; 0 10]
    delta = 10  
    s3 = Gradient_Conjugue_Tronque(grad,Hess,[delta;max_iter;tol])
    # le résultat attendu
    sol_quad3 = [-9.486832980505138 ; -3.162277660168379]

    # le cas de test 4
    grad = [0 ; 0]
    Hess = [-2 0 ; 0 10]
    delta = 1  
    s4 = Gradient_Conjugue_Tronque(grad,Hess,[delta;max_iter;tol])
    # le résultat attendu
    sol_quad4 = [0.0 ; 0.0]

    # le cas de test 5
    grad = [2 ; 3]
    Hess = [4 6 ; 6 5]
    delta = 3  
    s5 = Gradient_Conjugue_Tronque(grad,Hess,[delta;max_iter;tol])
    # le résultat attendu
    sol_quad5 = [1.9059020876695578 ; -2.3167946029410595]

    # le cas de test 6
    grad = [2 ; 0]
    Hess = [4 0 ; 0 -15]
    delta = 2  
    s6 = Gradient_Conjugue_Tronque(grad,Hess,[delta;max_iter;tol])
    # le résultat attendu
    sol_quad6 = [-0.5 ; 0.0]                                 
    

    # tester les résultats
    res = @testset "Gradient conjugué tronqué" begin 
            @test  s1 ≈ sol_quad1   atol = tol_test
            @test  s2 ≈ sol_quad2   atol = tol_test
            @test  s3 ≈ sol_quad3   atol = tol_test
            @test  s4 ≈ sol_quad4   atol = tol_test
            @test  s5 ≈ sol_quad5   atol = tol_test
            @test  s6 ≈ sol_quad6   atol = tol_test 
    end
    return 
end