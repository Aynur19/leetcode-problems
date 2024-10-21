// 1593. Split a String Into the Max Number of Unique Substrings
// Solved
// Medium
// Topics: Hash Table, String, Backtracking
// Companies
// 
// Desciption:
//     Given a string s, return the maximum number of unique substrings that the given string can be split into.
// 
//     You can split string s into any list of non-empty substrings, where the concatenation of the substrings forms 
//     the original string. However, you must split the substrings such that all of them are unique.
// 
//     A substring is a contiguous sequence of characters within a string.
// 
// Example 1:
//     Input: s = "ababccc"
//     Output: 5
//     Explanation: One way to split maximally is ['a', 'b', 'ab', 'c', 'cc']. 
//         Splitting like ['a', 'b', 'a', 'b', 'c', 'cc'] is not valid as you have 'a' and 'b' multiple times.
// 
// Example 2:
//     Input: s = "aba"
//     Output: 2
//     Explanation: One way to split maximally is ['a', 'ba'].
// 
// Example 3:
//     Input: s = "aa"
//     Output: 1
//     Explanation: It is impossible to split the string any further.
// 
// Constraints:
//     1 <= s.length <= 16
//     s contains only lower case English letters.


// Help: https://algo.monster/liteproblems/1593
// Time complexity: O(n * 2^n)
// Memory complexity: O(2^n)
class Solution {
    func maxUniqueSplit(_ s: String) -> Int {
        guard s.count > 1 else { return 1 }
        var chars = Array(s)
        var result = 0
        var substrings = Set<String>()
        
        func backtrack(start: Int, count: Int) {
            if start >= chars.count {
                return result = max(result, count)
            }
            
            for end in (start + 1)...chars.count {
                let substring = String(chars[start..<end])
                if !substrings.contains(substring) {
                    _ = substrings.insert(substring)
                    
                    backtrack(start: end, count: count + 1)
                    _ = substrings.remove(substring)
                }
            }
        }

        backtrack(start: 0, count: 0)
        return result
    }
}