// 2684. Maximum Number of Moves in a Grid
// Solved
// Medium
// Topics
// Companies
// 
// Description:
//     You are given a 0-indexed m x n matrix grid consisting of positive integers.
// 
//     You can start at any cell in the first column of the matrix, and traverse the grid in the following way:
//     - From a cell (row, col), you can move to any of the cells: (row - 1, col + 1), (row, col + 1) and (row + 1, col + 1) 
//       such that the value of the cell you move to, should be strictly bigger than the value of the current cell.
// 
//     Return the maximum number of moves that you can perform.
// 
// Example 1:
//     Input: grid = [[2,4,3,5],[5,4,9,3],[3,4,2,11],[10,9,13,15]]
//     Output: 3
//     Explanation: We can start at the cell (0, 0) and make the following moves:
//     - (0, 0) -> (0, 1).
//     - (0, 1) -> (1, 2).
//     - (1, 2) -> (2, 3).
//     It can be shown that it is the maximum number of moves that can be made.
// 
// Example 2:
//     Input: grid = [[3,2,4],[2,1,9],[1,1,7]]
//     Output: 0
//     Explanation: Starting from any cell in the first column we cannot perform any moves.
// 
// Constraints:
//     m == grid.length
//     n == grid[i].length
//     2 <= m, n <= 1000
//     4 <= m * n <= 10^5
//     1 <= grid[i][j] <= 10^6


// Time complexity: O(n * m)
// Memory complexity: O(n * m)
class Solution {
    func maxMoves(_ grid: [[Int]]) -> Int {
        guard !grid.isEmpty, grid[0].count > 0 else { return 0 }

        let (rows, cols) = (grid.count, grid[0].count)
        var matrix = [[Int]](repeating: [Int](repeating: 0, count: cols), count: rows)

        for c in stride(from: cols - 2, to: -1, by: -1) {        
            for r in grid.indices {    
                if c + 1 == cols { continue }

                let current = grid[r][c]

                if r - 1 >= 0, grid[r - 1][c + 1] > current { 
                    matrix[r][c] = max(matrix[r][c], matrix[r - 1][c + 1] + 1)
                }
                
                if grid[r][c + 1] > current { 
                    matrix[r][c] = max(matrix[r][c], matrix[r][c + 1] + 1)
                }

                if r + 1 < rows, grid[r + 1][c + 1] > current { 
                    matrix[r][c] = max(matrix[r][c], matrix[r + 1][c + 1] + 1)
                }
            }
        }

        return matrix.reduce(into: 0) { result, row in
            result = max(result, row[0])
        }
    }
}