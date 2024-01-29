//
//  Problem_238.swift
//  LeetСodeProblems
//
//  Created by Aynur Nasybullin on 29.01.2024.
//

//  238. Product of Array Except Self
//  Medium
//  Topics: Array, Prefix Sum

//  Given an integer array nums, return an array answer such that answer[i]
//  is equal to the product of all the elements of nums except nums[i].
//
//  The product of any prefix or suffix of nums is guaranteed to fit in a 32-bit integer.
//
//  You must write an algorithm that runs in O(n) time and without using the division operation.

//  Example 1:
//  Input: nums = [1,2,3,4]
//  Output: [24,12,8,6]
//
//  Example 2:
//  Input: nums = [-1,1,0,-3,3]
//  Output: [0,0,9,0,0]
 
//  Constraints:
//  2 <= nums.length <= 10^5
//  -30 <= nums[i] <= 30
//  The product of any prefix or suffix of nums is guaranteed to fit in a 32-bit integer.
 
//  Follow up: Can you solve the problem in O(1) extra space complexity?
//  (The output array does not count as extra space for space complexity analysis.)

extension Problems {
    // Approach: Array, Prefix Sum
    // Time complexity: O() = 161 ms
    // Space complexity: O() = 22.23 MB
    static func problem_238_productExceptSelf(_ nums: [Int]) -> [Int] {
        var result = Array<Int>(repeating: 1, count: nums.count)
        var tmp = 1
        let n = nums.count
        
        for idx in 1..<nums.count {
            tmp = tmp * nums[idx - 1]
            result[idx] = tmp
        }
        
        tmp = 1
        for idx in stride(from: n - 2, to: -1, by: -1) {
            tmp = tmp * nums[idx + 1]
            result[idx] = result[idx] * tmp
        }
        
        return result
    }
}

