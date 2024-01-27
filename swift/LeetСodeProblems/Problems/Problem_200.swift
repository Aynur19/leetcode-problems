//
//  Problem_200.swift
//  LeetCodeProblems
//
//  Created by Aynur Nasybullin on 25.01.2024.
//

//  200. Number of Islands
//  Medium
//  Topics

//  Given an m x n 2D binary grid grid which represents
//  a map of '1's (land) and '0's (water), return the number of islands.
//
//  An island is surrounded by water and is formed by connecting adjacent lands horizontally or vertically.
//  You may assume all four edges of the grid are all surrounded by water.

//  Example 1:
//  Input: grid = [
//    ["1","1","1","1","0"],
//    ["1","1","0","1","0"],
//    ["1","1","0","0","0"],
//    ["0","0","0","0","0"]
//  ]
//  Output: 1
//
//  Example 2:
//  Input: grid = [
//    ["1","1","0","0","0"],
//    ["1","1","0","0","0"],
//    ["0","0","1","0","0"],
//    ["0","0","0","1","1"]
//  ]
//  Output: 3
 
//  Constraints:
//  m == grid.length
//  n == grid[i].length
//  1 <= m, n <= 300
//  grid[i][j] is '0' or '1'.

extension Problems {
    // Approach: Two Pointer
    // Time complexity: O(n * m) = 246 ms
    // Space complexity: O(n * m) = 18.48 MB
    static func problem_200_numIslands(_ grid: [[Character]]) -> Int {
        var grid = grid
        let rows = grid.count
        let columns = grid[0].count
        var result = 0
        
        func fill(_ grid: inout [[Character]], row: Int, column: Int) {
            if row < 0 || row >= rows { return }
            if column < 0 || column >= columns { return }
            if grid[row][column] != "1" { return }
            
            grid[row][column] = "0"
            
            fill(&grid, row: row + 1, column: column)
            fill(&grid, row: row - 1, column: column)
            fill(&grid, row: row, column: column + 1)
            fill(&grid, row: row, column: column - 1)
        }
        
        for row in grid.indices {
            for column in grid[row].indices {
                if grid[row][column] == "1" {
                    result += 1
                    fill(&grid, row: row, column: column)
                }
            }
        }
        
        return result
    }
}
