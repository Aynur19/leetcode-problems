// 2707. Extra Characters in a String
// Solved
// Medium
// Topics
// Companies
// Hint

// You are given a 0-indexed string s and a dictionary of words dictionary. You have to break s into one or more 
// non-overlapping substrings such that each substring is present in dictionary. There may be some extra characters in 
// s which are not present in any of the substrings.
// 
// Return the minimum number of extra characters left over if you break up s optimally.

// Example 1:
// Input: s = "leetscode", dictionary = ["leet","code","leetcode"]
// Output: 1
// Explanation: We can break s in two substrings: "leet" from index 0 to 3 and "code" from index 5 to 8. 
//      There is only 1 unused character (at index 4), so we return 1.
// 
// Example 2:
// Input: s = "sayhelloworld", dictionary = ["hello","world"]
// Output: 3
// Explanation: We can break s in two substrings: "hello" from index 3 to 7 and "world" from index 8 to 12. 
//      The characters at indices 0, 1, 2 are not used in any substring and thus are considered as extra characters. 
//      Hence, we return 3.

// Constraints:
// 1 <= s.length <= 50
// 1 <= dictionary.length <= 50
// 1 <= dictionary[i].length <= 50
// dictionary[i] and s consists of only lowercase English letters
// dictionary contains distinct words


// Help: https://www.youtube.com/watch?v=ONstwO1cD7c&ab_channel=NeetCodeIO
// Time complexity: O(n^2)
// Memory complexity: O(n)
class Solution {
    func minExtraChar(_ s: String, _ dictionary: [String]) -> Int {
        let n = s.count
        let trie = Trie(words: dictionary).root
        var dp = [n:0]
        let chars = Array(s)

        func dfs(idx: Int) -> Int {
            if let count = dp[idx] {
                return count
            }
            
            var result = 1 + dfs(idx: idx + 1)
            var current = trie
            
            for i in idx..<n {
                if !current.children.keys.contains(chars[i]) {
                    break
                }
                
                current = current.children[chars[i]]!
                
                if current.isWord {
                    result = min(result, dfs(idx: i + 1))
                }
            }
            
            dp[idx] = result
            
            return result
        }

        return dfs(idx: 0)
    }
}

class TrieNode {
    var children = [Character:TrieNode]()
    var isWord = false
}

class Trie {
    var root = TrieNode()

    init(words: [String]) {
        for word in words {
            var current = root
            
            for char in word {
                if !current.children.keys.contains(char) {
                    current.children[char] = TrieNode()
                } 
                current = current.children[char]!
            }
            
            current.isWord = true
        }        
        
    }
}