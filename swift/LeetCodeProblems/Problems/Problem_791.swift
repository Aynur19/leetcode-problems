//
//  Problem_791.swift
//  LeetCodeProblems
//
//  Created by Aynur Nasybullin on 11.03.2024.
//

//  791. Custom Sort String
//  Medium
//  Topics: Hash Table, String, Sorting

//  You are given two strings order and s. All the characters of order are unique and were sorted in some custom order previously.
//  
//  Permute the characters of s so that they match the order that order was sorted. More specifically, if a character x occurs before a character y in order, then x should occur before y in the permuted string.
//  
//  Return any permutation of s that satisfies this property.

//  Example 1:
//  Input:  order = "cba", s = "abcd"
//  Output:  "cbad"
//  Explanation: "a", "b", "c" appear in order, so the order of "a", "b", "c" should be "c", "b", and "a".
//
//  Since "d" does not appear in order, it can be at any position in the returned string. "dcba", "cdba", "cbda" are also valid outputs.
//
//  Example 2:
//  Input:  order = "bcafg", s = "abcd"
//  Output:  "bcad"
//  
//  Explanation: The characters "b", "c", and "a" from order dictate the order for the characters in s. The character "d" in s does not appear in order, so its position is flexible.
//
//  Following the order of appearance in order, "b", "c", and "a" from s should be arranged as "b", "c", "a". "d" can be placed at any position since it's not in order. The output "bcad" correctly follows this rule. Other arrangements like "bacd" or "bcda" would also be valid, as long as "b", "c", "a" maintain their order.

//  Constraints:
//  1 <= order.length <= 26
//  1 <= s.length <= 200
//  order and s consist of lowercase English letters.
//  All the characters of order are unique.

extension Problems {
    func problem_791_customSortString(_ order: String, _ s: String) -> String {
        var dictS = [Character:Int]()
        for char in s {
            dictS[char, default: 0] += 1
        }
        
        var result = [Character]()
        for char in order {
            if let count = dictS[char] {
                result.append(contentsOf: Array(repeating: char, count: count))
                dictS[char] = nil
            }
        }
        
        for keyValue in dictS {
            result.append(contentsOf: Array(repeating: keyValue.key, count: keyValue.value))
        }
        
        return String(result)
    }
}

extension ProblemsTestCases {
    static func testsData_791() -> [(order: String, s: String, expected: String)] {
        var testsData = [(order: String, s: String, expected: String)]()
        
        testsData.append((order: "cba", s: "abcd", expected: "cbad"))
        testsData.append((order: "bcafg", s: "abcd", expected: "bcad"))
        testsData.append((order: "kqep", s: "pekeq", expected: "kqeep"))
        
        return testsData
    }
}
