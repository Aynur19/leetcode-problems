//
//  Problem_15.swift
//  LeetCodeProblems
//
//  Created by Aynur Nasybullin on 15.10.2023.
//

//  15. 3Sum
//  Medium
//  Topics: Array, Two Pointers, Sorting

//  Given an integer array nums, return all the triplets [nums[i], nums[j], nums[k]] such that i != j, i != k,
//  and j != k, and nums[i] + nums[j] + nums[k] == 0.
//
//  Notice that the solution set must not contain duplicate triplets.

//  Example 1:
//  Input: nums = [-1,0,1,2,-1,-4]
//  Output: [[-1,-1,2],[-1,0,1]]
//  Explanation:
//    nums[0] + nums[1] + nums[2] = (-1) + 0 + 1 = 0.
//    nums[1] + nums[2] + nums[4] = 0 + 1 + (-1) = 0.
//    nums[0] + nums[3] + nums[4] = (-1) + 2 + (-1) = 0.
//    The distinct triplets are [-1,0,1] and [-1,-1,2].
//  Notice that the order of the output and the order of the triplets does not matter.
//
//  Example 2:
//  Input: nums = [0,1,1]
//  Output: []
//  Explanation: The only possible triplet does not sum up to 0.
//
//  Example 3:
//  Input: nums = [0,0,0]
//  Output: [[0,0,0]]
//  Explanation: The only possible triplet sums up to 0.
 
//  Constraints:
//  3 <= nums.length <= 3000
//  -10^5 <= nums[i] <= 10^5

extension Problems {
    // MARK: LeetCode Problem 15. 3Sum
    // Link: https://leetcode.com/problems/3sum/
    // Approach: Three Pointers, Sorting
    // Time complexity: O(n^2) => 156 ms
    // Space complexity: O(1) => 18.66 MB
    public func problem_15_threeSum(_ nums: [Int]) -> [[Int]] {
        let nums = nums.sorted()
        
        var result = [[Int]]()
        var idx = 0, left = 0, right = 0
        var last = [1, 1, 1]
        
        while nums[idx] < 0, idx + 2 < nums.count {
            if idx > 0, nums[idx] == nums[idx - 1] {
                idx += 1
                continue
            }
            
            left = idx + 1
            right = nums.count - 1
            
            while left < right {
                let value = nums[idx] + nums[left] + nums[right]
                
                if value == 0 {
                    let new = [nums[idx], nums[left], nums[right]]
                    if last != new {
                        result.append(new)
                        last = new
                    }
                    right -= 1
                    left += 1
                    
                    continue
                } else if value > 0 {
                    right -= 1
                } else {
                    left += 1
                }
            }
            
            idx += 1
        }
        
        if idx < nums.count - 2, nums[idx + 2] == 0 {
            result.append([0, 0, 0])
        }
        
        return result
    }
}


extension ProblemsTestCases {
    static func testsData_15() -> [(nums: [Int], expected:  [[Int]])] {
        var testsData = [(nums: [Int], expected:  [[Int]])]()
        
        testsData.append((nums: [-1, 0, 1, 2, -1, -4], expected: [[-1, -1, 2], [-1, 0, 1]]))
        testsData.append((nums: [0, 1, 1], expected:  []))
        testsData.append((nums: [0, 0, 0], expected:  [[0, 0, 0]]))
        testsData.append((nums: [-1, 0, 1, 0], expected:  [[-1, 0, 1]]))
        testsData.append((nums: [1, -1, -1, 0], expected:  [[-1, 0, 1]]))
        testsData.append((nums: [-2, 0, 1, 1, 2], expected:  [[-2, 0, 2], [-2, 1, 1]]))
        
        return testsData
    }
}
