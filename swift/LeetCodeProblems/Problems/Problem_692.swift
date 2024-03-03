//
//  Problem_692.swift
//  LeetСodeProblems
//
//  Created by Aynur Nasybullin on 13.02.2024.
//

//  692. Top K Frequent Words
//  Medium
//  Topics: Hash Table, String, Trie, Sorting, Heap (Priority Queue), Bucket Sort, Counting

//  Given an array of strings words and an integer k, return the k most frequent strings.
//
//  Return the answer sorted by the frequency from highest to lowest.
//  Sort the words with the same frequency by their lexicographical order.

//  Example 1:
//  Input: words = ["i","love","leetcode","i","love","coding"], k = 2
//  Output: ["i","love"]
//  Explanation: "i" and "love" are the two most frequent words.
//  Note that "i" comes before "love" due to a lower alphabetical order.
//
//  Example 2:
//  Input: words = ["the","day","is","sunny","the","the","the","sunny","is","is"], k = 4
//  Output: ["the","is","sunny","day"]
//  Explanation: "the", "is", "sunny" and "day" are the four most frequent words,
//      with the number of occurrence being 4, 3, 2 and 1 respectively.
 
//  Constraints:
//  1 <= words.length <= 500
//  1 <= words[i].length <= 10
//  words[i] consists of lowercase English letters.
//  k is in the range [1, The number of unique words[i]]
 
//  Follow-up: Could you solve it in O(n log(k)) time and O(n) extra space?

extension Problems {
    // Approach: Hash Table, Sorting
    // Time complexity: O(n log(k)) = 25 ms
    // Space complexity: O(n) = 16.40 MB
    static func problem_692_topKFrequent(_ words: [String], _ k: Int) -> [String] {
        class Pair {
            var count: Int
            let index: Int
            
            init(count: Int, index: Int) {
                self.count = count
                self.index = index
            }
        }
        
        var dict = [String:Pair]()
        for idx in words.indices {
            let word = words[idx]
            if let pair = dict[word] {
                pair.count += 1
            } else {
                dict[word] = .init(count: 1, index: idx)
            }
        }
        
        return Array(
            dict.sorted(by: {
                $0.value.count > $1.value.count ||
                $0.value.count == $1.value.count  && $0.key < $1.key
            })
                .prefix(k)
                .compactMap { $0.key }
        )
    }
}
