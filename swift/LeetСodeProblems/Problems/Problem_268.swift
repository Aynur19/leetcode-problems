//
//  Problem_268.swift
//  LeetСodeProblems
//
//  Created by Aynur Nasybullin on 29.01.2024.
//

//  268. Missing Number
//  Easy
//  Topics: Array, Hash Table, Math, Binary Search, Bit Manipulation, Sorting

//  Given an array nums containing n distinct numbers in the range [0, n],
//  return the only number in the range that is missing from the array.

//  Example 1:
//  Input: nums = [3,0,1]
//  Output: 2
//  Explanation: n = 3 since there are 3 numbers, so all numbers are in the range [0,3].
//  2 is the missing number in the range since it does not appear in nums.
//
//  Example 2:
//  Input: nums = [0,1]
//  Output: 2
//  Explanation: n = 2 since there are 2 numbers, so all numbers are in the range [0,2].
//  2 is the missing number in the range since it does not appear in nums.
//
//  Example 3:
//  Input: nums = [9,6,4,2,3,5,7,0,1]
//  Output: 8
//  Explanation: n = 9 since there are 9 numbers, so all numbers are in the range [0,9].
//  8 is the missing number in the range since it does not appear in nums.
 
//  Constraints:
//  n == nums.length
//  1 <= n <= 10^4
//  0 <= nums[i] <= n
//  All the numbers of nums are unique.
 
//  Follow up: Could you implement a solution using only O(1) extra space complexity and O(n) runtime complexity?

extension Problems {
    // Approach: Math
    // Time complexity: O(n) = 123 ms
    // Space complexity: O(1) = 15.64 MB
    static func problem_268_missingNumber(_ nums: [Int]) -> Int {
        let n = nums.count
        let result = n * (n + 1) / 2
    
        return result - nums.reduce(0, +)
    }
    
    // Approach: Math
    // Time complexity: O(n) = 126 ms
    // Space complexity: O(1) = 16 MB
    static func problem_268_missingNumber2(_ nums: [Int]) -> Int {
        var result = nums.count
        
        for idx in nums.indices {
            result += idx - nums[idx]
        }
        
        return result
    }
    
    // Approach: Modified Array
    // Time complexity: O(n) = 135 ms
    // Space complexity: O(n) = 15.83 MB
    static func problem_268_missingNumber3(_ nums: [Int]) -> Int {
        let n = nums.count
        var nums = nums
        
        for idx in nums.indices {
            while idx != nums[idx] && nums[idx] != n {
                nums.swapAt(idx, nums[idx])
            }
        }
        
        for idx in nums.indices {
            if nums[idx] == n { return idx }
        }
        
        return n
    }
    
    // Approach: XOR
    // Time complexity: O(n) = 126 ms
    // Space complexity: O(n) = 15.63 MB
    static func problem_268_missingNumber4(_ nums: [Int]) -> Int {
        var result = nums.count
        
        for idx in nums.indices {
            result ^= idx ^ nums[idx]
        }
        
        return result
    }
}
