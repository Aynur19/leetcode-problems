//
//  Problem_38.swift
//  LeetCodeProblems
//
//  Created by Aynur Nasybullin on 15.01.2024.
//

//  38. Count and Say
//  Medium
//  Topics: String

//  The count-and-say sequence is a sequence of digit strings defined by the recursive formula:
//  - countAndSay(1) = "1"
//  - countAndSay(n) is the way you would "say" the digit string from countAndSay(n-1),
//    which is then converted into a different digit string.
//
//  To determine how you "say" a digit string, split it into the minimal number of substrings such
//  that each substring contains exactly one unique digit.
//  Then for each substring, say the number of digits, then say the digit. Finally, concatenate every said digit.
//
//  For example, the saying and conversion for digit string "3322251":
//
//  Given a positive integer n, return the nth term of the count-and-say sequence.

//  Example 1:
//  Input: n = 1
//  Output: "1"
//  Explanation: This is the base case.
//
//  Example 2:
//  Input: n = 4
//  Output: "1211"
//  Explanation:
//  - countAndSay(1) = "1"
//  - countAndSay(2) = say "1" = one 1 = "11"
//  - countAndSay(3) = say "11" = two 1's = "21"
//  - countAndSay(4) = say "21" = one 2 + one 1 = "12" + "11" = "1211"
 
//  Constraints:
//  1 <= n <= 30

extension Problems {
    // Approach: String, Recursion
    // Time complexity: O(n*n) => 15 ms
    // Space complexity: O(n^n) => 14.98 MB
    static func problem_38_countAndSay(_ n: Int) -> String {
        var result = [Character]()
        
        func say(_ n: Int) -> [Character] {
            guard n > 1 else { return ["1"] }
            
            result = say(n - 1)
            
            guard var current = result.first else { return result }
            var count = 1
            var chars = [Character]()
            
            for i in 1..<result.count {
                if result[i] != current {
                    chars.append(contentsOf: Array("\(count)\(current)"))
                    count = 0
                    current = result[i]
                }
                
                count += 1
            }
            chars.append(contentsOf: Array("\(count)\(current)"))
            
            return chars
        }
        
        return String(say(n))
    }
    
    
    // Approach: String
    // Time complexity: O(n*n) => 14 ms
    // Space complexity: O(n^n) => 14.9 MB
    static func problem_38_countAndSay_2(_ n: Int) -> String {
        guard n > 1 else { return "1" }
        
        var result: [Character] = ["1"]
        
        for _ in 2...n {
            var current = result[0]
            var count = 1
            var chars = [Character]()
            
            for j in 1..<result.count {
                if result[j] == current {
                    count += 1
                    continue
                }
                
                chars.append(contentsOf: Array("\(count)\(current)"))
                current = result[j]
                count = 1
            }
            
            chars.append(contentsOf: Array("\(count)\(current)"))
            result = chars
        }
        
        return String(result)
    }
}
