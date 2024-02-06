//
//  Problem_560.swift
//  LeetСodeProblems
//
//  Created by Aynur Nasybullin on 06.02.2024.
//

//  560. Subarray Sum Equals K
//  Medium
//  Topics

//  Given an array of integers nums and an integer k, return the total number of subarrays whose sum equals to k.
//
//  A subarray is a contiguous non-empty sequence of elements within an array.

//  Example 1:
//  Input: nums = [1,1,1], k = 2
//  Output: 2
//
//  Example 2:
//  Input: nums = [1,2,3], k = 3
//  Output: 2
 
//  Constraints:
//  1 <= nums.length <= 2 * 10^4
//  -1000 <= nums[i] <= 1000
//  -10^7 <= k <= 10^7

// help: https://www.youtube.com/watch?v=UWPKvrproqQ&ab_channel=3.5%D0%B7%D0%B0%D0%B4%D0%B0%D1%87%D0%B8%D0%B2%D0%BD%D0%B5%D0%B4%D0%B5%D0%BB%D1%8E
extension Problems {
    // Approach: Hash Table, Prefix Sum
    // Time complexity: O(n) =  ms
    // Space complexity: O(n) =  MB
    static func problem_560_subarraySum(_ nums: [Int], _ k: Int) -> Int {
        let n = nums.count
        if n == 1 { return nums[0] == k ? 1 : 0 }
        
        var sum = 0
        var count = 0
        var dict = [sum:1]
        
        for num in nums {
            sum += num
            if let countPrefixSum = dict[sum - k] {
                count += countPrefixSum
            }
            
            dict[sum, default: 0] += 1
        }
        
        return count
    }
}
