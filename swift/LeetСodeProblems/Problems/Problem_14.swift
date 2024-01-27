//
//  Problem_14.swift
//  LeetCodeProblems
//
//  Created by Aynur Nasybullin on 14.10.2023.
//

// 14. Longest Common Prefix
// Easy

// Write a function to find the longest common prefix string amongst an array of strings.

// If there is no common prefix, return an empty string "".

 
// Example 1:
// Input: strs = ["flower","flow","flight"]
// Output: "fl"

// Example 2:
// Input: strs = ["dog","racecar","car"]
// Output: ""
// Explanation: There is no common prefix among the input strings.
 

// Constraints:
// 1 <= strs.length <= 200
// 0 <= strs[i].length <= 200
// strs[i] consists of only lowercase English letters.

extension Problems {
    // Approach: Pointer, String, Array
    // Time complexity: O(m * n) => 7 ms
    // Space complexity: O(1) => 14.59 MB
    static func problem_14_longestCommonPrefix(_ strs: [String]) -> String {
        guard var common = strs.min() else { return "" }
        var containsCount = 0
        
        while !common.isEmpty  {
            containsCount = 0
            
            for i in 0..<strs.count {
                if strs[i].hasPrefix(common) {
                    containsCount += 1
                } else { break }
            }
            
            if containsCount == strs.count { break }
            
            common.removeLast()
        }
        
        return containsCount == strs.count ? common : ""
    }
}
