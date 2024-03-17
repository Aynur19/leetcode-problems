//
//  Problem_57.swift
//  LeetCodeProblems
//
//  Created by Aynur Nasybullin on 17.03.2024.
//

//  57. Insert Interval
//  Medium
//  Topics: Array

//  You are given an array of non-overlapping intervals intervals where intervals[i] = [starti, endi] 
//  represent the start and the end of the ith interval and intervals is sorted in ascending order by starti.
//  You are also given an interval newInterval = [start, end] that represents the start and end of another interval.
//
//  Insert newInterval into intervals such that intervals is still sorted in ascending order by starti and intervals 
//  still does not have any overlapping intervals (merge overlapping intervals if necessary).
//
//  Return intervals after the insertion.
//  
//  Note that you don't need to modify intervals in-place. You can make a new array and return it.

//  Example 1:
//  Input: intervals = [[1,3],[6,9]], newInterval = [2,5]
//  Output: [[1,5],[6,9]]
//
//
//  Example 2:
//  Input: intervals = [[1,2],[3,5],[6,7],[8,10],[12,16]], newInterval = [4,8]
//  Output: [[1,2],[3,10],[12,16]]
//  Explanation: Because the new interval [4,8] overlaps with [3,5],[6,7],[8,10].

//  Constraints:
//  0 <= intervals.length <= 10^4
//  intervals[i].length == 2
//  0 <= starti <= endi <= 10^5
//  intervals is sorted by starti in ascending order.
//  newInterval.length == 2
//  0 <= start <= end <= 10^5

extension Problems {
    // MARK: LeetCode Problem 57. Insert Interval
    // Link: https://leetcode.com/problems/insert-interval/
    // Approach: Array
    // Time complexity: O(n) => 31 ms
    // Space complexity: O(1) => 16.49 MB
    public func problem_57_insert(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]] {
        guard intervals.count > 0 else { return [newInterval] }
        
        func mergeIntervals(_ interval1: [Int], _ interval2: [Int]) -> [Int] {
            return [min(interval1[0], interval2[0]), max(interval1[1], interval2[1])]
        }
        
        var result = [newInterval]
        var lastIdx = 0
        var count = 0
        
        for interval in intervals {
            if interval[1] < result[lastIdx][0] {
                result.append(newInterval)
                result[lastIdx] = interval
                lastIdx += 1
            } else if interval[0] > result[lastIdx][1] {
                result.append(contentsOf: intervals[count...(intervals.count - 1)].compactMap({ $0 }))
                return result
            } else {
                result[lastIdx] = mergeIntervals(result[lastIdx], interval)
            }
            
            count += 1
        }
        
        return result
    }
}

extension ProblemsTestCases {
    static func testsData_57() -> [(intervals: [[Int]], newInterval: [Int], expected: [[Int]])] {
        var testsData = [(intervals: [[Int]], newInterval: [Int], expected: [[Int]])]()
        
        testsData.append((
            intervals: [[1, 3], [6, 9]],
            newInterval: [2, 5],
            expected: [[1, 5], [6, 9]]
        ))
        testsData.append((
            intervals: [[1, 2], [3, 5], [6, 7], [8, 10], [12, 16]],
            newInterval: [4,8],
            expected: [[1, 2], [3, 10], [12, 16]]
        ))
        
        return testsData
    }
}
