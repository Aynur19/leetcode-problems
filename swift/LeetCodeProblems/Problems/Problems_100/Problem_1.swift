//
//  Problem_1.swift
//  LeetCodeProblems
//
//  Created by Aynur Nasybullin on 05.10.2023.
//

// 1. Two Sum
// Easy
// Topics: Array, Hash Table

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
    // Link: https://leetcode.com/problems/two-sum/description/
    // Approach: Hash Table
    // Time complexity: O(n) => 24 ms
    // Space complexity: O(n) => 16.40 MB
    func problem_1_twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        guard nums.count > 1 else { return [] }
        var dict = [Int:Int]()
        
        for idx in nums.indices {
            let num = nums[idx]
            
            if let index = dict[target - num] {
                return [index, idx]
            }
            
            dict[num] = idx
        }
        
        return []
    }
}

extension ProblemsTestCases {
    static func testsData_1() -> [(nums: [Int], target: Int, expected: [Int])] {
        var testsData = [(nums: [Int], target: Int, expected: [Int])]()
        
        testsData.append((nums: [2, 7, 11, 15], target: 9, expected: [0, 1]))
        testsData.append((nums: [3, 2, 4],      target: 6, expected: [1, 2]))
        testsData.append((nums: [3, 3],         target: 6, expected: [0, 1]))
        
        return testsData
    }
}
