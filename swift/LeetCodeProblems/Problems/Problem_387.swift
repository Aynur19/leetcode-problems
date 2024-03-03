//
//  Problem_387.swift
//  LeetСodeProblems
//
//  Created by Aynur Nasybullin on 31.01.2024.
//

//  387. First Unique Character in a String
//  Easy
//  Topics: Hash Table, String, Queue, Counting

//  Given a string s, find the first non-repeating character in it and return its index. If it does not exist, return -1.

//  Example 1:
//  Input: s = "leetcode"
//  Output: 0
//
//  Example 2:
//  Input: s = "loveleetcode"
//  Output: 2
//
//  Example 3:
//  Input: s = "aabb"
//  Output: -1
 
//  Constraints:
//  1 <= s.length <= 10^5
//  s consists of only lowercase English letters.

extension Problems {
    // Approach: Hash Table, Frequency counting
    // Time complexity: O(n) = 78 ms
    // Space complexity: O(n) = 15.58 MB
    static func problem_387_firstUniqChar(_ s: String) -> Int {
        var dict = [Character:Int]()
        
        s.forEach { char in
            dict[char, default: 0] += 1
        }
        
        var idx = -1
        for char in s {
            idx += 1
            if let count = dict[char], count == 1 { return idx }
        }
        
        return -1
    }
    
    // Approach: Hash Table, Frequency counting, Queue
    // Time complexity: O(n) = 47 ms
    // Space complexity: O(n + unique(n)) = 16.03 MB
    static func problem_387_firstUniqChar2(_ s: String) -> Int {
        class Pair {
            var count: Int
            let idx: Int
            
            init(count: Int = 1, idx: Int) {
                self.count = count
                self.idx = idx
            }
        }
        
        if s.isEmpty { return -1 }
        
        var dict = [Character:Pair]()
        var queue = [Character]()
        
        var idx = -1
        s.forEach { char in
            idx += 1
            
            if let pair = dict[char] {
                pair.count += 1
            } else {
                dict[char] = .init(idx: idx)
                queue.append(char)
            }
        }
        
        for char in queue {
            if let pair = dict[char], pair.count == 1 { return pair.idx }
        }
        
        return -1
    }
}
