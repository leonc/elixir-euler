# compute the smallest number evenly divisible by all the numbers
# from 1 to 20.
# bascially, we start making a list of prime factors. for each
# number from 1 to 20, we find its prime factorization and then
# make sure that all its factors are in the list. any not already
# in the list are added to it. then we mutlply the prime factors
# together and we are done!
#> [2, 2, 5] -- [2, 3, 5, 13 ,11, 2]
# []
# > [2, 5 ,3] -- [5,3]
# [2]
defmodule Problem_5 do

  # common to both solutions
  def prime_factors(x, n) when x == n do
    [x]
  end
    
  def prime_factors(x, n) when rem(x,n) == 0 do
    [n] ++ prime_factors( div(x,n), 2)
  end

  def prime_factors(x, n) do
    prime_factors(x,n+1)
  end

  def prime_factors(x) when x == 1 do
    []
  end

  def prime_factors(x) do
    prime_factors(x, 2)
  end

  # ########################################
  # map reduce version. or reduce reduce.
  # ########################################
  def unique_prime_factors(new,existing) do
    existing ++ (new -- existing)
  end

  def solve(x) do
    all_factors = Enum.reduce(1..x, [], fn(y,factors) -> unique_prime_factors(prime_factors(y), factors) end)
    Enum.reduce(all_factors, 1, fn(x, acc) -> x * acc end) 
  end 

  # ########################################
  # attempt #2
  # ########################################
  def add_new_factors(x,existing_factors) when x == 1 do
    existing_factors
  end

  def add_new_factors(x,existing_factors) do
    temp = existing_factors ++ ( prime_factors(x) -- existing_factors)
    add_new_factors(x-1,temp)
  end
    
  def solve2(x) do
    all_factors = add_new_factors(x,[])
    Enum.reduce(all_factors, 1, fn(x, acc) -> x * acc end) 
  end

end 

