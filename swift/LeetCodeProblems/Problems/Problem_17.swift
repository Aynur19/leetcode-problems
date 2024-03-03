//
//  Problem_17.swift
//  LeetCodeProblems
//
//  Created by Aynur Nasybullin on 15.10.2023.
//

// 17. Letter Combinations of a Phone Number
// Medium

// Given a string containing digits from 2-9 inclusive, return all possible letter combinations that the number could represent. Return the answer in any order.

// A mapping of digits to letters (just like on the telephone buttons) is given below. Note that 1 does not map to any letters.


// Example 1:
// Input: digits = "23"
// Output: ["ad","ae","af","bd","be","bf","cd","ce","cf"]

// Example 2:
// Input: digits = ""
// Output: []

// Example 3:
// Input: digits = "2"
// Output: ["a","b","c"]
 

// Constraints:
// 0 <= digits.length <= 4
// digits[i] is a digit in the range ['2', '9'].

extension Problems {
    // Approach: Hash Table (Set), Arrays, String, Combinations
    // Time complexity: O(3^{count("2", "3", "4", "5", "6", "8")} * 4^{count("7", "9")} => 2 ms
    // Space complexity: O(3^{count("2", "3", "4", "5", "6", "8")} * 4^{count("7", "9")} => 14.01 MB
    static func problem_17_letterCombinations(_ digits: String) -> [String] {
        guard !digits.isEmpty else { return [] }
                
        let dict: [Character:String] = [
            "2": "abc", "3": "def",
            "4": "ghi", "5": "jkl", "6": "mno",
            "7": "pqrs", "8": "tuv", "9": "wxyz",
        ]
        
        var strings: [String] = [""]
        for digit in digits {
            if let chars = dict[digit] {
                var newStrings = [String]()
                for prefix in strings {
                    for char in chars {
                        newStrings.append(prefix + String(char))
                    }
                }
                
                strings.removeAll()
                strings.append(contentsOf: newStrings)
            }
        }
        
        return strings
    }
}
