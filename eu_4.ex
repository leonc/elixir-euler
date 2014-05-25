defmodule Problem_4 do

  def is_palindrome(num) do
    string = integer_to_binary(num)
    string == String.reverse(string)
  end

  def solve(x,y,y_for_next_x) when x == 999 and y == 999 do
    false
  end

  def solve(x,y,y_for_next_x) when y == 999 do
    solve(x+1,y_for_next_x,y_for_next_x)
  end

  def solve(x,y,y_for_next_x) do
    if is_palindrome(x*y) do
      y_for_next_x = div x*y, x+1
      solve(x,y+1,y_for_next_x) || x*y
    else
      solve(x,y+1,y_for_next_x)
    end
  end

  def solve() do
    solve(100,100,100)
  end
end

