//
//  Problem_392.swift
//  LeetСodeProblems
//
//  Created by Aynur Nasybullin on 31.01.2024.
//

//  392. Is Subsequence
//  Easy
//  Topics: Two Pointers, String, Dynamic Programming

//  Given two strings s and t, return true if s is a subsequence of t, or false otherwise.
//
//  A subsequence of a string is a new string that is formed from the original string by deleting some (can be none)
//  of the characters without disturbing the relative positions of the remaining characters.
//  (i.e., "ace" is a subsequence of "abcde" while "aec" is not).

//  Example 1:
//  Input: s = "abc", t = "ahbgdc"
//  Output: true
//
//  Example 2:
//  Input: s = "axc", t = "ahbgdc"
//  Output: false
 
//  Constraints:
//  0 <= s.length <= 100
//  0 <= t.length <= 10^4
//  s and t consist only of lowercase English letters.
 
//  Follow up: Suppose there are lots of incoming s, say s1, s2, ..., sk where k >= 10^9,
//  and you want to check one by one to see if t has its subsequence. In this scenario, how would you change your code?

//  help: https://www.youtube.com/watch?v=J8ii90nFNKQ

extension Problems {
    // Approach: String Iteration, Two Pointers
    // Time complexity: O(n + m) = 0 ms
    // Space complexity: O(1) = 15.52 MB
    static func problem_392_isSubsequence(_ s: String, _ t: String) -> Bool {
        guard !s.isEmpty else { return true }
        guard s.count <= t.count else { return false }
        
        var iterT = t.makeIterator()
        var isMatched = false
        
        for charS in s {
            isMatched = false
            while true {
                if let charT = iterT.next() {
                    if charT == charS {
                        isMatched = true
                        break
                    }
                } else {
                    return false
                }
            }
        }
        
        return isMatched
    }
}
