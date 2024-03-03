//
//  Problem_205.swift
//  LeetСodeProblems
//
//  Created by Aynur Nasybullin on 28.01.2024.
//

//  205. Isomorphic Strings
//  Easy
//  Topics: Hash Table, String

//  Given two strings s and t, determine if they are isomorphic.
//
//  Two strings s and t are isomorphic if the characters in s can be replaced to get t.
//
//  All occurrences of a character must be replaced with another character
//  while preserving the order of characters. No two characters may map to the same character,
//  but a character may map to itself.

//  Example 1:
//  Input: s = "egg", t = "add"
//  Output: true
//
//  Example 2:
//  Input: s = "foo", t = "bar"
//  Output: false
//
//  Example 3:
//  Input: s = "paper", t = "title"
//  Output: true
 
//  Constraints:
//  1 <= s.length <= 5 * 10^4
//  t.length == s.length
//  s and t consist of any valid ascii character.

extension Problems {
    // Approach: Hash Table
    // Time complexity: O(n) = 7 ms
    // Space complexity: O(1) = 16.33 MB
    static func problem_205_isIsomorphic(_ s: String, _ t: String) -> Bool {
        guard s.count > 1 else { return true }
        
        let s = Array(s)
        let t = Array(t)
        var dictST = [Character:Character]()
        var dictTS = [Character:Character]()
        
        for idx in s.indices {
            if let charT = dictST[s[idx]] {
                if charT != t[idx] { return false }
            } else {
                dictST[s[idx]] = t[idx]
            }
            
            if let charS = dictTS[t[idx]] {
                if charS != s[idx] { return false }
            } else {
                dictTS[t[idx]] = s[idx]
            }
        }
        
        return true
    }
}
