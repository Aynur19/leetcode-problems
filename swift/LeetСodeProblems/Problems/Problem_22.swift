//
//  Problem_22.swift
//  LeetCodeProblems
//
//  Created by Aynur Nasybullin on 16.10.2023.
//

// 22. Generate Parentheses
// Medium
// URL: https://leetcode.com/problems/generate-parentheses/
// Topics: String, Dynamic Programming, Backtracking

// Given n pairs of parentheses, write a function to generate all combinations of well-formed parentheses.

 
// Example 1:
// Input: n = 3
// Output: ["((()))","(()())","(())()","()(())","()()()"]

// Example 2:
// Input: n = 1
// Output: ["()"]
 

// Constraints:
// 1 <= n <= 8

extension Problems {
    // Approach: Recursion
    // Time complexity: O(C(n) * n)
    // Space complexity: O(C(n) * n)
    // C(n) - Catalan number
    static func problem_22_generateParenthesis(_ n: Int) -> [String] {
        func generateParenthesis(_ result: inout [String], _ current: inout [Character], _ openN: Int, _ closeN: Int) {
            if openN == 0, closeN == 0 {
                result.append(String(current))
                return
            }
            
            if openN > 0 {
                current.append("(")
                generateParenthesis(&result, &current, openN - 1, closeN + 1)
                _ = current.removeLast()
            }
            
            if closeN > 0 {
                current.append(")")
                generateParenthesis(&result, &current, openN, closeN - 1)
                current.removeLast()
            }
        }
        
        var result = [String]()
        var current = [Character]()
        
        generateParenthesis(&result, &current, n, 0)
                
        return result
    }
    
    
    // Approach: Dynimic Programming
    // Time complexity: O(C(n) * n)
    // Space complexity: O(C(n) * n)
    // C(n) - Catalan number
    static func problem_22_generateParenthesis2(_ n: Int) -> [String] {
        func nextParentheses(_ current: inout [Character]) -> Bool {
            var openN = 0
            var closeN = 0
            var i = current.count - 1
            
            while i >= 0 {
                if current[i] == ")" {
                    closeN += 1
                } else if current[i] == "(" {
                    openN += 1
                    
                    if closeN > openN {
                        current[i] = ")"
                        closeN -= 1
                        
                        while openN > 0 {
                            i += 1
                            current[i] = "("
                            openN -= 1
                        }
                        
                        while closeN > 0 {
                            i += 1
                            current[i] = ")"
                            closeN -= 1
                        }
                        
                        return true
                    }
                }
                
                i -= 1
            }
            
            return false
        }
        
        var result = [String]()
        var current = [Character]()
        
        for _ in 0..<n { current.append("(") }
        for _ in 0..<n { current.append(")") }
        
        repeat {
            result.append(String(current))
        } while nextParentheses(&current)
        
        return result
    }
}

