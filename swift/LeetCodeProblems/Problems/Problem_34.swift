//
//  Problem_34.swift
//  LeetCodeProblems
//
//  Created by Aynur Nasybullin on 13.01.2024.
//

//  34. Find First and Last Position of Element in Sorted Array
//  Medium
//  Topics: Array, Binary Search
//
//  Given an array of integers nums sorted in non-decreasing order, find the starting and ending position of a given target value.
//
//  If target is not found in the array, return [-1, -1].
//
//  You must write an algorithm with O(log n) runtime complexity.

//  Example 1:
//  Input: nums = [5,7,7,8,8,10], target = 8
//  Output: [3,4]
//
//  Example 2:
//  Input: nums = [5,7,7,8,8,10], target = 6
//  Output: [-1,-1]
//
//  Example 3:
//  Input: nums = [], target = 0
//  Output: [-1,-1]
 
//  Constraints:
//  0 <= nums.length <= 10^5
//  -10^9 <= nums[i] <= 10^9
//  nums is a non-decreasing array.
//  -10^9 <= target <= 10^9

extension Problems {
    // Approach: Array, Binary Search
    // Time complexity: O(log n) => 38 ms
    // Space complexity: O(1) => 16.72 MB
    static func problem_34_searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        guard !nums.isEmpty else { return [-1, -1] }
        guard nums.count > 1 else { return nums[0] == target ? [0, 0] : [-1, -1] }
        
        var left = 0
        var right = nums.count - 1
        var idx = -1
    
        while left < right {
            let current = left + (right - left) / 2
            
            if current == idx { break }
            idx = current
            
            if target == nums[current] { break }
            
            target > nums[current] ? (left = current) : (right = current)
        }
        
        if nums[idx] != target {
            if nums[left] == target {
                idx = left
            } else if nums[right] == target {
                idx = right
            } else {
                return [-1, -1]
            }
        }
        
        left = idx
        right = idx
        
        while left >= 0 {
            if nums[left] != target { break }
            left -= 1
        }
        if left < 0 || nums[left] != target { left += 1 }
        
        while right < nums.count {
            if nums[right] != target { break }
            right += 1
        }
        if right >= nums.count || nums[right] != target { right -= 1 }
        
        return [left, right]
    }
}
