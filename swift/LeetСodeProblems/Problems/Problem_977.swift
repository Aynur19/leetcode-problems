//
//  Problem_977.swift
//  LeetСodeProblems
//
//  Created by Aynur Nasybullin on 15.02.2024.
//

//  977. Squares of a Sorted Array
//  Easy
//  Topics: Array, Two Pointers, Sorting

//  Given an integer array nums sorted in non-decreasing order,
//  return an array of the squares of each number sorted in non-decreasing order.

//  Example 1:
//  Input: nums = [-4,-1,0,3,10]
//  Output: [0,1,9,16,100]
//  Explanation: After squaring, the array becomes [16,1,0,9,100].
//  After sorting, it becomes [0,1,9,16,100].
//
//  Example 2:
//  Input: nums = [-7,-3,2,3,11]
//  Output: [4,9,9,49,121]
 
//  Constraints:
//  1 <= nums.length <= 10^4
//  -10^4 <= nums[i] <= 10^4
//  nums is sorted in non-decreasing order.
 
//  Follow up: Squaring each element and sorting the new array is very trivial,
//  could you find an O(n) solution using a different approach?

extension Problems {
    // Approach: Two Pointers
    // Time complexity: O(n) = 104 ms
    // Space complexity: O(1) = 17.28 MB
    static func problem_977_sortedSquares(_ nums: [Int]) -> [Int] {
        guard nums.count > 1 else { return [nums[0] * nums[0]] }
        
        var squares = Array(repeating: 0, count: nums.count)
        var left = 0
        var right = nums.count - 1
        var idx = right
        
        while left <= right {
            if abs(nums[left]) > abs(nums[right]) {
                squares[idx] = nums[left] * nums[left]
                left += 1
            } else {
                squares[idx] = nums[right] * nums[right]
                right -= 1
            }
            
            idx -= 1
        }
        
        return squares
    }
}
