//
//  Problem_136.swift
//  LeetCodeProblems
//
//  Created by Aynur Nasybullin on 18.01.2024.
//

//  136. Single Number
//  Easy
//  Topics: Array, Bit Manipulation

//  Given a non-empty array of integers nums, every element appears twice except for one. Find that single one.
//
//  You must implement a solution with a linear runtime complexity and use only constant extra space.

//  Example 1:
//  Input: nums = [2,2,1]
//  Output: 1
//
//  Example 2:
//  Input: nums = [4,1,2,1,2]
//  Output: 4
//
//  Example 3:
//  Input: nums = [1]
//  Output: 1
 
//  Constraints:
//  1 <= nums.length <= 3 * 10^4
//  -3 * 10^4 <= nums[i] <= 3 * 10^4
//  Each element in the array appears twice except for one element which appears only once.

//  help: https://www.youtube.com/watch?v=ZCmUnoLmL-0&ab_channel=3.5%D0%B7%D0%B0%D0%B4%D0%B0%D1%87%D0%B8%D0%B2%D0%BD%D0%B5%D0%B4%D0%B5%D0%BB%D1%8E
extension Problems {
    // Approach: XOR
    // Time complexity: O(n) = 115 ms
    // Space complexity: O(1) = 16.18 MB
    static func problem_136_singleNumber(_ nums: [Int]) -> Int {
        var result = 0
        nums.forEach { result ^= $0 }
        
        return result
    }
}

