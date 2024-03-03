//
//  Problem_29.swift
//  LeetCodeProblems
//
//  Created by Aynur Nasybullin on 19.10.2023.
//

// 29. Divide Two Integers
// Medium
// URL:
// Topics:

// Given two integers dividend and divisor, divide two integers without using multiplication, division, and mod operator.

// The integer division should truncate toward zero, which means losing its fractional part. For example, 8.345 would be truncated to 8, and -2.7335 would be truncated to -2.

// Return the quotient after dividing dividend by divisor.

// Note: Assume we are dealing with an environment that could only store integers within the 32-bit signed integer range: [−231, 231 − 1]. For this problem, if the quotient is strictly greater than 231 - 1, then return 231 - 1, and if the quotient is strictly less than -231, then return -231.

 
// Example 1:
// Input: dividend = 10, divisor = 3
// Output: 3
// Explanation: 10/3 = 3.33333.. which is truncated to 3.

// Example 2:
// Input: dividend = 7, divisor = -3
// Output: -2
// Explanation: 7/-3 = -2.33333.. which is truncated to -2.
 

// Constraints:
// -2^31 <= dividend, divisor <= 2^31 - 1
// divisor != 0

extension Problems {
    // Approach: Two Pointers, Array
    // Time complexity: O(log (n)) => 4 ms
    // Space complexity: O(log (n)) => 13.7 MB
    static func problem_29_divide(_ dividend: Int, _ divisor: Int) -> Int {
        func getResult(_ count: Int, _ isNegative: Bool) -> Int {
            if !isNegative {
                return count < Int(Int32.max) ? count : Int(Int32.max)
            }
            
            return -count > Int(Int32.min) ? -count : Int(Int32.min)
        }
        
        let isNegative = (divisor > 0 && dividend <= 0) || (divisor < 0 && dividend >= 0)

        let dividend = abs(dividend)
        let divisor = abs(divisor)
       
        guard divisor <= dividend else { return 0 }
        guard divisor != 1 else { return getResult(dividend, isNegative) }
        guard divisor != dividend else { return getResult(1, isNegative) }
        
        var num = divisor
        var count = 1
        var values = [(num, count)]

        while num << 1 < dividend {
            values.append((num << 1, count << 1))
            num = values[values.count - 1].0
            count = values[values.count - 1].1
        }
        
        var i = values.count - 1
        while i >= 0 {
            if num + values[i].0 <= dividend {
                num += values[i].0
                count += values[i].1
            } else if num == dividend {
                break
            } else {
                i -= 1
            }
        }
        
        return getResult(count, isNegative)
    }
}
