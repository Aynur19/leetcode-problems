//
//  Problem_11.swift
//  LeetCodeProblems
//
//  Created by Aynur Nasybullin on 13.10.2023.
//

//  11. Container With Most Water
//  Medium
//  Topics: Array, Two Pointers, Greedy

//  You are given an integer array height of length n. There are n vertical lines drawn such that the two endpoints of
//  the ith line are (i, 0) and (i, height[i]).
//
//  Find two lines that together with the x-axis form a container, such that the container contains the most water.
//
//  Return the maximum amount of water a container can store.
//
//  Notice that you may not slant the container.

//  Example 1:
//  Input: height = [1,8,6,2,5,4,8,3,7]
//  Output: 49
//  Explanation: The above vertical lines are represented by array [1,8,6,2,5,4,8,3,7].
//  In this case, the max area of water (blue section) the container can contain is 49.
//
//  Example 2:
//  Input: height = [1,1]
//  Output: 1
 
//  Constraints:
//  n == height.length
//  2 <= n <= 10^5
//  0 <= height[i] <= 10^4

extension Problems {
    // MARK: LeetCode Problem 11. Container With Most Water
    // Link: https://leetcode.com/problems/container-with-most-water/
    // Approach: Two Pointer, Array
    // Time complexity: O(n) => 544 ms
    // Space complexity: O(1) => 17.9 MB
    public func problem_11_maxArea(_ height: [Int]) -> Int {
        var left = 0
        var right = height.count - 1
        var maxArea = 0
        
        while left < right {
            let h = min(height[left], height[right])
            maxArea = max(maxArea, h * (right - left))
            
            if height[left] > h {
                right -= 1
            } else {
                left += 1
            }
        }
        
        return maxArea
    }
}


extension ProblemsTestCases {
    static func testsData_11() -> [(height: [Int], expected: Int)] {
        var testsData = [(height: [Int], expected: Int)]()
        
        testsData.append((height: [1, 8, 6, 2, 5, 4, 8, 3, 7], expected: 49))
        testsData.append((height: [1, 1], expected: 1))
        
        return testsData
    }
}
