//
//  Problem_763.swift
//  LeetСodeProblems
//
//  Created by Aynur Nasybullin on 14.02.2024.
//

//  763. Partition Labels
//  Medium
//  Topics: Hash Table, Two Pointers, String, Greedy

//  You are given a string s. We want to partition the string into as many parts
//  as possible so that each letter appears in at most one part.
//
//  Note that the partition is done so that after concatenating all the parts in order, the resultant string should be s.
//
//  Return a list of integers representing the size of these parts.

//  Example 1:
//  Input: s = "ababcbacadefegdehijhklij"
//  Output: [9,7,8]
//  Explanation:
//  - The partition is "ababcbaca", "defegde", "hijhklij".
//  - This is a partition so that each letter appears in at most one part.
//  - A partition like "ababcbacadefegde", "hijhklij" is incorrect, because it splits s into less parts.
//
//  Example 2:
//  Input: s = "eccbbbbdec"
//  Output: [10]
 
//  Constraints:
//  1 <= s.length <= 500
//  s consists of lowercase English letters.

extension Problems {
    // Approach: Hash Table, Set, Two Pointers
    // Time complexity: O(n) = 9 ms
    // Space complexity: O(n) = 16.42 MB
    static func problem_763_partitionLabels(_ s: String) -> [Int] {
        class CharIndices {
            let first: Int
            var last: Int
            
            init(_ first: Int) {
                self.first = first
                self.last = first
            }
        }
        
        var dict = [Character:CharIndices]()
        var set = [Character]()
        var idx = -1
        
        for char in s {
            idx += 1
            if let indices = dict[char] {
                indices.last = idx
            } else {
                set.append(char)
                dict[char] = .init(idx)
            }
        }
        
        var result = [Int]()
        var firstIdx = 0
        var lastIdx = 0
        
        for char in set {
            if let indices = dict[char] {
                if indices.first > lastIdx {
                    result.append(lastIdx - firstIdx + 1)
                    firstIdx = indices.first
                    lastIdx = indices.last
                } else {
                    lastIdx = max(lastIdx, indices.last)
                }
            }
            
            if lastIdx == idx {
                result.append(lastIdx - firstIdx + 1)
                break
            }
        }
        
        return result
    }
}
