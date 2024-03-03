//
//  Problem_849.swift
//  LeetСodeProblems
//
//  Created by Aynur Nasybullin on 14.02.2024.
//

//  849. Maximize Distance to Closest Person
//  Medium
//  Topics: Yes, No

//  You are given an array representing a row of seats where seats[i] = 1 represents a person sitting in the ith seat,
//  and seats[i] = 0 represents that the ith seat is empty (0-indexed).
//
//  There is at least one empty seat, and at least one person sitting.
//
//  Alex wants to sit in the seat such that the distance between him and the closest person to him is maximized.
//
//  Return that maximum distance to the closest person.

//  Example 1:
//  Input: seats = [1,0,0,0,1,0,1]
//  Output: 2
//  Explanation:
//  - If Alex sits in the second open seat (i.e. seats[2]), then the closest person has distance 2.
//  - If Alex sits in any other open seat, the closest person has distance 1.
//  - Thus, the maximum distance to the closest person is 2.
//
//  Example 2:
//  Input: seats = [1,0,0,0]
//  Output: 3
//  Explanation:
//  - If Alex sits in the last seat (i.e. seats[3]), the closest person is 3 seats away.
//  - This is the maximum distance possible, so the answer is 3.
//
//  Example 3:
//  Input: seats = [0,1]
//  Output: 1
 
//  Constraints:
//  2 <= seats.length <= 2 * 10^4
//  seats[i] is 0 or 1.
//  At least one seat is empty.
//  At least one seat is occupied.

extension Problems {
    // Approach: Two Pointers
    // Time complexity: O(n) = 29 ms
    // Space complexity: O(1) = 15.90 MB
    static func problem_849_maxDistToClosest(_ seats: [Int]) -> Int {
        let n = seats.count
        var maxDist = 1
        guard n > 2 else { return maxDist }
        
        var left = 0
        while left < n, seats[left] == 0 {
            left += 1
        }
        
        maxDist = max(maxDist, left)
        if left == n - 1 { return maxDist }
        
        var right = left + 1
        
        while right < n {
            while right < n, seats[right] == 0 {
                right += 1
            }
            
            if right == n {
                maxDist = max(maxDist, right - left - 1)
                return maxDist
            }
            
            maxDist = max(maxDist, (right - left) / 2)
            left = right
            right += 1
        }
        
        return maxDist
    }
}
