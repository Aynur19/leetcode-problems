//
//  Problem_438.swift
//  LeetСodeProblems
//
//  Created by Aynur Nasybullin on 02.02.2024.
//

//  438. Find All Anagrams in a String
//  Medium
//  Topics: Hash Table, String, Sliding Window

//  Given two strings s and p, return an array of all the start indices of p's anagrams in s. 
//  You may return the answer in any order.
//
//  An Anagram is a word or phrase formed by rearranging the letters of a different word or phrase, 
//  typically using all the original letters exactly once.

//  Example 1:
//  Input: s = "cbaebabacd", p = "abc"
//  Output: [0,6]
//  Explanation:
//      The substring with start index = 0 is "cba", which is an anagram of "abc".
//      The substring with start index = 6 is "bac", which is an anagram of "abc".
//
//  Example 2:
//  Input: s = "abab", p = "ab"
//  Output: [0,1,2]
//  Explanation:
//      The substring with start index = 0 is "ab", which is an anagram of "ab".
//      The substring with start index = 1 is "ba", which is an anagram of "ab".
//      The substring with start index = 2 is "ab", which is an anagram of "ab".
 
//  Constraints:
//  1 <= s.length, p.length <= 3 * 10^4
//  s and p consist of lowercase English letters.

extension Problems {
    // Approach: Iterator, Sliding Window, Hash Table
    // Time complexity: O(n * m) = 37 ms
    // Space complexity: O(m) = 17.22 MB
    static func problem_438_findAnagrams(_ s: String, _ p: String) -> [Int] {
        var charsCounts = [Character:Int]()
        for char in p {
            charsCounts[char, default: 0] += 1
        }
        
        let n = s.count
        var result = [Int]()
        var left = -1,  leftIter = s.makeIterator()
        var right = -1, rightIter = s.makeIterator()
        var dict = charsCounts
        
        while right < n - 1 {
            right += 1
            if let rightChar = rightIter.next() {
                if let count = dict[rightChar] {
                    if count == 1 {
                        dict[rightChar] = nil
                    } else {
                        dict[rightChar] = count - 1
                    }
                } else if charsCounts[rightChar] != nil {
                    while true {
                        left += 1
                        if let leftChar = leftIter.next() {
                            if leftChar == rightChar {
                                break
                            }
                            
                            if charsCounts[leftChar] != nil {
                                dict[leftChar, default: 0] += 1
                            }
                        }
                    }
                } else {
                    left = right
                    leftIter = rightIter
                    dict = charsCounts
                }
            }
            
            if dict.isEmpty {
                left += 1
                if let leftChar = leftIter.next() {
                    dict[leftChar, default: 0] += 1
                }
                result.append(left)
            }
        }
        
        return result
    }
    
    // Approach: Iterator, Sliding Window, Hash Table
    // Time complexity: O(n * m) = 42 ms
    // Space complexity: O(m) = 17.19 MB
    static func problem_438_findAnagrams2(_ s: String, _ p: String) -> [Int] {
        var charsCounts = [Character:Int]()
        for char in p {
            charsCounts[char, default: 0] += 1
        }
        
        let charsS = Array(s)
        let n = charsS.count
        var result = [Int]()
        var left = -1, right = -1
        var dict = charsCounts
        
        while right < n - 1 {
            right += 1
            let rightChar = charsS[right]
            
            if let count = dict[rightChar] {
                if count == 1 {
                    dict[rightChar] = nil
                } else {
                    dict[rightChar] = count - 1
                }
            } else if charsCounts[rightChar] != nil {
                while true {
                    left += 1
                    let leftChar = charsS[left]
                    if leftChar == rightChar { break }
                        
                    if charsCounts[leftChar] != nil {
                        dict[leftChar, default: 0] += 1
                    }
                }
            } else {
                left = right
                dict = charsCounts
            }
            
            if dict.isEmpty {
                left += 1
                let leftChar = charsS[left]
                
                dict[leftChar, default: 0] += 1
                result.append(left)
            }
        }
        
        return result
    }
}
