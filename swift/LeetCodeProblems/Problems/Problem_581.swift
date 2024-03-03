//
//  Problem_681.swift
//  LeetСodeProblems
//
//  Created by Aynur Nasybullin on 07.02.2024.
//

//  581. Shortest Unsorted Continuous Subarray
//  Medium
//  Topics: Array, Two Pointers, Stack, Greedy, Sorting, Monotonic Stack

//  Given an integer array nums, you need to find one continuous subarray such that
//  if you only sort this subarray in non-decreasing order, then the whole array will be sorted in non-decreasing order.
//
//  Return the shortest such subarray and output its length.

//  Example 1:
//  Input: nums = [2,6,4,8,10,9,15]
//  Output: 5
//  Explanation: You need to sort [6, 4, 8, 10, 9] in ascending order to make the whole array sorted in ascending order.
//
//  Example 2:
//  Input: nums = [1,2,3,4]
//  Output: 0
//  
//  Example 3:
//  Input: nums = [1]
//  Output: 0
 
//  Constraints:
//  1 <= nums.length <= 10^4
//  -10^5 <= nums[i] <= 10^5
 
//  Follow up: Can you solve it in O(n) time complexity?

extension Problems {
    // Approach: Two Pointers, Min, Max
    // Time complexity: O(n) = 57 ms
    // Space complexity: O(1) = 15.56 MB
    static func problem_581_findUnsortedSubarray(_ nums: [Int]) -> Int {
        let n = nums.count
        guard n > 1 else { return 0 }
        
        var minNam = Int.max
        var maxMax = nums[0]
        var subarrayMax = nums[0]
        var right = 0
        
        for idx in 1..<nums.count {
            if nums[idx] < nums[idx - 1] {
                minNam = min(minNam, nums[idx])
                
                right = idx
                subarrayMax = max(subarrayMax, maxMax)
            } else {
                maxMax = max(maxMax, nums[idx])
                if nums[idx] < subarrayMax {
                    right = idx
                }
            }
        }
        
        if right == 0 { return 0 }
        for left in nums.indices {
            if nums[left] > minNam {
                return right + 1 - left
            }
        }
        
        return 0
    }
    
    // Approach: Min, Max
    // Time complexity: O(n) = 57 ms
    // Space complexity: O(1) = 15.82 MB
    static func problem_581_findUnsortedSubarray2(_ nums: [Int]) -> Int {
        let n = nums.count
        guard n > 1 else { return 0 }
        
        var right = 0
        var maxNum = nums[right]
        for idx in 1..<nums.count {
            maxNum = max(maxNum, nums[idx - 1])
            if maxNum > nums[idx] {
                right = idx
            }
        }
        
        if right == 0 { return 0 }
        
        var left = nums.count - 1
        var minNum = nums[left]
        for idx in stride(from: nums.count - 2, to: -1, by: -1) {
            minNum = min(minNum, nums[idx + 1])
            if minNum < nums[idx] {
                left = idx
            }
        }
        
        return right - left + 1
    }
}
