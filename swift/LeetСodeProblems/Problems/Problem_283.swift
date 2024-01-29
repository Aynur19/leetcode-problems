//
//  Problem_283.swift
//  LeetСodeProblems
//
//  Created by Aynur Nasybullin on 29.01.2024.
//

//  283. Move Zeroes
//  Easy
//  Topics

//  Given an integer array nums, move all 0's to the end of it while maintaining the relative order of the non-zero elements.
//
//  Note that you must do this in-place without making a copy of the array.

//  Example 1:
//  Input: nums = [0,1,0,3,12]
//  Output: [1,3,12,0,0]
//
//  Example 2:
//  Input: nums = [0]
//  Output: [0]
 
//  Constraints:
//  1 <= nums.length <= 10^4
//  -2^31 <= nums[i] <= 2^31 - 1
 
//  Follow up: Could you minimize the total number of operations done?

extension Problems {
    // Approach: Two Pointers
    // Time complexity: O(n) = 168 ms
    // Space complexity: O(1) = 16.86 MB
    static func problem_283_moveZeroes(_ nums: inout [Int]) {
        guard nums.count > 1 else { return }
        guard var left = nums.firstIndex(of: 0) else { return }
        var right = left + 1
        
        while right < nums.count {
            if nums[right] != 0 {
                nums.swapAt(right, left)
                left += 1
            }
            
            right += 1
        }
    }
}
