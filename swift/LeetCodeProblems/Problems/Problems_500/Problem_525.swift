//
//  Problem_525.swift
//  LeetCodeProblems
//
//  Created by Aynur Nasybullin on 16.03.2024.
//

//  525. Contiguous Array
//  Medium
//  Topics: Array, Hash Table, Prefix Sum

//  Given a binary array nums, return the maximum length of a contiguous subarray with an equal number of 0 and 1.

//  Example 1:
//  Input: nums = [0,1]
//  Output: 2
//  Explanation: [0, 1] is the longest contiguous subarray with an equal number of 0 and 1.
//
//  Example 2:
//  Input: nums = [0,1,0]
//  Output: 2
//  Explanation: [0, 1] (or [1, 0]) is a longest contiguous subarray with equal number of 0 and 1.

//  Constraints:
//  1 <= nums.length <= 10^5
//  nums[i] is either 0 or 1.

extension Problems {
    // MARK: LeetCode Problem 525. Contiguous Array
    // Link: https://leetcode.com/problems/contiguous-array/description/
    // Approach: Array, Hash Table, Prefix Sum
    // Time complexity: O(n) => 161 ms
    // Space complexity: O(n) => 17.77 MB
    public func problem_525_findMaxLength(_ nums: [Int]) -> Int {
        var dict = [0:-1]
        var ones = 0
        var maxLength = 0
        var idx = -1
        
        for num in nums {
            idx += 1
            ones += num == 1 ? num : -1
            
            if let index = dict[ones] {
                maxLength = max(maxLength, idx - index)
            } else {
                dict[ones] = idx
            }
        }
        
        return maxLength
    }
}

extension ProblemsTestCases {
    static func testsData_525() -> [(nums: [Int], expected: Int)] {
        var testsData = [(nums: [Int], expected: Int)]()
        
        testsData.append((nums: [0, 1], expected: 2))
        testsData.append((nums: [0, 1, 0], expected: 2))
        testsData.append((nums: [0, 1, 1, 0, 1, 1, 1, 0], expected: 4))
        testsData.append((nums: [0, 1, 1, 0, 1, 1, 1, 0], expected: 4))
        testsData.append((nums: [1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 0], expected: 4))
        
        return testsData
    }
}
