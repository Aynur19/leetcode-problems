//
//  Problem_153.swift
//  LeetCodeProblems
//
//  Created by Aynur Nasybullin on 25.01.2024.
//

//  153. Find Minimum in Rotated Sorted Array
//  Medium
//  Topics Array, Binary Search

//  Suppose an array of length n sorted in ascending order is rotated between 1 and n times.
//  For example, the array nums = [0,1,2,4,5,6,7] might become:
//  - [4,5,6,7,0,1,2] if it was rotated 4 times.
//  - [0,1,2,4,5,6,7] if it was rotated 7 times.
//
//  Notice that rotating an array [a[0], a[1], a[2], ..., a[n-1]] 
//  1 time results in the array [a[n-1], a[0], a[1], a[2], ..., a[n-2]].
//
//  Given the sorted rotated array nums of unique elements, return the minimum element of this array.
//
//  You must write an algorithm that runs in O(log n) time.

//  Example 1:
//  Input: nums = [3,4,5,1,2]
//  Output: 1
//  Explanation: The original array was [1,2,3,4,5] rotated 3 times.
//
//  Example 2:
//  Input: nums = [4,5,6,7,0,1,2]
//  Output: 0
//  Explanation: The original array was [0,1,2,4,5,6,7] and it was rotated 4 times.
//
//  Example 3:
//  Input: nums = [11,13,15,17]
//  Output: 11
//  Explanation: The original array was [11,13,15,17] and it was rotated 4 times.
 
//  Constraints:
//  n == nums.length
//  1 <= n <= 5000
//  -5000 <= nums[i] <= 5000
//  All the integers of nums are unique.
//  nums is sorted and rotated between 1 and n times.
                    
extension Problems {
    // Approach: Binary Search
    // Time complexity: O(log (n)) = 17 ms
    // Space complexity: O(1) = 15.60 MB
    static func problem_153_findMin(_ nums: [Int]) -> Int {
        let n = nums.count
        guard n != 1 else { return nums[0] }
        guard n > 2 else { return min(nums[0], nums[1]) }
        guard nums[n - 1] < nums[0] else { return nums[0] }
        
        var left = 0
        var right = n - 1
        var idx = n / 2 - (1 - n % 2)
        
        while right - left > 1 {
            if nums[idx] > nums[left], nums[left] >= nums[0] {
                left = idx + 1
            } else {
                right = idx
            }
            
            idx = (left + right) / 2
        }
        
        return min(nums[left], nums[right])
    }
}
