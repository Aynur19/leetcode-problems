//
//  Problem_20.swift
//  LeetCodeProblems
//
//  Created by Aynur Nasybullin on 16.10.2023.
//

// 20. Valid Parentheses
// Easy

// Given a string s containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.

// An input string is valid if:

// Open brackets must be closed by the same type of brackets.
// Open brackets must be closed in the correct order.
// Every close bracket has a corresponding open bracket of the same type.
 

// Example 1:
// Input: s = "()"
// Output: true

// Example 2:
// Input: s = "()[]{}"
// Output: true

// Example 3:
// Input: s = "(]"
// Output: false
 

// Constraints:
// 1 <= s.length <= 10^4
// s consists of parentheses only '()[]{}'.

extension Problems {
    // Approach: Hash Table, Array
    // Time complexity: O(n) => 0 ms
    // Space complexity: O(n) => 14.39 MB
    static func problem_20_isValid(_ s: String) -> Bool {
        let open: [Character] = ["[", "{", "("]
        let dict: [Character:Character] = ["]": "[", "}": "{", ")": "("]
        guard s.count > 1, open.contains(s.first!) else { return false }

        let chars = Array(s)
        var tmp: [Character] = []
        
        for i in 0..<chars.count {
            if open.contains(chars[i]) {
                tmp.append(chars[i])
            } else if tmp.last == dict[chars[i]] {
                tmp.removeLast()
            } else {
                return false
            }
        }
        
        return tmp.isEmpty
    }
}
