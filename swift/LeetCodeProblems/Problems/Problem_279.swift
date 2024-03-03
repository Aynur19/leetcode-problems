//
//  Problem_279.swift
//  LeetСodeProblems
//
//  Created by Aynur Nasybullin on 29.01.2024.
//

//  279. Perfect Squares
//  Medium
//  Topics

//  Given an integer n, return the least number of perfect square numbers that sum to n.
//
//  A perfect square is an integer that is the square of an integer; in other words,
//  it is the product of some integer with itself. For example, 1, 4, 9, and 16 are perfect squares while 3 and 11 are not.

//  Example 1:
//  Input: n = 12
//  Output: 3
//  Explanation: 12 = 4 + 4 + 4.
//
//  Example 2:
//  Input: n = 13
//  Output: 2
//  Explanation: 13 = 4 + 9.
 
//  Constraints:
//  1 <= n <= 10^4

import Foundation

//  help: https://www.youtube.com/watch?v=yUqNob_zPIg&ab_channel=3.5%D0%B7%D0%B0%D0%B4%D0%B0%D1%87%D0%B8%D0%B2%D0%BD%D0%B5%D0%B4%D0%B5%D0%BB%D1%8E
extension Problems {
    private static func isSquare(_ num: Int) -> Bool {
        let sqrtNum = Int(sqrt(Double(num)))
        return sqrtNum * sqrtNum == num
    }
    
    // Approach:
    // Time complexity: O(n^(3/2)) = 102 ms
    // Space complexity: O(1) = 14.81 MB
    static func problem_279_numSquares(_ n: Int) -> Int {
        func numSquares(_ num: Int, squares: Int) -> Int {
            if isSquare(num) { return 1 }
            
            var result = 5
            if squares == 1 { return result }
            
            var first = 1
            var square = first * first
            while square <= num {
                result = min(result, 1 + numSquares(num - square, squares: squares - 1))
                first += 1
                square = first * first
            }
            
            return result
        }
        
        return numSquares(n, squares: 4)
    }
}
