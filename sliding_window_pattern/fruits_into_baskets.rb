# problem source
# https://leetcode.com/problems/fruit-into-baskets/submissions/1391983905/

# description:
# You are visiting a farm that has a single row of fruit trees arranged from left to right. The trees are represented by an integer array fruits where fruits[i] is the type of fruit the ith tree produces.

# You want to collect as much fruit as possible. However, the owner has some strict rules that you must follow:

# You only have two baskets, and each basket can only hold a single type of fruit. There is no limit on the amount of fruit each basket can hold.
# Starting from any tree of your choice, you must pick exactly one fruit from every tree (including the start tree) while moving to the right. The picked fruits must fit in one of your baskets.
# Once you reach a tree with fruit that cannot fit in your baskets, you must stop.
# Given the integer array fruits, return the maximum number of fruits you can pick.

def total_fruit(fruits)
  s = 0; e = 0; hash = Hash.new(0); count = 0
  max_fruit_count = -Float::INFINITY

  for e in 0...fruits.size
    hash[fruits[e]] += 1
    count += 1

    if hash.length <= 2
      max_fruit_count = [max_fruit_count, count].max
    else
      while hash.length > 2
        hash.delete(fruits[s]) if hash[fruits[s]] == 1
        hash[fruits[s]] -= 1 if hash[fruits[s]] > 1
        count -= 1
        s += 1
      end
    end
  end
  
  max_fruit_count
end

# test cases
# Input: fruits = [1,2,1]
# Output: 3

# Input: fruits = [0,1,2,2]
# Output: 3

# Input: fruits = [1,2,3,2,2]
# Output: 4