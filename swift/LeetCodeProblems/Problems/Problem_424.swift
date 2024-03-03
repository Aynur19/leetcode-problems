//
//  Problem_424.swift
//  LeetСodeProblems
//
//  Created by Aynur Nasybullin on 01.02.2024.
//

//  424. Longest Repeating Character Replacement
//  Medium
//  Topics

//  You are given a string s and an integer k.
//  You can choose any character of the string and change it to any other uppercase English character.
//  You can perform this operation at most k times.
//
//  Return the length of the longest substring containing the same letter you can get after performing the above operations.

//  Example 1:
//  Input: s = "ABAB", k = 2
//  Output: 4
//  Explanation: Replace the two 'A's with two 'B's or vice versa.
//
//  Example 2:
//  Input: s = "AABABBA", k = 1
//  Output: 4
//  Explanation: Replace the one 'A' in the middle with 'B' and form "AABBBBA".
//      The substring "BBBB" has the longest repeating letters, which is 4.
//      There may exists other ways to achieve this answer too.
 
//  Constraints:
//  1 <= s.length <= 10^5
//  s consists of only uppercase English letters.
//  0 <= k <= s.length

extension Problems {
    // Approach: Iterator, Sliding Window, Hash Table
    // Time complexity: O(n * m) = 310 ms
    // Space complexity: O(m) = 16.2 MB
    static func problem_424_characterReplacement(_ s: String, _ k: Int) -> Int {
        let n = s.count
        guard n > 1 else { return n }
        guard n > k else { return k }
        
        let uniqueChars = Set(s)
        var charCounts = [Character:Int]()
        
        var result = 0
        var size = 0
        
        func moveLeftPtr(
            _ char: Character,
            _ changedCount: inout Int,
            _ left: inout Int,
            _ leftIter: inout String.Iterator
        ) {
            while changedCount > k, left < n - 1 {
                left += 1
                if let leftChar = leftIter.next() {
                    charCounts[leftChar, default: 0] -= 1
                    
                    if leftChar != char {
                        changedCount -= 1
                    }
                }
            }
        }
        
        for char in uniqueChars {
            charCounts.removeAll()
            size = 1
            
            var left = -1,  leftIter = s.makeIterator()
            var right = -1, rightIter = s.makeIterator()
            
            while right < n - 1 {
                right += 1
                
                if let rightChar = rightIter.next() {
                    charCounts[rightChar, default: 0] += 1
                    
                    if rightChar != char {
                        var changedCount = right - left
                        if let currentCharCount = charCounts[char] {
                            changedCount -= currentCharCount
                        }
                        
                        moveLeftPtr(char, &changedCount, &left, &leftIter)
                        size = max(size, right - left)
                    }
                }
                
                size = max(size, right - left)
            }
            
            size = max(size, right - left)
            result = max(result, size)
        }
        
        return result
    }
    
    // Approach: Sliding Window, Hash Table
    // Time complexity: O(n * m) = 261 ms
    // Space complexity: O(m + n) = 16.45 MB
    static func problem_424_characterReplacement2(_ s: String, _ k: Int) -> Int {
        let n = s.count
        guard n > 1 else { return n }
        guard n > k else { return k }
        
        let chars = Array(s)
        let uniqueChars = Set(s)
        var charCounts = [Character:Int]()
        
        var result = 0
        var size = 0
        
        func moveLeftPtr(
            _ char: Character,
            _ changedCount: inout Int,
            _ left: inout Int
        ) {
            while changedCount > k, left < n - 1 {
                left += 1
                let leftChar = chars[left]
                charCounts[leftChar, default: 0] -= 1
                
                if leftChar != char {
                    changedCount -= 1
                }
            }
        }
        
        for char in uniqueChars {
            charCounts.removeAll()
            size = 1
            
            var left = -1
            var right = -1
            
            while right < n - 1 {
                right += 1
                
                let rightChar = chars[right]
                charCounts[rightChar, default: 0] += 1
                    
                if rightChar != char {
                    var changedCount = right - left
                    if let currentCharCount = charCounts[char] {
                        changedCount -= currentCharCount
                    }
                    
                    moveLeftPtr(char, &changedCount, &left)
                    size = max(size, right - left)
                }
            
                size = max(size, right - left)
            }
            
            size = max(size, right - left)
            result = max(result, size)
        }
        
        return result
    }
}
