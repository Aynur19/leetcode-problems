//
//  Problem_125.swift
//  LeetCodeProblems
//
//  Created by Aynur Nasybullin on 17.01.2024.
//

//  125. Valid Palindrome
//  Easy
//  Topics: Two Pointers, String

//  A phrase is a palindrome if, after converting all uppercase letters into lowercase letters
//  and removing all non-alphanumeric characters, it reads the same forward and backward.
//  Alphanumeric characters include letters and numbers.
//
//  Given a string s, return true if it is a palindrome, or false otherwise.

//  Example 1:
//  Input: s = "A man, a plan, a canal: Panama"
//  Output: true
//  Explanation: "amanaplanacanalpanama" is a palindrome.
//
//  Example 2:
//  Input: s = "race a car"
//  Output: false
//  Explanation: "raceacar" is not a palindrome.
//
//  Example 3:
//  Input: s = " "
//  Output: true
//  Explanation: s is an empty string "" after removing non-alphanumeric characters.
//  Since an empty string reads the same forward and backward, it is a palindrome.
 
//  Constraints:
//  1 <= s.length <= 2 * 10^5
//  s consists only of printable ASCII characters.

extension Problems {
    // Approach: Filtration, Reversing
    // Time complexity: O(n) = 22 ms
    // Space complexity: O(n) = 16.05 MB
    static func problem_125_isPalindrome(_ s: String) -> Bool {
        let alphabet = Set("abcdefghijklnmopqrstuvwxyz1234567890")
        let s = String(s.lowercased().filter { alphabet.contains($0) })
        
       return s == String(s.reversed())
    }
}
