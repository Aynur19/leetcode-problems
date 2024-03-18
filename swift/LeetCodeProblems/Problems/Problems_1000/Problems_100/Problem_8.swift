//
//  Problem_8.swift
//  LeetCodeProblems
//
//  Created by Aynur Nasybullin on 11.10.2023.
//

//  8. String to Integer (atoi)
//  Medium
//  Topics: String

//  Implement the myAtoi(string s) function, which converts a string to a 32-bit signed integer (similar to C/C++'s atoi function).
//
//  The algorithm for myAtoi(string s) is as follows:
//  1. Read in and ignore any leading whitespace.
//  2. Check if the next character (if not already at the end of the string) is '-' or '+'.
//     Read this character in if it is either. This determines if the final result is negative or positive respectively.
//     Assume the result is positive if neither is present.
//  3. Read in next the characters until the next non-digit character or the end of the input is reached. The rest of
//     the string is ignored.
//  4. Convert these digits into an integer (i.e. "123" -> 123, "0032" -> 32). If no digits were read, then the integer is 0.
//     Change the sign as necessary (from step 2).
//  5. If the integer is out of the 32-bit signed integer range [-231, 231 - 1], then clamp the integer so that
//     it remains in the range. Specifically, integers less than -231 should be clamped to -231, and integers greater
//     than 2^31 - 1 should be clamped to 2^31 - 1.
//  6. Return the integer as the final result.
//
//  Note:
//     Only the space character ' ' is considered a whitespace character.
//     Do not ignore any characters other than the leading whitespace or the rest of the string after the digits.

//  Example 1:
//  Input: s = "42"
//  Output: 42
//  Explanation: The underlined characters are what is read in, the caret is the current reader position.
//    Step 1: "42" (no characters read because there is no leading whitespace)
//             ^
//    Step 2: "42" (no characters read because there is neither a '-' nor '+')
//              ^
//    Step 3: "42" ("42" is read in)
//               ^
//  The parsed integer is 42.
//  Since 42 is in the range [-231, 231 - 1], the final result is 42.
//
//  Example 2:
//  Input: s = "   -42"
//  Output: -42
//  Explanation:
//    Step 1: "   -42" (leading whitespace is read and ignored)
//                ^
//    Step 2: "   -42" ('-' is read, so the result should be negative)
//                 ^
//    Step 3: "   -42" ("42" is read in)
//                   ^
//  The parsed integer is -42.
//  Since -42 is in the range [-231, 231 - 1], the final result is -42.
//
//  Example 3:
//  Input: s = "4193 with words"
//  Output: 4193
//  Explanation:
//    Step 1: "4193 with words" (no characters read because there is no leading whitespace)
//             ^
//    Step 2: "4193 with words" (no characters read because there is neither a '-' nor '+')
//             ^
//    Step 3: "4193 with words" ("4193" is read in; reading stops because the next character is a non-digit)
//                 ^
//  The parsed integer is 4193.
//  Since 4193 is in the range [-231, 231 - 1], the final result is 4193.

// Constraints:
// 0 <= s.length <= 200
// s consists of English letters (lower-case and upper-case), digits (0-9), ' ', '+', '-', and '.'.

extension Problems {
    // MARK: LeetCode Problem 8. String to Integer (atoi)
    // Link: https://leetcode.com/problems/string-to-integer-atoi/
    // Approach: String
    // Time complexity: O(n) => 5 ms
    // Space complexity: O(1) => 13.98 MB
    public func problem_8_myAtoi(_ s: String) -> Int {
        var count = 0
        var isNegative = false
        var result = 0
        let max = Int(Int32.max)
        let min = Int(Int32.min)

        for char in s {
            if char.isNumber {
                result = result * 10 + Int(String(char))!
                if result > max || result < min { break }
                count += 1
                continue
            }
            
            if count > 0 { break }
            if char == " " { continue }
            
            if char == "+" { 
                count += 1 
            } else if char == "-" {
                isNegative = true
                count += 1
            } else { break }
        }

        if isNegative { result = -result }

        if result < Int32.min { return Int(Int32.min) }
        if result > Int32.max { return Int(Int32.max) }
        return result
    }
}


extension ProblemsTestCases {
    static func testsData_8() -> [(s: String, expected: Int)] {
        var testsData = [(s: String, expected: Int)]()
        
        testsData.append((s: "42", expected: 42))
        testsData.append((s: "   -42", expected: -42))
        testsData.append((s: "4193 with words", expected: 4193))
        testsData.append((s: "00000-42a1234", expected: 0))
        testsData.append((s: "words and 987", expected: 0))
        testsData.append((s: "20000000000000000000", expected: Int(Int32.max)))
        
        return testsData
    }
}
