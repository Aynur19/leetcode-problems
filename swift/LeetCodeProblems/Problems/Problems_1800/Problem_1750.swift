//
//  Problem_1750.swift
//  LeetCodeProblems
//
//  Created by Aynur Nasybullin on 15.03.2024.
//

//  1750. Minimum Length of String After Deleting Similar Ends
//  Medium
//  Topics: Two Pointers, String

//  Given a string s consisting only of characters 'a', 'b', and 'c'. You are asked to apply the following algorithm 
//  on the string any number of times:
//  1. Pick a non-empty prefix from the string s where all the characters in the prefix are equal.
//  2. Pick a non-empty suffix from the string s where all the characters in this suffix are equal.
//  3. The prefix and the suffix should not intersect at any index.
//  4. The characters from the prefix and suffix must be the same.
//  5. Delete both the prefix and the suffix.
//
//  Return the minimum length of s after performing the above operation any number of times (possibly zero times).

//  Example 1:
//  Input: s = "ca"
//  Output: 2
//  Explanation: You can't remove any characters, so the string stays as is.
//
//  Example 2:
//  Input: s = "cabaabac"
//  Output: 0
//  Explanation: An optimal sequence of operations is:
//  - Take prefix = "c" and suffix = "c" and remove them, s = "abaaba".
//  - Take prefix = "a" and suffix = "a" and remove them, s = "baab".
//  - Take prefix = "b" and suffix = "b" and remove them, s = "aa".
//  - Take prefix = "a" and suffix = "a" and remove them, s = "".
//
//  Example 3:
//  Input: s = "aabccabba"
//  Output: 3
//  Explanation: An optimal sequence of operations is:
//  - Take prefix = "aa" and suffix = "a" and remove them, s = "bccabb".
//  - Take prefix = "b" and suffix = "bb" and remove them, s = "cca".

//  Constraints:
//  1 <= s.length <= 10^5
//  s only consists of characters 'a', 'b', and 'c'.

extension Problems {
    // Approach: Hash Table
    // Time complexity: O(n) => 56 ms
    // Space complexity: O(n) => 19.1 MB
    func problem_1750_minimumLength(_ s: String) -> Int {
        let n = s.count
        guard n > 1 else { return n }
        
        let chars = Array(s)
        var left = -1
        var right = n
        
        left += 1
        right -= 1
        while true {
            if left == right { return chars[left - 1] == chars[right] ? 0 : 1 }
            if left > right { return chars[left - 1] == chars[left] ? 0 : 1 }
            
            while left < right {
                if chars[left] == chars[right] {
                    left += 1
                } else { break }
            }
            
            let prevLeft = left - 1 < 0 ? 0 : left - 1
            while left < right {
                if chars[right] == chars[prevLeft] {
                    right -= 1
                } else { break }
            }
            
            if chars[left] != chars[right] { return right - left + 1 }
        }
    }
}


extension ProblemsTestCases {
    static func testsData_1750() -> [(s: String, expected: Int)] {
        var testsData = [(s: String, expected: Int)]()
        
        testsData.append((s: "ca", expected: 2))
        testsData.append((s: "cabaabac", expected: 0))
        testsData.append((s: "aabccabba", expected: 3))
        testsData.append((s: "bbbbbbbbbbbbbbbbbbbbbbbbbbbabbbbbbbbbbbbbbbccbcbcbccbbabbb", expected: 1))
        testsData.append((s: "abbbbbbbbbbbbbbbbbbba", expected: 0))
        testsData.append((s: "aabbbbbbbbbbbbbbaaaaaaacccccbcbcccbbbccbbbcbcbccacbccccbbabacbaccaccbbcabbbbaaaaaaaaaaaaaaaaaa", expected: 36))
        
        return testsData
    }
}
