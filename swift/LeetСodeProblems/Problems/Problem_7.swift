//
//  Problem_7.swift
//  LeetCodeProblems
//
//  Created by Aynur Nasybullin on 10.10.2023.
//

// 7. Reverse Integer
// Medium

// Given a signed 32-bit integer x, return x with its digits reversed. If reversing x causes the value to go outside the signed 32-bit integer range [-231, 231 - 1], then return 0.

// Assume the environment does not allow you to store 64-bit integers (signed or unsigned).

 
// Example 1:
// Input: x = 123
// Output: 321

// Example 2:
// Input: x = -123
// Output: -321

// Example 3:
// Input: x = 120
// Output: 21
 

// Constraints:
// -2^31 <= x <= 2^31 - 1

extension Problems {
    // Approach: Array, String
    // Time complexity: O(n) => 3 ms
    // Space complexity: O(1) => 13.44
    static func problem_7_reverse(_ x: Int) -> Int {
        var x = x
        var result = 0
        
        while x != 0 {
            result *= 10
            result += x % 10
            x = x / 10
        }
        
        return result <= Int32.max && result >= Int32.min ? result : 0
    }
}
