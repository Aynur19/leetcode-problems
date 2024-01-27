//
//  Problem_28.swift
//  LeetCodeProblems
//
//  Created by Aynur Nasybullin on 19.10.2023.
//

// 28. Find the Index of the First Occurrence in a String
// Easy
// URL: https://leetcode.com/problems/find-the-index-of-the-first-occurrence-in-a-string/
// Topics: Two Pointers, String, String Matching

// Given two strings needle and haystack, return the index of the first occurrence of needle in haystack, or -1 if needle is not part of haystack.

 
// Example 1:
// Input: haystack = "sadbutsad", needle = "sad"
// Output: 0
// Explanation: "sad" occurs at index 0 and 6.
// The first occurrence is at index 0, so we return 0.

// Example 2:
// Input: haystack = "leetcode", needle = "leeto"
// Output: -1
// Explanation: "leeto" did not occur in "leetcode", so we return -1.
 

// Constraints:
// 1 <= haystack.length, needle.length <= 104
// haystack and needle consist of only lowercase English characters.

extension Problems {
    // Approach: Two Pointers, Array
    // Time complexity: O(n1 * n2) => 4 ms
    // Space complexity: O(n1 + n2) => 13.78 MB
    static func problem_28_strStr(_ haystack: String, _ needle: String) -> Int {
        guard haystack.count >= needle.count else { return -1 }
        guard haystack != needle else { return 0 }
        
        let h = Array(haystack)
        let n = Array(needle)
        let size = h.count - n.count + 1
        var diff = 0
        
        for var i in 0..<size where h[i] == n[0] {
            diff = i
            for j in 1..<n.count where h[i + j] != n[j] {
                i += j
                break
            }
            
            if diff == i { return i }
            i -= 1
        }
        
        return -1
    }
    
    // Approach: Strings
    // Time complexity: O(n1 * n2) => 0 ms
    // Space complexity: O(n) => 14.13 MB
    static func problem_28_strStr2(_ haystack: String, _ needle: String) -> Int {
        guard haystack.count >= needle.count,
              let first = needle.first
        else { return -1 }
        
        var haystack = haystack
        var count = 0
        
        while !haystack.isEmpty {                                               // O(n)
            if let idx = haystack.firstIndex(of: first) {                       // O(n)
                let k = haystack.distance(from: haystack.startIndex, to: idx)   // O(n)
                
                if k > 0 {
                    haystack.removeFirst(k)                                     // O(n)
                    count += k
                }
                
                if haystack.hasPrefix(needle) {                                 // O(n)
                    return count
                } else {
                    haystack.removeFirst()                                      // O(n)
                    count += 1
                }
            } else { break }
        }
        
        return -1
    }
}

