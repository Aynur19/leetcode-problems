//
//  Problem_2485.swift
//  LeetCodeProblems
//
//  Created by Aynur Nasybullin on 13.03.2024.
//

//  2485. Find the Pivot Integer
//  Easy
//  Topics:

//  Given a positive integer n, find the pivot integer x such that:
//  
//  The sum of all elements between 1 and x inclusively equals the sum of all elements between x and n inclusively.
//  Return the pivot integer x. If no such integer exists, return -1. It is guaranteed that there will be at most one pivot index for the given input.

//  Example 1:
//  Input: n = 8
//  Output: 6
//  Explanation: 6 is the pivot integer since: 1 + 2 + 3 + 4 + 5 + 6 = 6 + 7 + 8 = 21.
//
//  Example 2:
//  Input: n = 1
//  Output: 1
//  Explanation: 1 is the pivot integer since: 1 = 1.
//  
//  Example 3:
//  Input: n = 4
//  Output: -1
//  Explanation: It can be proved that no such integer exist.

//  Constraints:
//  1 <= n <= 1000

public final class Math {
    static func arithProgressionSum(_ start: Int, n: Int, diff: Int) -> Int {
        let last = start + (n - 1) * diff
        let sum = n * (start + last) / 2
        return sum
    }
    
    static func arithProgressionSum(_ start: Int, startIdx: Int, endIdx: Int, diff: Int) -> Int {
        return (2 * start + diff * (endIdx - startIdx)) * (endIdx - startIdx + 1) / 2
    }
}

extension Problems {
    // Approach: Math
    // Time complexity: O(n^(0.5)) => 5 ms
    // Space complexity: O(1) =>  MB
    func problem_2485_pivotInteger(_ n: Int) -> Int {
        guard n > 1 else { return 1 }
        
        var start = n / 2
        var leftSum = Math.arithProgressionSum(1, n: start, diff: 1)
        var rightSum = Math.arithProgressionSum(start, startIdx: start, endIdx: n, diff: 1)
        
        while rightSum > leftSum {
            rightSum -= start
            start += 1
            leftSum += start
        }
        
        return rightSum == leftSum ? start : -1
    }
}

extension ProblemsTestCases {
    static func testsData_2485() -> [(n: Int, expected: Int)] {
        var testsData = [(n: Int, expected: Int)]()
        
        testsData.append((n: 8, expected: 6))
        testsData.append((n: 1, expected: 1))
        testsData.append((n: 4, expected: -1))
        
        return testsData
    }
}
