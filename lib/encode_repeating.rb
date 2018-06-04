# A method that updates the string by replacing consecutive repeating characters
# with a number representing the frequency. The replacement is done only if the
# string length will get reduced by this process.

def encode_repeating(my_string)
  puts my_string

  if my_string == "" || my_string == nil || my_string.length == 0
    return my_string
  end


  new_arr = []
  hash = {}
  i = 0
  while i < my_string.length

    char = my_string[i]
    print char

    if hash[char]
      hash[char] += 1
    else
      hash[char] = 1
    end

    i += 1

  end

  puts hash


  hash.each do |k, v|
    if v <= 2
      v.times do
        new_arr << k
      end
    elsif v > 2
      new_arr << k
      new_arr << v
    end
  end

  puts new_arr
  puts new_arr.join

  my_string = new_arr.join
  return my_string
  # raise NotImplementedError
end
