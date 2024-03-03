//
//  Problem_658.swift
//  LeetСodeProblems
//
//  Created by Aynur Nasybullin on 08.02.2024.
//

//  658. Find K Closest Elements
//  Medium
//  Topics: Array, Two Pointers, Binary Search, Sliding Window, Sorting, Heap (Priority Queue)

//  Given a sorted integer array arr, two integers k and x, return the k closest integers to x in the array.
//  The result should also be sorted in ascending order.
//
//  An integer a is closer to x than an integer b if:
//      |a - x| < |b - x|, or
//      |a - x| == |b - x| and a < b
 
//  Example 1:
//  Input: arr = [1,2,3,4,5], k = 4, x = 3
//  Output: [1,2,3,4]
//
//  Example 2:
//  Input: arr = [1,2,3,4,5], k = 4, x = -1
//  Output: [1,2,3,4]
 
//  Constraints:
//  1 <= k <= arr.length
//  1 <= arr.length <= 10^4
//  arr is sorted in ascending order.
//  -10^4 <= arr[i], x <= 10^4

extension Problems {
    // Approach: Binary Search, Two pointer
    // Time complexity: O(log (n) + 2k) = 114 ms
    // Space complexity: O(1) = 16.49 MB
    static func problem_658_findClosestElements(_ arr: [Int], _ k: Int, _ x: Int) -> [Int] {
        guard arr.count > 1 else { return arr }
        guard x > arr[0] else { return arr.dropLast(arr.count - k) }
        guard x < arr[arr.count - 1] else { return arr.suffix(k) }
        
        guard let idx = arr.lowerBound(where: { $0 > x }) else { return arr.suffix(k) }
        
        var left = 0
        var right = 0
        let last = arr.count - 1
        
        if arr[idx - 1] == x {
            left = max(idx - k, 0)
            right = min(left + 2 * (k - 1), last)
        } else {
            left = max(idx - k, 0)
            right = min(left + 2 * k, last)
        }
        
        var leftDiff = abs(arr[left] - x)
        var rightDiff = abs(arr[right] - x)
        while right - left + 1 > k {
            if leftDiff > rightDiff {
                left += 1
                leftDiff = abs(arr[left] - x)
            } else {
                right -= 1
                rightDiff = abs(arr[right] - x)
            }
        }
        
        return Array(arr[left...right])
    }
}
