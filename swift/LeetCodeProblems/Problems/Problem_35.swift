//
//  Problem_35.swift
//  LeetCodeProblems
//
//  Created by Aynur Nasybullin on 14.01.2024.
//

//  35. Search Insert Position
//  Easy
//  Topics: Array, Binary Search

//  Given a sorted array of distinct integers and a target value, return the index if the target is found.
//  If not, return the index where it would be if it were inserted in order.
//
//  You must write an algorithm with O(log n) runtime complexity.

//  Example 1:
//  Input: nums = [1,3,5,6], target = 5
//  Output: 2
//
//  Example 2:
//  Input: nums = [1,3,5,6], target = 2
//  Output: 1
//
//  Example 3:
//  Input: nums = [1,3,5,6], target = 7
//  Output: 4
 
//  Constraints:
//  1 <= nums.length <= 10^4
//  -10^4 <= nums[i] <= 10^4
//  nums contains distinct values sorted in ascending order.
//  -10^4 <= target <= 10^4

extension Problems {
    // Approach: Array, Binary Search
    // Time complexity: O(log n) => 25 ms
    // Space complexity: O(1) => 15.65 MB
    static func problem_35_searchInsert(_ nums: [Int], _ target: Int) -> Int {
        let n = nums.count
        guard n > 1 else { return target > nums[0] ? 1 : 0 }
        if nums[0] > target { return 0 }
        if nums[n - 1] < target { return n }
        
        var left = 0
        var right = n - 1
        var idx = 0, lastIdx = -1
        
        while left < right {
            idx = left + (right - left) / 2
            
            if idx == lastIdx { break }
            lastIdx = idx
            
            if nums[idx] == target { return idx }
            
            nums[idx] > target ? (right = idx - 1) : (left = idx)
        }
        
        if target > nums[right] { return right + 1 }
        if target < nums[left] { return left }
        
        return right
    }
}
