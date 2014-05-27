defmodule Problem_7 do

  # if we get all the way to trying the number itself. this shouldn't 
  # happen with the 1/2 and 1/3 short circuits.
  def is_prime?(x, n) when x == n do
    true
  end

  def is_prime?(x, n) when rem(x,n) == 0 do
    false
  end

  # if we are checking a factor n where n > 3 and n > one third
  # the number we are checking, then the number has to be prime
  def is_prime?(x, n) when ((n > 3) and (n > ((x/3) + 1))) do
    # IO.puts "special case for 3 for #{x}"
    true
  end

  # if we are checking a factor n where n > 2 AND n > half 
  # the number we are checking, then the number has to be prime
  def is_prime?(x, n) when ((n > 2) and (n > ((x/2) + 1))) do
    # IO.puts "special case for 2 for #{x}"
    true
  end

  def is_prime?(x, n) when n == 2 do
    is_prime?(x,n+1)
  end

  def is_prime?(x, n) do
    is_prime?(x,n+2)
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

