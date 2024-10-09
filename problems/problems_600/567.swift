// 567. Permutation in String
// Solved
// Medium
// Topics: Hash Table, Two Pointers, String, Sliding Window
// Companies

// Given two strings s1 and s2, return true if s2 contains a permutation of s1, or false otherwise.
// 
// In other words, return true if one of s1's permutations is the substring of s2.

// Example 1:
// Input: s1 = "ab", s2 = "eidbaooo"
// Output: true
// Explanation: s2 contains one permutation of s1 ("ba").
//
// Example 2:
// Input: s1 = "ab", s2 = "eidboaoo"
// Output: false

// Constraints:
// 1 <= s1.length, s2.length <= 104
// s1 and s2 consist of lowercase English letters.


// Hints:
// 1. Obviously, brute force will result in TLE. Think of something else.
// 2. How will you check whether one string is a permutation of another string?
// 3. One way is to sort the string and then compare. But, Is there a better way?
// 4. If one string is a permutation of another string then they must have one common metric. What is that?
// 5. Both strings must have same character frequencies, if one is permutation of another. Which data structure should 
//    be used to store frequencies?
// 6. What about hash table? An array of size 26?


// Time complexity: O(n * k)
// Memory complexity: O(k)
class Solution {
    func checkInclusion(_ s1: String, _ s2: String) -> Bool {
        let n1 = s1.count
        let n2 = s2.count
        guard n2 >= n1 else { return false }
        
        let dict = s1.reduce(into: [Character:Int]()) { result, char in
            result[char, default: 0] += 1
        }

        let chars = Array(s2)
        var dict2 = [Character:Int]()

        for idx in 0..<n1 {
            dict2[chars[idx], default: 0] += 1
        }

        if dict == dict2 { return true }

        var (left, right) = (0, n1)
        while right < chars.count {
            dict2[chars[right], default: 0] += 1

            if let count = dict2[chars[left]] {
                dict2[chars[left]] = count > 1 ? count - 1 : nil
            }

            if dict == dict2 { return true }
            right += 1
            left += 1
        }

        return false
    }
}