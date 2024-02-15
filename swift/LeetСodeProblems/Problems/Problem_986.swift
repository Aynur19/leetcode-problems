//
//  Problem_986.swift
//  LeetСodeProblems
//
//  Created by Aynur Nasybullin on 15.02.2024.
//

//  986. Interval List Intersections
//  Medium
//  Topics: Array, Two Pointers

//  You are given two lists of closed intervals, firstList and secondList, where firstList[i] = [starti,
//  endi] and secondList[j] = [startj, endj]. Each list of intervals is pairwise disjoint and in sorted order.
//
//  Return the intersection of these two interval lists.
//
//  A closed interval [a, b] (with a <= b) denotes the set of real numbers x with a <= x <= b.
//
//  The intersection of two closed intervals is a set of real numbers that are either empty or represented as a closed interval.
//  For example, the intersection of [1, 3] and [2, 4] is [2, 3].

//  Example 1:
//  Input: 
//    firstList =   [[0,2],[5,10],[13,23],[24,25]],
//    secondList =  [[1,5],[8,12],[15,24],[25,26]]
//  Output: [[1,2],[5,5],[8,10],[15,23],[24,24],[25,25]]
//  
//  Example 2:
//  Input: firstList = [[1,3],[5,9]], secondList = []
//  Output: []
 
//  Constraints:
//  0 <= firstList.length, secondList.length <= 1000
//  firstList.length + secondList.length >= 1
//  0 <= starti < endi <= 10^9
//  endi < starti+1
//  0 <= startj < endj <= 10^9
//  endj < startj+1

extension Problems {
    // Approach: Two Pointers
    // Time complexity: O(n) = 99 ms
    // Space complexity: O(1) = 16.62 MB
    static func problem_986_intervalIntersection(_ firstList: [[Int]], _ secondList: [[Int]]) -> [[Int]] {
        guard !firstList.isEmpty else { return [] }
        guard !secondList.isEmpty else { return [] }
        
        var result = [[Int]]()
        var ptr1 = 0
        var ptr2 = 0
        
        while ptr1 < firstList.count, ptr2 < secondList.count {
            let left = max(firstList[ptr1][0], secondList[ptr2][0])
            let right = min(firstList[ptr1][1], secondList[ptr2][1])
            
            if left <= right {
                result.append([left, right])
            }

            firstList[ptr1][1] < secondList[ptr2][1] ? (ptr1 += 1) : (ptr2 += 1)
        }
        
        return result
    }
}
