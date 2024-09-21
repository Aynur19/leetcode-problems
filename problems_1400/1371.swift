// 1371. Find the Longest Substring Containing Vowels in Even Counts
// Solved
// Medium
// Topics
// Companies

// Given the string s, return the size of the longest substring containing each vowel an even number of times. 
// That is, 'a', 'e', 'i', 'o', and 'u' must appear an even number of times.

// Example 1:
// Input: s = "eleetminicoworoep"
// Output: 13
// Explanation: The longest substring is "leetminicowor" which contains two each of the vowels: e, i 
//      and o and zero of the vowels: a and u.
//
// Example 2:
// Input: s = "leetcodeisgreat"
// Output: 5
// Explanation: The longest substring is "leetc" which contains two e's.
//
// Example 3:
// Input: s = "bcbcbc"
// Output: 6
// Explanation: In this case, the given string "bcbcbc" is the longest because all vowels: a, e, i, o 
//      and u appear zero times.

// Constraints:
// 1 <= s.length <= 5 x 10^5
// s contains only lowercase English letters.


// Time complexity: O(n)
// Memory complexity: O(1)
class Solution {
    func findTheLongestSubstring(_ s: String) -> Int {
        var pref = 1
        var charMap: [Int] = Array(repeating: 0, count: 128)

        for char in "aeiou" {
            charMap[Int(char.asciiValue!)] = pref
            pref <<= 1
        }
        
        pref = 0
        var hm = Array(repeating: -1, count: charMap.count)
        var idx = -1
        var result = 0

        for char in s {
            idx += 1
            pref ^= charMap[Int(char.asciiValue!)] 

            if hm[pref] == -1, pref != 0 {
                hm[pref] = idx
            }

            result = max(result, idx - hm[pref])
        }

        return result
    }
}