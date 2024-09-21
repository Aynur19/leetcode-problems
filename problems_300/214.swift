// 214. Shortest Palindrome
// Solved
// Hard
// Topics: String, Rolling Hash, String Matching, Hash Function
// Companies

// You are given a string s. You can convert s to a palindrome by adding characters in front of it.
// 
// Return the shortest palindrome you can find by performing this transformation.
// 
// Example 1:
// Input: s = "aacecaaa"
// Output: "aaacecaaa"
//
// Example 2:
// Input: s = "abcd"
// Output: "dcbabcd"
// 
// Constraints:
// 0 <= s.length <= 5 * 10^4
// s consists of lowercase English letters only.


// Time complexity: O((n * ((n / 2)) + k)
// Memory complexity: O(n + k)
import Collections

class Solution {
    func shortestPalindrome(_ s: String) -> String {
        var deque = Deque(s)
        let n = deque.count

        guard n > 1 else { return s }
        guard n > 2 else {
            return deque[0] == deque[1] ? s : "\(deque[1])\(s)"
        }

        let l = n / 2 - 1
        let r = n / 2
        let m = (n + 1) / 2 - 1

        var right = max(
            getNextRight(deque: deque, left: l, right: r),
            getNextRight(deque: deque, left: m, right: m)
        )

        if right == deque.count { return s }

        return String(deque[right..<n].reversed()) + s
    }

    func getNextRight(deque: Deque<Character>, left: Int, right: Int) -> Int {
        var left = left
        var right = right

        while left > -1 {
            var l = left
            var r = right

            while l > -1 {
                if deque[l] == deque[r] {
                    l -= 1
                    r += 1
                } else {
                    left -= 1
                    right -= 1
                    break
                }
            } 

            if l == -1 {
                return r
            }
        }

        return right
    }
}