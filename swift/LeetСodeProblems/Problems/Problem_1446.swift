//
//  Problem_1446.swift
//  LeetСodeProblems
//
//  Created by Aynur Nasybullin on 17.02.2024.
//

//  1446. Consecutive Characters
//  Easy
//  Topics

//  The power of the string is the maximum length of a non-empty substring that contains only one unique character.
//
//  Given a string s, return the power of s.

//  Example 1:
//  Input: s = "leetcode"
//  Output: 2
//  Explanation: The substring "ee" is of length 2 with the character 'e' only.
//
//  Example 2:
//  Input: s = "abbcccddddeeeeedcba"
//  Output: 5
//  Explanation: The substring "eeeee" is of length 5 with the character 'e' only.
 
//  Constraints:
//  1 <= s.length <= 500
//  s consists of only lowercase English letters.

extension Problems {
    static func problem_1446_maxPower(_ s: String) -> Int {
        guard var current = s.first else { return 0 }
        var maxPower = 0
        var count = 0
        
        for char in s {
            if char != current {
                maxPower = max(maxPower, count)
                current = char
                count = 0
            }
            
            count += 1
        }
        
        return maxPower
    }
}
