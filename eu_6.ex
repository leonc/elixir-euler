defmodule Problem_6 do

  def solve(x) do
    z = Enum.reduce(1..x, 0, fn(y,acc) -> acc + y*y end) 
    sum = Enum.reduce(1..x, 0, fn(y,acc) -> acc + y end)
    (sum * sum) - z
  end

end


#TODO: i'm an idiot. there is a more clever solution. 
# (1 + 2 + 3)(1 + 2 + 3) =
# 1^2 + 1*2 + 1*3 + 1*2 + 2*2 + 2*3 + 3*1 + 3*2 + 3*3)
# so the diff between that and 1^2 + 2^2 + 3^2 is 
# 1*2 + 1*3 + 1*2 + 2*3 + 3*1 + 3*2
# this is 2(every number times every other number)
defmodule Problem_6b do
  def clever(max) do
    Enum.reduce(1..max, 0, fn(y,acc) -> acc + every_other(y,max) end)
  end

  def every_other(this_number, max) do
    Enum.reduce(1..max, 0, fn(z, acc) -> acc + (
      if (z == this_number) do
        0
      else
       (this_number * z)
      end
      ) end )
    # it would be awesome if this worked, but i think you have to add
    # something to acc every time or it bonks.
    # Enum.reduce(1..max, 0, fn(z, acc) -> unless (z == this_number), do: (acc + (this_number * z)) end ) 
   end

end

