//
//  Problem_974.swift
//  LeetСodeProblems
//
//  Created by Aynur Nasybullin on 15.02.2024.
//

//  974. Subarray Sums Divisible by K
//  Medium
//  Topics: Array, Hash Table, Prefix Sum

//  Given an integer array nums and an integer k, return the number of non-empty subarrays that have a sum divisible by k.
//
//  A subarray is a contiguous part of an array.

//  Example 1:
//  Input: nums = [4,5,0,-2,-3,1], k = 5
//  Output: 7
//  Explanation: There are 7 subarrays with a sum divisible by k = 5:
//      [4, 5, 0, -2, -3, 1], [5], [5, 0], [5, 0, -2, -3], [0], [0, -2, -3], [-2, -3]
//
//  Example 2:
//  Input: nums = [5], k = 9
//  Output: 0
 
//  Constraints:
//  1 <= nums.length <= 3 * 10^4
//  -10^4 <= nums[i] <= 10^4
//  2 <= k <= 10^4

extension Problems {
    // Approach: Prefix Sum, Hash Table, Counting
    // Time complexity: O(n) = 110 ms
    // Space complexity: O(k) = 16.78 MB
    static func problems_974_subarraysDivByK(_ nums: [Int], _ k: Int) -> Int {
        var remaindersSum = 0
        var dict = [Int:Int]()
        
        for num in nums {
            remaindersSum += num
            remaindersSum %= k
            
            if remaindersSum < 0 {
                remaindersSum += k
            }

            dict[remaindersSum, default: 0] += 1
        }
        
        var result = 0
        for (_, value) in dict {
            result += value * (value - 1) / 2
        }
        
        if let count = dict[0] {
            result += count
        }
        
        return result
    }
}
