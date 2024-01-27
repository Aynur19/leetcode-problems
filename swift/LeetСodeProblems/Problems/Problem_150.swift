//
//  Problem_150.swift
//  LeetCodeProblems
//
//  Created by Aynur Nasybullin on 24.01.2024.
//

//  150. Evaluate Reverse Polish Notation
//  Medium
//  Topics: Array, Math, Stack

//  You are given an array of strings tokens that represents an arithmetic expression in a Reverse Polish Notation.
//
//  Evaluate the expression. Return an integer that represents the value of the expression.
//
//  Note that:
//  - The valid operators are '+', '-', '*', and '/'.
//  - Each operand may be an integer or another expression.
//  - The division between two integers always truncates toward zero.
//  - There will not be any division by zero.
//  - The input represents a valid arithmetic expression in a reverse polish notation.
//  - The answer and all the intermediate calculations can be represented in a 32-bit integer.
 
//  Example 1:
//  Input: tokens = ["2","1","+","3","*"]
//  Output: 9
//  Explanation: ((2 + 1) * 3) = 9
//
//  Example 2:
//  Input: tokens = ["4","13","5","/","+"]
//  Output: 6
//  Explanation: (4 + (13 / 5)) = 6
//
//  Example 3:
//  Input: tokens = ["10","6","9","3","+","-11","*","/","*","17","+","5","+"]
//  Output: 22
//  Explanation: ((10 * (6 / ((9 + 3) * -11))) + 17) + 5 
//      = ((10 * (6 / (12 * -11))) + 17) + 5
//      = ((10 * (6 / -132)) + 17) + 5
//      = ((10 * 0) + 17) + 5
//      = (0 + 17) + 5
//      = 17 + 5
//      = 22
 
//  Constraints:
//  1 <= tokens.length <= 10^4
//  tokens[i] is either an operator: "+", "-", "*", or "/", or an integer in the range [-200, 200].

extension Problems {
    // Approach: Dynamic Programming, Stack
    // Time complexity: O(n) = 27 ms
    // Space complexity: O(n * (2/3)) = 15.82 MB
    static func problem_150_evalRPN(_ tokens: [String]) -> Int {
        guard tokens.count > 1 else { return Int(tokens[0])! }
    
        var numbers = [Int]()
        
        tokens.forEach { word in
            if let number = Int(word) {
                numbers.append(number)
            } else {
                let n = numbers.count
                let a = numbers[n - 2]
                let b = numbers[n - 1]
                
                switch word {
                    case "+": numbers[n - 2] = a + b
                    case "-": numbers[n - 2] = a - b
                    case "*": numbers[n - 2] = a * b
                    default: numbers[n - 2] = a / b
                }
                
                _ = numbers.removeLast()
            }
        }
        
        return numbers[0]
    }
}
