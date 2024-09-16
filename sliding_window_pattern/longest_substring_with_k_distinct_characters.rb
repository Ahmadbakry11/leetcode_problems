def longest_substring_with_k_distinct(str, k)
  arr = str.chars
  hash = Hash.new(0)
  s = 0; e = 0; longest_sub_str = -Float::INFINITY; count = 0
  
  while e < arr.size
    hash[arr[e]] += 1
    count += 1
    if hash.length <= k
      longest_sub_str = [longest_sub_str, count].max 
    else
      while hash.length > k
        hash.delete(arr[s]) if hash[arr[s]] == 1
        hash[arr[s]] -= 1 if hash[arr[s]] > 1
        count -= 1
        s += 1
      end
    end
    e += 1
  end
  longest_sub_str
end
str = "araaci"; k = 2
# str = "cbbebi"; k = 3
p longest_substring_with_k_distinct(str, k)
