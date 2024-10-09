// 921. Minimum Add to Make Parentheses Valid
// Solved
// Medium
// Topics: String, Stack, Greedy
// Companies

// A parentheses string is valid if and only if:
// - It is the empty string,
// - It can be written as AB (A concatenated with B), where A and B are valid strings, or
// - It can be written as (A), where A is a valid string.
//
// You are given a parentheses string s. In one move, you can insert a parenthesis at any position of the string.
// 
// For example, if s = "()))", you can insert an opening parenthesis to be "(()))" or a closing parenthesis to be "())))".
// 
// Return the minimum number of moves required to make s valid.

// Example 1:
// Input: s = "())"
// Output: 1
//
// Example 2:
// Input: s = "((("
// Output: 3

// Constraints:
// 1 <= s.length <= 1000
// s[i] is either '(' or ')'.


// Time complexity: O(n)
// Memory complexity: O(1)
class Solution {
    func minAddToMakeValid(_ s: String) -> Int {
        var opens = 0
        var closes = 0
        var result = 0

        for char in s {
            if char == ")" {
                if opens > 0 {
                    opens -= 1
                } else {
                    closes += 1
                }
            } else {
                result += closes
                closes = 0
                opens += 1
            }
        }

        return result + closes + opens
    }
}