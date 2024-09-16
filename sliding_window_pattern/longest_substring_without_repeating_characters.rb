# problem source:
# https://leetcode.com/problems/longest-substring-without-repeating-characters/

def length_of_longest_substring(s)
  return 0 if s.empty?
  st = 0; e = 0; count = 0;
  hash = Hash.new(0)
  longest_sub_str = -Float::INFINITY
  
  for e in 0...s.length
    while hash.key?(s[e])
      hash.delete(s[st])
      st += 1
      count -= 1
    end
    
    hash[s[e]] += 1
    count += 1
    longest_sub_str = [longest_sub_str, count].max
  end

  longest_sub_str
end

s = "aab"
p length_of_longest_substring(s)


# test cases

# Input: s = "abcabcbb"
# Output: 3

# Input: s = "bbbbb"
# Output: 1

# Input: s = "pwwkew"
# Output: 3