defmodule Problem_8 do

  def char_to_num(char) do
    char - ?0
  end

  def calc_bit(string) do
    if String.contains?(string,"0") do
      0
    else
      {_, string_list} = String.to_char_list(string)
      Enum.reduce(string_list, 1, fn(x,acc) -> acc * char_to_num(x) end )
    end
  end

  def check_string(index,full_string,target_length,curr_max_product) do
    if (index > (String.length(full_string) - target_length)) do
      curr_max_product
    else
      this_bit = String.slice(full_string,index..(index+target_length-1))
      IO.puts "this bit is #{this_bit}"
      this_prod = calc_bit(this_bit)
      IO.puts "the prod at index #{index} is #{this_prod} "

      if this_prod == 0 do
        # TODO: skip past the zero and call check string
        check_string(index+1,full_string,target_length,curr_max_product)
      else
        if this_prod > curr_max_product do
          check_string(index+1,full_string,target_length,this_prod)
        else
          check_string(index+1,full_string,target_length,curr_max_product)
        end
      end
    end
  end

  def solve(string,digits) do
    check_string(0,string,digits,0)
  end

  def solve(digits) do
    #TODO: if i were clever I'd define this as a _ick_ global
    solve("7316717653133062491922511967442657474235534919493496983520312774506326239578318016984801869478851843858615607891129494954595017379583319528532088055111254069874715852386305071569329096329522744304355766896648950445244523161731856403098711121722383113622298934233803081353362766142828064444866452387493035890729629049156044077239071381051585930796086670172427121883998797908792274921901699720888093776657273330010533678812202354218097512545405947522435258490771167055601360483958644670632441572215539753697817977846174064955149290862569321978468622482839722413756570560574902614079729686524145351004748216637048440319989000889524345065854122758866688116427171479924442928230863465674813919123162824586178664583591245665294765456828489128831426076900422421902267105562632111110937054421750694165896040807198403850962455444362981230987879927244284909188845801561660979191338754992005240636899125607176060588611646710940507754100225698315520005593572972571636269561882670428252483600823257530420752963450",digits)
  end
end

