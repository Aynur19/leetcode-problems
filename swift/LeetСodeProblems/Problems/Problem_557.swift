//
//  Problem_557.swift
//  LeetСodeProblems
//
//  Created by Aynur Nasybullin on 06.02.2024.
//

//  557. Reverse Words in a String III
//  Easy
//  Topics: Two Pointers, String

//  Given a string s, reverse the order of characters in each word within
//  a sentence while still preserving whitespace and initial word order.

//  Example 1:
//  Input: s = "Let's take LeetCode contest"
//  Output: "s'teL ekat edoCteeL tsetnoc"
//
//  Example 2:
//  Input: s = "Mr Ding"
//  Output: "rM gniD"
 
//  Constraints:
//  1 <= s.length <= 5 * 10^4
//  s contains printable ASCII characters.
//  s does not contain any leading or trailing spaces.
//  There is at least one word in s.
//  All the words in s are separated by a single space.

extension Problems {
    // Approach: Standard String Funcs
    // Time complexity: O(n * m) = 100 ms
    // Space complexity: O(n * m) = 16.78 MB
    static func problem_557_reverseWords(_ s: String) -> String {
        return s
            .split(separator: " ")                   // n
            .compactMap { String($0.reversed()) }    // m
            .joined(separator: " ")
    }
    
    // Approach: Two Pointers, Iterator
    // Time complexity: O(n * m) = 91 ms
    // Space complexity: O(n * m) = 17.70 MB
    static func problem_557_reverseWords2(_ s: String) -> String {
        var reversedChars = Array(s)
        reversedChars.append(" ")
        guard reversedChars.count > 1 else { return s }
        
        var left = -1
        var right = 0
        var iter = s.makeIterator()
        let n = reversedChars.count
        
        while right < n {
            if reversedChars[right] == " " {
                left = right
                
                while true {
                    left -= 1
                    if let char = iter.next() {
                        if char == " " { break }
                        
                        reversedChars[left] = char
                    } else { break }
                }
            }
            
            right += 1
        }
        
        _ = reversedChars.removeLast()
        return String(reversedChars)
    }
}
