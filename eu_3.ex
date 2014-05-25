defmodule Problem_3 do

  def factor(x,n) when x == n do
    n
  end

  def factor(x,n) when rem(n,x) == 0 do
    factor(2,div(n,x))
  end

  def factor(x,n) do
    factor(x+1,n)
  end

  def factor(n) do
    factor(2,n)
  end

end

