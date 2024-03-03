//
//  Problem_53.swift
//  LeetCodeProblems
//
//  Created by Aynur Nasybullin on 16.01.2024.
//

//  53. Maximum Subarray
//  Medium
//  Topics

//  Given an integer array nums, find the subarray with the largest sum, and return its sum.

//  Example 1:
//  Input: nums = [-2,1,-3,4,-1,2,1,-5,4]
//  Output: 6
//  Explanation: The subarray [4,-1,2,1] has the largest sum 6.
//
//  Example 2:
//  Input: nums = [1]
//  Output: 1
//  Explanation: The subarray [1] has the largest sum 1.
//
//  Example 3:
//  Input: nums = [5,4,-1,7,8]
//  Output: 23
//  Explanation: The subarray [5,4,-1,7,8] has the largest sum 23.
 
//  Constraints:
//  1 <= nums.length <= 10^5
//  -10^4 <= nums[i] <= 10^4
 
//  Follow up: If you have figured out the O(n) solution,
//  try coding another solution using the divide and conquer approach, which is more subtle.


// help: https://www.youtube.com/watch?v=JGoQK5MUbIY&ab_channel=3.5%D0%B7%D0%B0%D0%B4%D0%B0%D1%87%D0%B8%D0%B2%D0%BD%D0%B5%D0%B4%D0%B5%D0%BB%D1%8E
extension Problems {
    // Approach: Kadane's algorithm
    // Time complexity: O(N) = 796 ms
    // Space complexity: O(1) = 19.84 MB
    static func problem_53_maxSubArray(_ nums: [Int]) -> Int {
        var sum = nums[0]
        var result = nums[0]
        
        for i in 1..<nums.count {
            sum = max(sum + nums[i], nums[i])
            result = max(result, sum)
        }
        
        return result
    }
    
    // Approach: Recursion, Divide & Conquer
    // Time complexity: O(n) => 814 ms
    // Space complexity: O(log n) => 19.92 MB
    static func problem_53_maxSubArray2(_ nums: [Int]) -> Int {
        func maxSubarray(_ nums: inout [Int], _ first: Int, _ after: Int)
        -> (maxSubarray: Int, maxPrefixSum: Int, maxSuffixSum: Int, sum: Int) {
            
            if first + 1 == after {
                return (nums[first], nums[first], nums[first], nums[first])
            }
            
            let size = after - first
            let half1 = maxSubarray(&nums, first, first + size / 2)
            let half2 = maxSubarray(&nums, first + size / 2, after)
            
            return (
                maxSubarray: [
                    half1.maxSubarray, half2.maxSubarray, half1.maxSuffixSum + half2.maxPrefixSum
                ].max() ?? 0,
                maxPrefixSum: max(half1.maxPrefixSum, half1.sum + half2.maxPrefixSum),
                maxSuffixSum: max(half2.maxSuffixSum, half2.sum + half1.maxSuffixSum),
                sum: half1.sum + half2.sum
            )
        }
        
        var nums = nums
        return maxSubarray(&nums, 0, nums.count).maxSubarray
    }
}
