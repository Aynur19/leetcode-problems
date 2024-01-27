//
//  Problem_1.swift
//  LeetCodeProblems
//
//  Created by Aynur Nasybullin on 05.10.2023.
//

// 1. Two Sum
// Easy

// Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.
// You may assume that each input would have exactly one solution, and you may not use the same element twice.
// You can return the answer in any order.

// Example 1:
// Input: nums = [2,7,11,15], target = 9
// Output: [0,1]
// Explanation: Because nums[0] + nums[1] == 9, we return [0, 1].

// Example 2:
// Input: nums = [3,2,4], target = 6
// Output: [1,2]

// Example 3:
// Input: nums = [3,3], target = 6
// Output: [0,1]
 
// Constraints:
// 2 <= nums.length <= 10^4
// -10^9 <= nums[i] <= 10^9
// -10^9 <= target <= 10^9
// Only one valid answer exists.


extension Problems {
    // Approach: Hash Table
    // Time complexity: O(n) => 39 ms
    // Space complexity: O(n) => 14.29 MB
    static func problem_1_twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var dict = [Int:Int]()
        
        for i in nums.indices {                     
            let num = nums[i]
            
            if let idx = dict[target - num] {
                return [idx, i]
            }
            
            dict[num] = i
        }
        
        return []
    }
}
