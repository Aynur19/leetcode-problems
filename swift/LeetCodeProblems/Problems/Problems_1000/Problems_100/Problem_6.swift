//
//  Problem_6.swift
//  LeetCodeProblems
//
//  Created by Aynur Nasybullin on 10.10.2023.
//

//  6. Zigzag Conversion
//  Medium
//  Topics: String

//  The string "PAYPALISHIRING" is written in a zigzag pattern on a given number of rows like this:
//  (you may want to display this pattern in a fixed font for better legibility)
//
//  P   A   H   N
//  A P L S I I G
//  Y   I   R
//  And then read line by line: "PAHNAPLSIIGYIR"
//
//  Write the code that will take a string and make this conversion given a number of rows:
//      string convert(string s, int numRows);
 
//  Example 1:
//  Input: s = "PAYPALISHIRING", numRows = 3
//  Output: "PAHNAPLSIIGYIR"
//
//  Example 2:
//  Input: s = "PAYPALISHIRING", numRows = 4
//  Output: "PINALSIGYAHRPI"
//  Explanation:
//  P     I    N
//  A   L S  I G
//  Y A   H R
//  P     I
//
//  Example 3:
//  Input: s = "A", numRows = 1
//  Output: "A"
 
// Constraints:
// 1 <= s.length <= 1000
// s consists of English letters (lower-case and upper-case), ',' and '.'.
// 1 <= numRows <= 1000

extension Problems {
    // MARK: LeetCode Problem 6. Zigzag Conversion
    // Link: https://leetcode.com/problems/zigzag-conversion/
    // Approach: Array, String
    // Time complexity: O(n) => 46 ms
    // Space complexity: O(1) => 14.22 MB (for Swift O(n))
    func problem_6_convert(_ s: String, _ numRows: Int) -> String {
        guard s.count > numRows && numRows > 1 else { return s }
        
        let chars = Array(s)
        var result = [Character]()
        
        let minInterval = 2
        let maxInterval = numRows * 2 - 2
        
        func setLine(_ result: inout [Character], _ idx: Int) {
            var idx = idx
            while idx < chars.count {
                result.append(chars[idx])
                idx += maxInterval
            }
        }
        
        setLine(&result, 0)
        for index in 1..<(numRows - 1) {
            var idx = index
            
            while idx < chars.count {
                result.append(chars[idx])
                idx += maxInterval - index * minInterval
                
                if idx < chars.count {
                    result.append(chars[idx])
                    idx += index * minInterval
                }
            }
        }
        setLine(&result, numRows - 1)
        
        return String(result)
    }
    
    
    // MARK: LeetCode Problem 6. Zigzag Conversion
    // Link: https://leetcode.com/problems/zigzag-conversion/
    // Approach: Array, String
    // Time complexity: O(n) => 27 ms
    // Space complexity: O(1) => 16.51 MB
    func problem_6_convert_2(_ s: String, _ numRows: Int) -> String {
        guard s.count > numRows && numRows > 1 else { return s }
        
        var chars = Array(repeating: [Character](), count: numRows)
        var idx = 0
        var iter = s.makeIterator()
        
        while true {
            while idx < numRows {
                if let char = iter.next() {
                    chars[idx].append(char)
                } else {
                    return chars.compactMap { String($0) }.joined()
                }
                
                idx += 1
            }
            
            idx -= 2
            while idx > 0 {
                if let char = iter.next() {
                    chars[idx].append(char)
                } else {
                    return chars.compactMap { String($0) }.joined()
                }
                
                idx -= 1
            }
        }
    }
}


extension ProblemsTestCases {
    static func testsData_6() -> [(s: String, numRows: Int, expected: String)] {
        var testsData = [(s: String, numRows: Int, expected: String)]()
        
        testsData.append((s: "PAYPALISHIRING", numRows: 3, expected: "PAHNAPLSIIGYIR"))
        testsData.append((s: "PAYPALISHIRING", numRows: 4, expected: "PINALSIGYAHRPI"))
        testsData.append((s: "A", numRows: 1, expected: "A"))
        
        return testsData
    }
}
