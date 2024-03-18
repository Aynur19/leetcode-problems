//
//  Problem_452.swift
//  LeetCodeProblems
//
//  Created by Aynur Nasybullin on 18.03.2024.
//

//  452. Minimum Number of Arrows to Burst Balloons
//  Medium
//  Topics: Array, Greedy, Sorting

//  There are some spherical balloons taped onto a flat wall that represents the XY-plane. The balloons are 
//  represented as a 2D integer array points where points[i] = [xstart, xend] denotes a balloon whose horizontal 
//  diameter stretches between xstart and xend. You do not know the exact y-coordinates of the balloons.
//  
//  Arrows can be shot up directly vertically (in the positive y-direction) from different points along the x-axis. 
//  A balloon with xstart and xend is burst by an arrow shot at x if xstart <= x <= xend. There is no limit to
//  the number of arrows that can be shot. A shot arrow keeps traveling up infinitely, bursting any balloons in its path.
//  
//  Given the array points, return the minimum number of arrows that must be shot to burst all balloons.

//  Example 1:
//  Input: points = [[10,16],[2,8],[1,6],[7,12]]
//  Output: 2
//  Explanation: The balloons can be burst by 2 arrows:
//  - Shoot an arrow at x = 6, bursting the balloons [2,8] and [1,6].
//  - Shoot an arrow at x = 11, bursting the balloons [10,16] and [7,12].
//
//  Example 2:
//  Input: points = [[1,2],[3,4],[5,6],[7,8]]
//  Output: 4
//  Explanation: One arrow needs to be shot for each balloon for a total of 4 arrows.
//
//  Example 3:
//  Input: points = [[1,2],[2,3],[3,4],[4,5]]
//  Output: 2
//  Explanation: The balloons can be burst by 2 arrows:
//  - Shoot an arrow at x = 2, bursting the balloons [1,2] and [2,3].
//  - Shoot an arrow at x = 4, bursting the balloons [3,4] and [4,5].

//  Constraints:
//  1 <= points.length <= 10^5
//  points[i].length == 2
//  -2^31 <= xstart < xend <= 2^31 - 1

extension Problems {
    // MARK: LeetCode Problem 452. Minimum Number of Arrows to Burst Balloons
    // Link: https://leetcode.com/problems/minimum-number-of-arrows-to-burst-balloons/
    // Approach: Array, Greedy, Sorting
    // Time complexity: O(n log n) => 746 ms
    // Space complexity: O(n) => 25.16 MB
    public func problem_452_findMinArrowShots(_ points: [[Int]]) -> Int {
        let sortedPoints = points.sorted(by: { $0[0] < $1[0] && $0[1] >= $1[1] || $0[0] < $1[0] })
        var minIntervals = [sortedPoints[0]]
        var last = sortedPoints[0]
        
        for point in sortedPoints {
            if last[1] >= point[0] {
                last[0] = max(last[0], point[0])
                last[1] = min(last[1], point[1])
                minIntervals[minIntervals.count - 1] = last
            } else {
                last = point
                minIntervals.append(point)
            }
        }
        
        return minIntervals.count
    }
}


extension ProblemsTestCases {
    static func testsData_452() -> [(points: [[Int]], expected: Int)] {
        var testsData = [(points: [[Int]], expected: Int)]()
        
        testsData.append((points: [[10, 16], [2, 8], [1, 6], [7, 12]], expected: 2))
        testsData.append((points: [[1, 2], [3, 4], [5, 6], [7, 8]], expected: 4))
        testsData.append((points: [[1, 2], [2, 3], [3, 4], [4, 5]], expected: 2))
        
        return testsData
    }
}
