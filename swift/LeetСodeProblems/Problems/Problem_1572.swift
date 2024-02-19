//
//  Problem_1572.swift
//  LeetСodeProblems
//
//  Created by Aynur Nasybullin on 19.02.2024.
//

//  1572. Matrix Diagonal Sum
//  Easy
//  Topics: Array, Matrix

//  Given a square matrix mat, return the sum of the matrix diagonals.
//
//  Only include the sum of all the elements on the primary diagonal and all the elements
//  on the secondary diagonal that are not part of the primary diagonal.

//  Example 1:
//  Input: mat = [[1,2,3],
//                [4,5,6],
//                [7,8,9]]
//  Output: 25
//  Explanation: Diagonals sum: 1 + 5 + 9 + 3 + 7 = 25
//  Notice that element mat[1][1] = 5 is counted only once.
//
//  Example 2:
//  Input: mat = [[1,1,1,1],
//                [1,1,1,1],
//                [1,1,1,1],
//                [1,1,1,1]]
//  Output: 8
//
//  Example 3:
//  Input: mat = [[5]]
//  Output: 5
 
//  Constraints:
//  n == mat.length == mat[i].length
//  1 <= n <= 100
//  1 <= mat[i][j] <= 100

extension Problems {
    // Approach: Sum
    // Time complexity: O() = 36 ms
    // Space complexity: O(1) = 15.28 MB
    static func problem_1572_diagonalSum(_ mat: [[Int]]) -> Int {
        let n = mat.count
        var sum = 0
        
        for row in mat.indices {
            sum += mat[row][row] + mat[row][n - row - 1]
        }
        
        if n % 2 != 0 {
            let row = n / 2
            sum -= mat[row][n - row - 1]
        }
        
        
        return sum
    }
}
