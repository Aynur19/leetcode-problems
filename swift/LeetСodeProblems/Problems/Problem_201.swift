//
//  Problem_201.swift
//  LeetСodeProblems
//
//  Created by Aynur Nasybullin on 21.02.2024.
//

//  201. Bitwise AND of Numbers Range
//  Medium
//  Topics: Bit Manipulation

//  Given two integers left and right that represent the range [left, right],
//  return the bitwise AND of all numbers in this range, inclusive.

//  Example 1:
//  Input: left = 5, right = 7
//  Output: 4
//
//  Example 2:
//  Input: left = 0, right = 0
//  Output: 0
//
//  Example 3:
//  Input: left = 1, right = 2147483647
//  Output: 0
 
//  Constraints:
//  0 <= left <= right <= 2^31 - 1

// help: https://www.youtube.com/watch?v=R3T0olAhUq0&t=868s&pp=ygUMbGVldGNvZGUgMjAx
extension Problems {
    // Approach: AND, Bit Manipulation
    // Time complexity: O(log n) = 17 ms
    // Space complexity: O(1) = 15.23 MB
    static func problem_201_rangeBitwiseAnd(_ left: Int, _ right: Int) -> Int {
        var idx = 0
        var left = left
        var right = right
        
        while left != right {
            left = left >> 1
            right = right >> 1
            idx += 1
        }
        
        return left << idx
    }
}
