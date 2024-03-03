//
//  Problem_49.swift
//  LeetCodeProblems
//
//  Created by Aynur Nasybullin on 16.01.2024.
//

//  49. Group Anagrams
//  Medium
//  Topics: Array, Hash Table, String, Sorting

//  Given an array of strings strs, group the anagrams together. You can return the answer in any order.
//
//  An Anagram is a word or phrase formed by rearranging the letters of a different word or phrase,
//  typically using all the original letters exactly once.

//  Example 1:
//  Input: strs = ["eat","tea","tan","ate","nat","bat"]
//  Output: [["bat"],["nat","tan"],["ate","eat","tea"]]
//
//  Example 2:
//  Input: strs = [""]
//  Output: [[""]]
//
//  Example 3:
//  Input: strs = ["a"]
//  Output: [["a"]]
 
//  Constraints:
//  1 <= strs.length <= 10^4
//  0 <= strs[i].length <= 100
//  strs[i] consists of lowercase English letters.

extension Problems {
    // Approach: Hash Table, Sorting
    // Time complexity: O(n * m * log(m)) = 104 ms
    // Space complexity: O(n) = 17.56 MB
    static func problem_49_groupAnagrams(_ strs: [String]) -> [[String]] {
        var dict = [String:[String]]()
        
        strs.forEach { word in
            let key = String(Array(word).sorted())
            dict[key, default: []].append(word)
        }
        
        return dict.values.map { $0 }
    }
}

