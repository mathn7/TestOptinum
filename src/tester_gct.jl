using Test

"""
Tester l'algorithme du gradient conjugué tronqué

#Entrées :
   * affichage : (Bool) affichage ou non des résultats de chaque test

"""

function tester_gct(affichage,Gradient_Conjugue_Tronque::Function)

    tol_erreur = 1e-3
    tol_gct = 1e-7
    max_iter = 100
    # Pour la quadratique 1
    grad1 = [0 ; 0]
    Hess1 = [7 0 ; 0 2]
    delta1 = 1
    s1 = Gradient_Conjugue_Tronque(grad1,Hess1,[delta1;max_iter;tol_gct])

    # Pour la quadratique 2
    grad2 = [6 ; 2]
    Hess2 = [7 0 ; 0 2]
    delta2 = 3
    s2 = Gradient_Conjugue_Tronque(grad2,Hess2,[delta2;max_iter;tol_gct])

    # Pour la quadratique 3
    grad3 = [-2 ; 1]
    Hess3 = [-2 0 ; 0 10]
    delta3 = 10
    s3 = Gradient_Conjugue_Tronque(grad2,Hess3,[delta3;max_iter;tol_gct])

    # Pour la quadratique 4
    grad4 = [0 ; 0]
    Hess4 = [-2 0 ; 0 10]
    delta4 = 1
    s4 = Gradient_Conjugue_Tronque(grad4,Hess4,[delta4;max_iter;tol_gct])

    # Pour la quadratique 5
    grad5 = [2 ; 3]
    Hess5 = [4 6 ; 6 5]
    delta5 = 3
    s5 = Gradient_Conjugue_Tronque(grad5,Hess5,[delta5;max_iter;tol_gct])

    # Pour la quadratique 6
    grad6 = [2 ; 0]
    Hess6 = [4 0 ; 0 -15]
    delta6 = 2
    s6 = Gradient_Conjugue_Tronque(grad6,Hess6,[delta6;max_iter;tol_gct])

    res = @testset "Gradient conjugué tronqué" begin 
            @test s1 ≈ [0.0 ; 0.0]                                atol = tol_erreur
            @test s2 ≈ [-0.857142857142857 ; -1.0]                atol = tol_erreur
            @test s3 ≈ [-9.486832980505138 ; -3.162277660168379]  atol = tol_erreur
            @test s4 ≈ [0.0 ; 0.0]                                atol = tol_erreur
            @test s5 ≈ [1.9059020876695578 ; -2.3167946029410595] atol = tol_erreur
            @test s6 ≈ [-0.5 ; 0.0]
    end
    println("\n")

    return 

end
