//
//  Problem_1768.swift
//  LeetСodeProblems
//
//  Created by Aynur Nasybullin on 02.03.2024.
//

//  1768. Merge Strings Alternately
//  Easy
//  Topics: Two Pointers, String

//  You are given two strings word1 and word2. Merge the strings by adding letters in alternating order, starting with word1.
//  If a string is longer than the other, append the additional letters onto the end of the merged string.
//
//  Return the merged string.

//  Example 1:
//  Input: word1 = "abc", word2 = "pqr"
//  Output: "apbqcr"
//  Explanation: The merged string will be merged as so:
//      word1:  a   b   c
//      word2:    p   q   r
//      merged: a p b q c r
//
//  Example 2:
//  Input: word1 = "ab", word2 = "pqrs"
//  Output: "apbqrs"
//  Explanation: Notice that as word2 is longer, "rs" is appended to the end.
//      word1:  a   b
//      word2:    p   q   r   s
//      merged: a p b q   r   s
//
//  Example 3:
//  Input: word1 = "abcd", word2 = "pq"
//  Output: "apbqcd"
//  Explanation: Notice that as word1 is longer, "cd" is appended to the end.
//      word1:  a   b   c   d
//      word2:    p   q
//      merged: a p b q c   d
 
//  Constraints:
//  1 <= word1.length, word2.length <= 100
//  word1 and word2 consist of lowercase English letters.

extension Problems {
    // Approach: Two Pointers
    // Time complexity: O(n) = 6 ms
    // Space complexity: O(n) = 15.60 MB
    static func problem_1768_mergeAlternately(_ word1: String, _ word2: String) -> String {
        var chars = [Character]()
        var iter2 = word2.makeIterator()
        
        for char in word1 {
            chars.append(char)
            
            if let char2 = iter2.next() {
                chars.append(char2)
            }
        }
        
        while true {
            if let char2 = iter2.next() {
                chars.append(char2)
            } else { break }
        }
        
        return .init(chars)
    }
}
