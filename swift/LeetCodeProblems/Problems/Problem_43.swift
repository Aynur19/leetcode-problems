//
//  Problem_43.swift
//  LeetCodeProblems
//
//  Created by Aynur Nasybullin on 15.01.2024.
//

//  43. Multiply Strings
//  Medium
//  Topics: Math, String, Simulation

//  Given two non-negative integers num1 and num2 represented as strings, 
//  return the product of num1 and num2, also represented as a string.
//  
//  Note: You must not use any built-in BigInteger library or convert the inputs to integer directly.

//  Example 1:
//  Input: num1 = "2", num2 = "3"
//  Output: "6"
//
//  Example 2:
//  Input: num1 = "123", num2 = "456"
//  Output: "56088"
 
//  Constraints:
//  1 <= num1.length, num2.length <= 200
//  num1 and num2 consist of digits only.
//  Both num1 and num2 do not contain any leading zero, except the number 0 itself.

extension Problems {
    // Approach: Array, String
    // Time complexity: O(n * m) = 34 ms
    // Space complexity: O(max(n, m)) = 15.58 MB
    static func problem_43_multiply(_ num1: String, _ num2: String) -> String {
        guard num1 != "0", num2 != "0" else { return "0" }
        guard num1 != "1", num2 != "1" else { return num1 == "1" ? num2 : num1 }
        
        var result: [String] = []
        
        var short = Array(num1.reversed())
        var long = Array(num2.reversed())
        
        if short.count > long.count {
            long = short
            short = num2.reversed()
        }
        
        var added = 0
        var lastIdx = 0
        
        for i in short.indices {
            added = 0
            
            for j in long.indices {
                lastIdx = i + j
                let a = short[i].asciiValue! - 48
                let b = long[j].asciiValue! - 48
                let addedFromResult = (lastIdx < result.count) ? Int(result[i + j])! : 0
            
                let multiply = Int(a * b) + added + addedFromResult
                added = multiply / 10
                
                let value = String(multiply % 10)
                if lastIdx < result.count {
                    result[i + j] = value
                } else {
                    result.append(value)
                }
            }
            
            if added > 0 {
                lastIdx = i + long.count
                if lastIdx < result.count {
                    var value = Int(result[lastIdx])! + added
                    result[lastIdx] = String(value % 10)
                    
                    value /= 10
                    if value > 0 {
                        result.append(String(value))
                    }
                } else {
                    result.append(String(added))
                }
            }
        }
        
        return result.reversed().joined()
    }
}
