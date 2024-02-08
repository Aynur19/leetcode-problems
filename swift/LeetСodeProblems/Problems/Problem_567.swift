//
//  Problem_567.swift
//  LeetСodeProblems
//
//  Created by Aynur Nasybullin on 06.02.2024.
//

//  567. Permutation in String
//  Medium
//  Topics: Hash Table, Two Pointers, String, Sliding Window

//  Given two strings s1 and s2, return true if s2 contains a permutation of s1, or false otherwise.
//
//  In other words, return true if one of s1's permutations is the substring of s2.

//  Example 1:
//  Input: s1 = "ab", s2 = "eidbaooo"
//  Output: true
//  Explanation: s2 contains one permutation of s1 ("ba").
//
//  Example 2:
//  Input: s1 = "ab", s2 = "eidboaoo"
//  Output: false
 
//  Constraints:
//  1 <= s1.length, s2.length <= 10^4
//  s1 and s2 consist of lowercase English letters.

extension Problems {
    // Approach: Hash Table, Two Pointers, Sliding Window
    // Time complexity: O(n) = 28 ms
    // Space complexity: O(n) = 15.94 MB
    static func problem_567_checkInclusion(_ s1: String, _ s2: String) -> Bool {
        let charsS1 = Array(s1)
        let charsS2 = Array(s2)
        guard charsS1.count <= charsS2.count else { return false }
        
        var charsCountsS1 = [Character:Int]()
        for char in charsS1 {
            charsCountsS1[char, default: 0] += 1
        }
        let size = charsCountsS1.count
        
        var windowChars = [Character:Int]()
        var matches = 0
        var left  = -1
        var right = -1
        
        func checkMatches(_ char: Character, _ isMovedRightPtr: Bool = true) {
            var count = 0
            let added = isMovedRightPtr ? 1 : -1
            if let charCountWindow = windowChars[char] {
                count = charCountWindow + added
            } else {
                count = added
            }
            windowChars[char] = count
            
            guard let charCountS1 = charsCountsS1[char] else { return }
            
            if charCountS1 == count {
                matches += 1
            } else if isMovedRightPtr && charCountS1 == count - 1 ||
                        !isMovedRightPtr && charCountS1 == count + 1 {
                matches -= 1
            }
        }
        
        func moveRightPtr() {
            right += 1
            let char = charsS2[right]
            checkMatches(char)
        }
        
        func moveLeftPtr() {
            left += 1
            let char = charsS2[left]
            checkMatches(char, false)
        }
        
        while right - left < charsS1.count {
            moveRightPtr()
        }
        if matches == size { return true}
        
        while right < charsS2.count - 1 {
            moveLeftPtr()
            moveRightPtr()
            if matches == size { return true}
        }
        
        return false
    }
    
    // Approach: Hash Table, Two Pointers, Sliding Window, Iterator
    // Time complexity: O(n) = 36 ms
    // Space complexity: O(n) = 15.80 MB
    static func problem_567_checkInclusion2(_ s1: String, _ s2: String) -> Bool {
        let nS1 = s1.count
        let nS2 = s2.count
        guard nS1 <= nS2 else { return false }
        
        var charsCountsS1 = [Character:Int]()
        for char in s1 {
            charsCountsS1[char, default: 0] += 1
        }
        let size = charsCountsS1.count
        
        var windowChars = [Character:Int]()
        var matches = 0
        let leftIter = StringIterator(s2)
        let rightIter = StringIterator(s2)
        
        func movePtr(_ isRightPtr: Bool = true) {
            let next = isRightPtr ? rightIter.next() : leftIter.next()
            if next.idx < 0 { return }
            
            let added = isRightPtr ? 1 : -1
            
            let count: Int
            if let charCountWindow = windowChars[next.char] {
                count = charCountWindow + added
            } else {
                count = added
            }
            windowChars[next.char] = count
            
            guard let charCountS1 = charsCountsS1[next.char] else { return }
            
            if charCountS1 == count {
                matches += 1
            } else if isRightPtr && charCountS1 == count - 1 ||
                        !isRightPtr && charCountS1 == count + 1 {
                matches -= 1
            }
        }
        
        while !rightIter.isEnd, rightIter.idx - leftIter.idx < nS1 {
            movePtr()
        }
        if matches == size { return true}
        
        while !rightIter.isEnd, rightIter.idx < nS2 - 1 {
            movePtr(false)
            movePtr()
            if matches == size { return true}
        }
        return false
    }
}
