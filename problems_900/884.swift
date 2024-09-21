// 884. Uncommon Words from Two Sentences
// Solved
// Easy
// Topics: Hash Table, String, Counting
// Companies

// A sentence is a string of single-space separated words where each word consists only of lowercase letters.
// 
// A word is uncommon if it appears exactly once in one of the sentences, and does not appear in the other sentence.
// 
// Given two sentences s1 and s2, return a list of all the uncommon words. You may return the answer in any order.

// Example 1:
// Input: s1 = "this apple is sweet", s2 = "this apple is sour"
// Output: ["sweet","sour"]
// Explanation:
//      The word "sweet" appears only in s1, while the word "sour" appears only in s2.
// 
// Example 2:
// Input: s1 = "apple apple", s2 = "banana"
// Output: ["banana"]

// Constraints:
// 1 <= s1.length, s2.length <= 200
// s1 and s2 consist of lowercase English letters and spaces.
// s1 and s2 do not have leading or trailing spaces.
// All the words in s1 and s2 are separated by a single space.


// Time complexity: O(n + m)
// Memory complexity: O(n + m)
class Solution {
    func uncommonFromSentences(_ s1: String, _ s2: String) -> [String] {
        var dict = s1.split(separator: " ").reduce(into: [:]) { result, word in
            result[word, default: 0] += 1
        }

        for word in s2.split(separator: " ") {
            dict[word, default: 0] += 1
        }

        return dict
            .filter { $0.value == 1 }
            .map { String($0.key) }
    }
}