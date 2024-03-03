//
//  Problem_1004.swift
//  LeetСodeProblems
//
//  Created by Aynur Nasybullin on 15.02.2024.
//

//  1004. Max Consecutive Ones III
//  Medium
//  Topics

//  Given a binary array nums and an integer k, return the maximum number of consecutive 1's in the array if you can flip at most k 0's.

//  Example 1:
//  Input: nums = [1,1,1,0,0,0,1,1,1,1,0], k = 2
//  Output: 6
//  Explanation: [1,1,1,0,0,1,1,1,1,1,1]
//  Bolded numbers were flipped from 0 to 1. The longest subarray is underlined.
//
//  Example 2:
//  Input: nums = [0,0,1,1,0,0,1,1,1,0,1,1,0,0,0,1,1,1,1], k = 3
//  Output: 10
//  Explanation: [0,0,1,1,1,1,1,1,1,1,1,1,0,0,0,1,1,1,1]
//  Bolded numbers were flipped from 0 to 1. The longest subarray is underlined.
 
//  Constraints:
//  1 <= nums.length <= 10^5
//  nums[i] is either 0 or 1.
//  0 <= k <= nums.length

extension Problems {
    // Approach: Two Pointers
    // Time complexity: O(n) = 104 ms
    // Space complexity: O(1) = 15.84 MB
    static func problem_1004_longestOnes(_ nums: [Int], _ k: Int) -> Int {
        let n = nums.count
        guard n > 1 else { return nums[0] == 1 || k > 0 ? 1 : 0 }
        
        var maxSize = 0
        var flips = k
        var left = -1
        var right = 0
            
        while right < n {
            if nums[right] == 0 {
                if flips > 0 {
                    flips -= 1
                } else {
                    while left < n - 1 {
                        left += 1
                        if nums[left] == 0 { break }
                    }
                }
            }
            
            maxSize = max(maxSize, right - left)
            right += 1
        }
        
        return maxSize
    }
}
