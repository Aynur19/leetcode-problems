//
//  Problem_32.swift
//  LeetCodeProblems
//
//  Created by Aynur Nasybullin on 12.01.2024.
//

//  32. Longest Valid Parentheses
//  Hard
//  Topics: String, Dynamic Programming, Stack
//
//  Given a string containing just the characters '(' and ')', 
//  return the length of the longest valid (well-formed) parentheses substring.

//  Example 1:
//  Input: s = "(()"
//  Output: 2
//  Explanation: The longest valid parentheses substring is "()".
//
//  Example 2:
//  Input: s = ")()())"
//  Output: 4
//  Explanation: The longest valid parentheses substring is "()()".
//
//  Example 3:
//  Input: s = ""
//  Output: 0
 
//  Constraints:
//  0 <= s.length <= 3 * 10^4
//  s[i] is '(', or ')'.

extension Problems {
    // Approach: String, Dynamic Programming, Stack
    // Time complexity: O(n) => 16 ms
    // Space complexity: O(n) => 15.64 MB
    static func problem_32_longestValidParentheses(_ s: String) -> Int {
        guard s.count > 1 else { return 0 }
        
        func longestValidParentheses(s: String, check: @escaping (Int, Int) -> Bool, isReversed: Bool = false) -> Int {
            let data = isReversed ? String(s.reversed()) : s
            
            var opens = 0
            var closes = 0
            var maxLength = 0
            
            for char in data {
                if char == "(" {
                    opens += 1
                } else {
                    closes += 1
                }
                
                if opens == closes {
                    maxLength = max(maxLength, opens)
                } else if check(opens, closes) {
                    opens = 0
                    closes = 0
                }
            }
            
            return maxLength
        }
        
        let forwardResult = longestValidParentheses(
            s: s,
            check: { opens, closes in
                opens < closes
            }
        )
        
        let backwardResult = longestValidParentheses(
            s: s,
            check: { opens, closes in
                opens > closes
            },
            isReversed: true
        )
        
        return max(forwardResult, backwardResult) * 2
    }
    
    // Approach: String, Dynamic Programming, Stack
    // Time complexity: O(n) => 6 ms
    // Space complexity: O(1) => 15.58 MB
    static func problem_32_longestValidParentheses_2(_ s: String) -> Int {
        guard s.count > 1 else { return 0 }
        
        let s = Array(s)
        var opens = 0
        var closes = 0
        var maxLength = 0
            
        for char in s {
            if char == "(" {
                opens += 1
            } else {
                closes += 1
            }
            
            if opens == closes {
                maxLength = max(maxLength, opens)
            } else if opens < closes {
                opens = 0
                closes = 0
            }
        }
        
        opens = 0
        closes = 0
        
        for i in stride(from: s.count - 1, to: -1, by: -1) {
            if s[i] == "(" {
                opens += 1
            } else {
                closes += 1
            }
            
            if opens == closes {
                maxLength = max(maxLength, opens)
            } else if opens > closes {
                opens = 0
                closes = 0
            }
        }
        
        return maxLength * 2
    }
}
