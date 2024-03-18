//
//  Problem_9.swift
//  LeetCodeProblems
//
//  Created by Aynur Nasybullin on 11.10.2023.
//

//  9. Palindrome Number
//  Easy
//  Topics: Math

//  Given an integer x, return true if x is a palindrome, and false otherwise.
 
//  Example 1:
//  Input: x = 121
//  Output: true
//  Explanation: 121 reads as 121 from left to right and from right to left.
//
//  Example 2:
//  Input: x = -121
//  Output: false
//  Explanation: From left to right, it reads -121. From right to left, it becomes 121-. Therefore it is not a palindrome.
//
//  Example 3:
//  Input: x = 10
//  Output: false
//  Explanation: Reads 01 from right to left. Therefore it is not a palindrome.
 
//  Constraints:
//  -2^31 <= x <= 2^31 - 1
 
//  Follow up: Could you solve it without converting the integer to a string?


extension Problems {
    // MARK: LeetCode Problem 9. Palindrome Number
    // Link: https://leetcode.com/problems/palindrome-number/
    // Approach: Math
    // Time complexity: O(n) => 15 ms
    // Space complexity: O(1) => 13.96 MB
    public func problem_9_isPalindrome(_ x: Int) -> Bool {
        if x < 0 || x >= 10 && x % 10 == 0 { return false }
        
        var num2 = x % 10
        var num1 = x / 10

        while num1 > 0 {
            num2 = num2 * 10 + num1 % 10
            num1 /= 10
        }

        return x == num2
    }
}


extension ProblemsTestCases {
    static func testsData_9() -> [(x: Int, expected: Bool)] {
        var testsData = [(x: Int, expected: Bool)]()
        
        testsData.append((x: 121, expected: true))
        testsData.append((x: -121, expected: false))
        testsData.append((x: 10, expected: false))
        
        return testsData
    }
}
