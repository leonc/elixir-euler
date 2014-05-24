defmodule Problem_1 do
  def solve(lim) do 
    case lim do
      0 -> 0
      x when rem(x,3) == 0 -> lim + solve(lim - 1)
      x when rem(x,5) == 0 -> lim + solve(lim - 1)
      _ -> solve(lim - 1)
    end 
  end 
end

