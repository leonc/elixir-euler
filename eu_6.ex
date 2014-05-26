defmodule Problem_6 do

  def solve(x) do
    z = Enum.reduce(1..x, 0, fn(y,acc) -> acc + y*y end) 
    sum = Enum.reduce(1..x, 0, fn(y,acc) -> acc + y end)
    (sum * sum) - z
  end

end
