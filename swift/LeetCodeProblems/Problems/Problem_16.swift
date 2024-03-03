//
//  Problem_16.swift
//  LeetCodeProblems
//
//  Created by Aynur Nasybullin on 15.10.2023.
//

// 16. 3Sum Closest
// Medium

// Given an integer array nums of length n and an integer target, find three integers in nums such that the sum is closest to target.

// Return the sum of the three integers.

// You may assume that each input would have exactly one solution.

 
// Example 1:
// Input: nums = [-1,2,1,-4], target = 1
// Output: 2
// Explanation: The sum that is closest to the target is 2. (-1 + 2 + 1 = 2).

// Example 2:
// Input: nums = [0,0,0], target = 1
// Output: 0
// Explanation: The sum that is closest to the target is 0. (0 + 0 + 0 = 0).
 

// Constraints:
// 3 <= nums.length <= 500
// -1000 <= nums[i] <= 1000
// -10^4 <= target <= 10^4

extension Problems {
    // Approach: Three Pointers, Sorting
    // Time complexity: O(n^2) => 35 ms
    // Space complexity: O(1) => 14.14 MB
    static func problem_16_threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
        let nums = nums.sorted()
        
        var minDiff = Int.max
        var result = 0
        
        for i in 0..<nums.count - 2 {
            var l = i + 1
            var r = nums.count - 1
            
            while l < r {
                let sum = nums[i] + nums[l] + nums[r]
                
                if sum == target {
                    return sum
                } else {
                    let newDiff = abs(sum - target)
                    if newDiff < minDiff {
                        minDiff = newDiff
                        result = sum
                    }
                    
                    if sum < target {
                        l += 1
                    } else {
                        r -= 1
                    }
                }
            }
        }
        
        return result
    }
}

