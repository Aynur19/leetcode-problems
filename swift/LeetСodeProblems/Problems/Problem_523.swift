//
//  Problem_523.swift
//  LeetСodeProblems
//
//  Created by Aynur Nasybullin on 06.02.2024.
//

//  523. Continuous Subarray Sum
//  Medium
//  Topics

//  Given an integer array nums and an integer k, return true if nums has a good subarray or false otherwise.
//
//  A good subarray is a subarray where:
//  - its length is at least two, and
//  - the sum of the elements of the subarray is a multiple of k.
//
//  Note that:
//  - A subarray is a contiguous part of the array.
//  - An integer x is a multiple of k if there exists an integer n such that x = n * k. 0 is always a multiple of k.
 
//  Example 1:
//  Input: nums = [23,2,4,6,7], k = 6
//  Output: true
//  Explanation: [2, 4] is a continuous subarray of size 2 whose elements sum up to 6.
//
//  Example 2:
//  Input: nums = [23,2,6,4,7], k = 6
//  Output: true
//  Explanation: [23, 2, 6, 4, 7] is an continuous subarray of size 5 whose elements sum up to 42.
//      42 is a multiple of 6 because 42 = 7 * 6 and 7 is an integer.
//
//  Example 3:
//  Input: nums = [23,2,6,4,7], k = 13
//  Output: false
 
//  Constraints:
//  1 <= nums.length <= 10^5
//  0 <= nums[i] <= 10^9
//  0 <= sum(nums[i]) <= 2^31 - 1
//  1 <= k <= 2^31 - 1

extension Problems {
    // Approach: Prefix Sum, Two Pointer
    // Time complexity: O((n^2) / 2) = TL Error
    // Space complexity: O(n) = ? MB
    static func problem_523_checkSubarraySum(_ nums: [Int], _ k: Int) -> Bool {
        let n = nums.count
        var sum = 0
        var left = 0
        var right = 0
        
        while left < n - 1 {
            right = left + 1
            sum = nums[left]
            
            while right < n {
                sum += nums[right]
                right += 1
                
                if sum % k == 0 { return true }
            }
            left += 1
        }
        
        return false
    }
    
    // help: https://www.youtube.com/watch?v=q7tOK0JsHWo&ab_channel=3.5%D0%B7%D0%B0%D0%B4%D0%B0%D1%87%D0%B8%D0%B2%D0%BD%D0%B5%D0%B4%D0%B5%D0%BB%D1%8E
    // Approach: Set
    // Time complexity: O(n) = 433 ms
    // Space complexity: O(n) = 2141 MB
    static func problem_523_checkSubarraySum2(_ nums: [Int], _ k: Int) -> Bool {
        var set = Set<Int>()
        var sum = 0
        
        for num in nums {
            let prevSum = sum
            sum += num
            sum %= k
            
            if set.contains(sum) { return true }
            set.insert(prevSum)
        }
        
        return false
    }
    
    // help: https://www.youtube.com/watch?v=q7tOK0JsHWo&ab_channel=3.5%D0%B7%D0%B0%D0%B4%D0%B0%D1%87%D0%B8%D0%B2%D0%BD%D0%B5%D0%B4%D0%B5%D0%BB%D1%8E
    // Approach: Hash Table
    // Time complexity: O(n) = 458 ms
    // Space complexity: O(n) = 24.51 MB
    static func problem_523_checkSubarraySum3(_ nums: [Int], _ k: Int) -> Bool {
        var dict = [Int:Int]()
        var sum = 0
        
        for idx in nums.indices {
            sum += nums[idx]
            sum %= k
            
            if sum == 0, idx > 0 { return true }
            
            if let pos = dict[sum] {
                if idx - pos > 1 { return true }
            } else {
                dict[sum] = idx
            }
        }
        
        return false
    }
}
