// 179. Largest Number
// Solved
// Medium
// Topics: Array, String, Greedy, Sorting
// Companies

// Given a list of non-negative integers nums, arrange them such that they form the largest number and return it.
// 
// Since the result may be very large, so you need to return a string instead of an integer.

// Example 1: 
// Input: nums = [10,2]
// Output: "210"
//
// Example 2:
// Input: nums = [3,30,34,5,9]
// Output: "9534330"

// Constraints:
// 1 <= nums.length <= 100
// 0 <= nums[i] <= 10^9


// Time complexity: O(n + n log(n))
// Time complexity: O(n)
class Solution {
    func largestNumber(_ nums: [Int]) -> String {
        var zeroCount = nums.reduce(into: 0) { result, item in
            result += item == 0 ? 1 : 0
        }

        if zeroCount == nums.count  { return "0" }

        return nums
            .map { String($0) }
            .sorted { str1, str2 in
                if let num1 = UInt(str1 + str2), 
                   let num2 = UInt(str2 + str1) {
                    return num1 >= num2
                } else {
                    return false
                }
            }
            .joined()
    }
}