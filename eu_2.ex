defmodule Problem_2 do
  def solve(x,y) do
    case y do
      z when z > 4_000_000 -> 0
      z when rem(z,2) == 0 -> y + solve(y,x+y)
      _ -> solve(y,x+y)
    end
  end
end

defmodule Problem_2b do
  def solve(x,y) when y > 4_000_000 do
    0
  end
  
  def solve(x,y) when rem(y,2) == 0 do
    y + solve(y,x+y)
  end
  
  def solve(x,y) do
    solve(y,x+y)
  end

end


