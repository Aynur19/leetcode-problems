//
//  Problem_680.swift
//  LeetСodeProblems
//
//  Created by Aynur Nasybullin on 13.02.2024.
//

//  680. Valid Palindrome II
//  Attempted
//  Easy
//  Topics: Two Pointers, String, Greedy 

//  Given a string s, return true if the s can be palindrome after deleting at most one character from it.

//  Example 1:
//  Input: s = "aba"
//  Output: true
//
//  Example 2:
//  Input: s = "abca"
//  Output: true
//  Explanation: You could delete the character 'c'.
//
//  Example 3:
//  Input: s = "abc"
//  Output: false
 
//  Constraints:
//  1 <= s.length <= 10^5
//  s consists of lowercase English letters.

extension Problems {
    // Approach: Recursion, String Iteration, Two Pointer
    // Time complexity: O(n) = 298 ms
    // Space complexity: O(n) = 15.99 MB
    static func problem_680_validPalindrome(_ s: String) -> Bool {
        let n = s.count
        guard n > 2 else { return true }
        
        func validPalindrome(_ iterL: StringIterator, _ iterR: StringIterator, side: Int = 0, misses: Int) -> Bool {
            if iterL.isEnd || iterR.isEnd { return false }
            if side != 0 {
                if side < 0 {
                    _ = iterR.next()
                    if iterR.isEnd || iterR.char != iterL.char { return false }
                } else {
                    _ = iterL.next()
                    if iterL.isEnd || iterL.char != iterR.char { return false }
                }
            }
            
            while n > iterL.idx + iterR.idx + 2 {
                _ = iterL.next()
                _ = iterR.next()
                
                if iterL.isEnd != iterR.isEnd { return false }
                
                if iterL.char != iterR.char {
                    if misses == 0 { return false }
                    
                    let result1 = validPalindrome(.init(iterL), .init(iterR), side: -1, misses: misses - 1)
                    let result2 = validPalindrome(.init(iterL), .init(iterR), side: 1, misses: misses - 1)
                    
                    return result2 || result1
                }
            }
            return true
        }
        
        let s2 = String(s.reversed())
        guard s != s2 else { return true }
        
        let iterL = StringIterator(s)
        let iterR = StringIterator(s2)
        
        return validPalindrome(.init(iterL), .init(iterR), misses: 1)
    }
    
    // Approach: Recursion, Two Pointer
    // Time complexity: O(n) = 101 ms
    // Space complexity: O(n) = 17.36 MB
    static func problem_680_validPalindrome2(_ s: String) -> Bool {
        let chars = Array(s)
        let n = chars.count
        guard n > 2 else { return true }
        
        func validPalindrome(_ ptrL: Int, _ ptrR: Int, misses: Int) -> Bool {
            var ptrL = ptrL
            var ptrR = ptrR
            if ptrL >= n || ptrR < 0 { return false }
            
            while ptrL * 2 < n {
                if chars[ptrL] != chars[ptrR] {
                    if misses == 0 { return false }
                    
                    let result1 = validPalindrome(ptrL + 1, ptrR, misses: misses - 1)
                    let result2 = validPalindrome(ptrL, ptrR - 1, misses: misses - 1)
                    
                    return result2 || result1
                }
                
                ptrR -= 1
                ptrL += 1
            }
            return true
        }
        
        return validPalindrome(0, n - 1, misses: 1)
    }
}
