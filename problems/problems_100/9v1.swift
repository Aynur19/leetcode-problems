// 9. Palindrome Number
// Solved
// Easy
// Topics: Math
// Companies

// Given an integer x, return true if x is a palindrome, and false otherwise.

// Example 1:
// Input: x = 121
// Output: true
// Explanation: 121 reads as 121 from left to right and from right to left.
//
// Example 2:
// Input: x = -121
// Output: false
// Explanation: From left to right, it reads -121. From right to left, it becomes 121-. Therefore it is not a palindrome.
//
// Example 3:
// Input: x = 10
// Output: false
// Explanation: Reads 01 from right to left. Therefore it is not a palindrome.

// Constraints:
// -2^31 <= x <= 2^(31 - 1)

// Follow up: Could you solve it without converting the integer to a string?


// Time complexity: O(n / 2)
// Memory complexity: O(n)
class Solution {
    func isPalindrome(_ x: Int) -> Bool {
        guard x > -1 else { return false }

        let chars = Array(String(x))
        let n = chars.count

        for i in 0...((n - 1) / 2) {
            if chars[i] != chars[n - 1 - i] { return false }
        }
        
        return true
    }
}