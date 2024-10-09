# 179. Largest Number
# Solved
# Medium
# Topics: Array, String, Greedy, Sorting
# Companies

# Given a list of non-negative integers nums, arrange them such that they form the largest number and return it.
# 
# Since the result may be very large, so you need to return a string instead of an integer.
# Example 1: 
# Input: nums = [10,2]
# Output: "210"
#
# Example 2:
# Input: nums = [3,30,34,5,9]
# Output: "9534330"

# Constraints:
# 1 <= nums.length <= 100
# 0 <= nums[i] <= 10^9


# Time complexity: O(n + n log(n))
# Time complexity: O(n)
from typing import List
from functools import cmp_to_key

class Solution:
    def largestNumber(self, nums: List[int]) -> str:
        if next((x for x in nums if x != 0), None) == None:
            return "0"
        
        return ''.join(sorted(
                list(map(lambda x: str(x), nums)),
                key=(cmp_to_key(custom_compare))
            ))



def custom_compare(a: str, b: str):
    num1 = int(a + b)
    num2 = int(b + a)

    if num1 > num2:
        return -1
    elif num1 == num2:
        return 0
    else:
        return 1
    
