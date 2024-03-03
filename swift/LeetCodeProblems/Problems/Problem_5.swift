//
//  Problem_5.swift
//  LeetCodeProblems
//
//  Created by Aynur Nasybullin on 10.10.2023.
//

// 5. Longest Palindromic Substring
// Medium

// Given a string s, return the longest palindromic substring in s.

// Example 1:
// Input: s = "babad"
// Output: "bab"
// Explanation: "aba" is also a valid answer.

// Example 2:
// Input: s = "cbbd"
// Output: "bb"
 
// Constraints:
// 1 <= s.length <= 1000
// s consist of only digits and English letters.

extension Problems {
    // Approach: Array, Two Pointer
    // Time complexity: O(n^2) => 93 ms
    // Space complexity: O(n) => 14.36 MB
    static func problem_5_longestPalindrome(_ s: String) -> String {
        func check(_ s: [Character], _ left: Int, _ right: Int) -> Bool {
            var left = left
            var right = right
            
            while left < right {
                if s[left] != s[right] { return false }
                
                left += 1
                right -= 1
            }
            
            return true
        }
        
        let s = Array(s)
        var maxSize = s.count
        var left = 0
        var right = maxSize - 1
        
        while left < right {
            if check(s, left, right) {
                return String(s[left...right])
            }
            
            left += 1
            right += 1
            
            if right >= s.count {
                maxSize -= 1
                left = 0
                right = maxSize - 1
            }
        }
        
        return String(s[0])
    }
}

