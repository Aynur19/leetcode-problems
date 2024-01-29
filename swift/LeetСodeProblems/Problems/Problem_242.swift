//
//  Problem_242.swift
//  LeetСodeProblems
//
//  Created by Aynur Nasybullin on 29.01.2024.
//

//  242. Valid Anagram
//  Easy
//  Topics: Hash Table, String, Sorting

//  Given two strings s and t, return true if t is an anagram of s, and false otherwise.
//
//  An Anagram is a word or phrase formed by rearranging the letters of a different word or phrase,
//  typically using all the original letters exactly once.

//  Example 1:
//  Input: s = "anagram", t = "nagaram"
//  Output: true
//
//  Example 2:
//  Input: s = "rat", t = "car"
//  Output: false
 
//  Constraints:
//  1 <= s.length, t.length <= 5 * 10^4
//  s and t consist of lowercase English letters.
 
//  Follow up: What if the inputs contain Unicode characters? How would you adapt your solution to such a case?

extension Problems {
    // Approach: Hash Table
    // Time complexity: O(n) = 21 ms
    // Space complexity: O(1) = 16.16 MB (alphabet set)
    static func problem_242_isAnagram(_ s: String, _ t: String) -> Bool {
        var dict = [Character:Int]()
        
        s.forEach { char in
            dict[char, default: 0] += 1
        }
        
        for char in t {
            if let count = dict[char] {
                if count == 1 {
                    dict[char] = nil
                } else {
                    dict[char] = count - 1
                }
            } else {
                return false
            }
        }
        
        return dict.isEmpty
    }
}
