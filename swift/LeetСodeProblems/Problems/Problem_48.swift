//
//  Problem_48.swift
//  LeetCodeProblems
//
//  Created by Aynur Nasybullin on 16.01.2024.
//

//  48. Rotate Image
//  Medium
//  Topics: Array, Math, Matrix

//  You are given an n x n 2D matrix representing an image, rotate the image by 90 degrees (clockwise).
//
//  You have to rotate the image in-place, which means you have to modify the input 2D matrix directly.
//  DO NOT allocate another 2D matrix and do the rotation.

//  Example 1:
//  Input: matrix = [
//      [1,2,3],
//      [4,5,6],
//      [7,8,9]]
//  Output: [
//      [7,4,1],
//      [8,5,2],
//      [9,6,3]
//  ]
//
//  Example 2:
//  Input: matrix = [
//      [5,1,9,11],
//      [2,4,8,10],
//      [13,3,6,7],
//      [15,14,12,16]
//  ]
//  Output: [
//      [15,13,2,5],
//      [14,3,4,1],
//      [12,6,8,9],
//      [16,7,10,11]
//  ]
 
//  Constraints:
//  n == matrix.length == matrix[i].length
//  1 <= n <= 20
//  -1000 <= matrix[i][j] <= 1000

extension Problems {
    // Approach: Matrix
    // Time complexity: O((n^2) / 4) = 3 ms
    // Space complexity: O(1) = 15.26 MB
    static func problem_48_rotate(_ matrix: inout [[Int]]) {
        let n = matrix.count
        let maxRow = n / 2 - (n % 2 == 0 ? 1 : 0)
        for row in 0...maxRow {
            let leftColumn = row
            let rightColumn = n - row - 1
            
            for column in row..<rightColumn {
                let topRow      = row
                let topColumn   = column
                
                let leftRow     = n - column - 1
                let rightRow    = column
                
                let bottomRow       = n - row - 1
                let bottomColumn    = n - column - 1
                
                let tmp = matrix[topRow][topColumn]
                
                matrix[topRow][topColumn]       = matrix[leftRow][leftColumn]
                matrix[leftRow][leftColumn]     = matrix[bottomRow][bottomColumn]
                matrix[bottomRow][bottomColumn] = matrix[rightRow][rightColumn]
                matrix[rightRow][rightColumn]   = tmp
            }
        }
    }
}
