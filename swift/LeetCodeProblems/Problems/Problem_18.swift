//
//  Problem_18.swift
//  LeetCodeProblems
//
//  Created by Aynur Nasybullin on 15.10.2023.
//

// 18. 4Sum
// Medium

// Given an array nums of n integers, return an array of all the unique quadruplets [nums[a], nums[b], nums[c], nums[d]] such that:

//   0 <= a, b, c, d < n
//   a, b, c, and d are distinct.
//   nums[a] + nums[b] + nums[c] + nums[d] == target
// You may return the answer in any order.

 
// Example 1:
// Input: nums = [1,0,-1,0,-2,2], target = 0
// Output: [[-2,-1,1,2],[-2,0,0,2],[-1,0,0,1]]

// Example 2:
// Input: nums = [2,2,2,2,2], target = 8
// Output: [[2,2,2,2]]
 

// Constraints:
// 1 <= nums.length <= 200
// -10^9 <= nums[i] <= 10^9
// -10^9 <= target <= 10^9

extension Problems {
    // Approach: Arrays, Recursion
    // Time complexity: O(n^3} => 30 ms
    // Space complexity: O(1) => 14.08 MB
    static func problem_18_fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
        guard nums.count > 3 else { return [] }
        
        let nums = nums.sorted()
        var subArray = [Int]()
        var result = [[Int]]()
        
        func kSum(_ k: Int, _ start: Int, _ target: Int) {
            if k != 2 {
                for i in start...(nums.count - k) {
                    if i > start, nums[i] == nums[i - 1] { continue }
                    
                    subArray.append(nums[i])
                    kSum(k - 1, i + 1, target - nums[i])
                    _ = subArray.removeLast()
                }
                
                return
            }
            
            var left = start, right = nums.count - 1
            while left < right {
                let sum = nums[left] + nums[right]
                if sum < target {
                    left += 1
                } else if sum > target {
                    right -= 1
                } else {
                    result.append(subArray + [nums[left], nums[right]])
                    
                    left += 1
                    while left < right, nums[left] == nums[left - 1] { left += 1 }
                }
            }
        }
        
        kSum(4, 0, target)
        
        return result
    }
}
