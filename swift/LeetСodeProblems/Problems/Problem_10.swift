//
//  Problem_10.swift
//  LeetCodeProblems
//
//  Created by Aynur Nasybullin on 11.10.2023.
//

// 10. Regular Expression Matching
// Hard

// Given an input string s and a pattern p, implement regular expression matching with support for '.' and '*' where:

//   '.' Matches any single character.
//   '*' Matches zero or more of the preceding element.

// The matching should cover the entire input string (not partial).

 
// Example 1:
// Input: s = "aa", p = "a"
// Output: false
// Explanation: "a" does not match the entire string "aa".

// Example 2:
// Input: s = "aa", p = "a*"
// Output: true
// Explanation: '*' means zero or more of the preceding element, 'a'. Therefore, by repeating 'a' once, it becomes "aa".

// Example 3:
// Input: s = "ab", p = ".*"
// Output: true
// Explanation: ".*" means "zero or more (*) of any character (.)".
 

// Constraints:
// 1 <= s.length <= 20
// 1 <= p.length <= 20
// s contains only lowercase English letters.
// p contains only lowercase English letters, '.', and '*'.
// It is guaranteed for each appearance of the character '*', there will be a previous valid character to match.

extension Problems {
    // Approach: Two Pointers, Recursion, Dynamic programming, Memoization
    // Time complexity: O(n + m) => 7 ms
    // Space complexity: O(1) => 14.09
    static func problem_10_cleanPattern(_ s: String, _ p: String) -> Bool {
        var cache = [String:Bool]()
        
        let s = Array(s)
        let p = Array(p)
        
        // solution tree
        func isMatch(_ ptrS: Int, _ ptrP: Int) -> Bool {
            let key = "\(ptrS);\(ptrP)"
            if let result = cache[key] { return result }
            
            if ptrS >= s.count, ptrP >= p.count { return true }
            if ptrP >= p.count { return false }
            
            var match = ptrS < s.count && (s[ptrS] == p[ptrP] || p[ptrP] == ".")
            
            if ptrP + 1 < p.count, p[ptrP + 1] == "*" {
                match = isMatch(ptrS, ptrP + 2) || (match && isMatch(ptrS + 1, ptrP))
                cache[key] = match
                return match
            }
            
            if match {
                match = isMatch(ptrS + 1, ptrP + 1)
                cache[key] = match
                return match
            }
            
            cache[key] = false
            return false
        }
        
        return isMatch(0, 0)
    }
}
