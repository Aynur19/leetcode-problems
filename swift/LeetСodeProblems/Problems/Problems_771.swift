//
//  Problems_771.swift
//  LeetСodeProblems
//
//  Created by Aynur Nasybullin on 14.02.2024.
//

//  771. Jewels and Stones
//  Easy
//  Topics: Hash Table, String

//  You're given strings jewels representing the types of stones that are jewels, and stones representing the stones you have.
//  Each character in stones is a type of stone you have. You want to know how many of the stones you have are also jewels.
//
//  Letters are case sensitive, so "a" is considered a different type of stone from "A".

//  Example 1:
//  Input: jewels = "aA", stones = "aAAbbbb"
//  Output: 3
//
//  Example 2:
//  Input: jewels = "z", stones = "ZZ"
//  Output: 0
 
//  Constraints:
//  1 <= jewels.length, stones.length <= 50
//  jewels and stones consist of only English letters.
//  All the characters of jewels are unique.

extension Problems {
    // Approach: Set, Counting
    // Time complexity: O(n) = 0 ms
    // Space complexity: O(n) = 15.99 MB
    static func problems_771_numJewelsInStones(_ jewels: String, _ stones: String) -> Int {
        let set = Set(jewels)
        
        return stones.reduce(0) { partialResult, stone in
            set.contains(stone) ? partialResult + 1 : partialResult
        }
    }
}
