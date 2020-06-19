using Test

Test.eval(quote
       function record(ts::DefaultTestSet, t::Union{Fail, Error})
           if myid() == 1
               printstyled(ts.description, ": ", color=:white)
               # don't print for interrupted tests
               if !(t isa Error) || t.test_type != :test_interrupted
                   # print(t) # afficher le resultat et la solution attendu                    
                   if !isa(t, Error)
                       # Base.show_backtrace(stdout, scrub_backtrace(backtrace())) # afficher le backtrace
                   end
                   println()
               end
           end
           push!(ts.results, t)
           t, isa(t, Error) || backtrace()
       end
       end)