defmodule Problem_7 do

  def is_prime?(x, n) when x == n do
    true
  end

  def is_prime?(x, n) when rem(x,n) == 0 do
    false
  end

  def is_prime?(x, n) do
    is_prime?(x,n+1)
  end

  def is_prime?(x) when x == 1 do
    # 1 is NOT prime
    false
  end

  def is_prime?(x) do
    is_prime?(x, 2)
  end

  def find_prime(found_primes, curr_target, target_nth_prime) when found_primes == target_nth_prime do
    curr_target-1
  end

  def find_prime(found_primes, curr_target, target_nth_prime) do
    if is_prime?(curr_target) do
      find_prime(found_primes+1,curr_target+1,target_nth_prime)
    else
      find_prime(found_primes, curr_target+1, target_nth_prime)
    end
  end

  def solve(nth) do
    find_prime(1, 3, nth)
  end
  
end

