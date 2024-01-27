//
//  Problem_36.swift
//  LeetCodeProblems
//
//  Created by Aynur Nasybullin on 14.01.2024.
//

//  36. Valid Sudoku
//  Medium
//  Topics
//
//  Determine if a 9 x 9 Sudoku board is valid. 
//  Only the filled cells need to be validated according to the following rules:
//
//  Each row must contain the digits 1-9 without repetition.
//  Each column must contain the digits 1-9 without repetition.
//  Each of the nine 3 x 3 sub-boxes of the grid must contain the digits 1-9 without repetition.
//
//  Note:
//  A Sudoku board (partially filled) could be valid but is not necessarily solvable.
//  Only the filled cells need to be validated according to the mentioned rules.
 
//  Example 1:
//  Input: board =
//  [["5","3",".",".","7",".",".",".","."]
//  ,["6",".",".","1","9","5",".",".","."]
//  ,[".","9","8",".",".",".",".","6","."]
//  ,["8",".",".",".","6",".",".",".","3"]
//  ,["4",".",".","8",".","3",".",".","1"]
//  ,["7",".",".",".","2",".",".",".","6"]
//  ,[".","6",".",".",".",".","2","8","."]
//  ,[".",".",".","4","1","9",".",".","5"]
//  ,[".",".",".",".","8",".",".","7","9"]]
//  Output: true
//
//  Example 2:
//  Input: board =
//  [["8","3",".",".","7",".",".",".","."]
//  ,["6",".",".","1","9","5",".",".","."]
//  ,[".","9","8",".",".",".",".","6","."]
//  ,["8",".",".",".","6",".",".",".","3"]
//  ,["4",".",".","8",".","3",".",".","1"]
//  ,["7",".",".",".","2",".",".",".","6"]
//  ,[".","6",".",".",".",".","2","8","."]
//  ,[".",".",".","4","1","9",".",".","5"]
//  ,[".",".",".",".","8",".",".","7","9"]]
//  Output: false
//  Explanation: Same as Example 1, except with the 5 in the top left corner being modified to 8.
//  Since there are two 8's in the top left 3x3 sub-box, it is invalid.
 
//  Constraints:
//  board.length == 9
//  board[i].length == 9
//  board[i][j] is a digit 1-9 or '.'.

extension Problems {
    // Approach: Array, Hash Table, Matrix
    // Time complexity: O(n^2) => 73 ms
    // Space complexity: O(n^2) => 16.20 MB
    // n = 3
    static func problem_36_isValidSudoku(_ board: [[Character]]) -> Bool {
        let n = 3
        var dict = [Character:(rows: Set<Int>, columns: Set<Int>, boxes: Set<Int>)]()
        
        for row in board.indices {
            for column in board[row].indices {
                let char = board[row][column]
                
                if char == "." { continue }
                let boxIdx = (column / n + 1) + (row / n - 1 ) * n
                
                if let value = dict[char] {
                    if value.rows.contains(row) { return false }
                    if value.columns.contains(column) { return false }
                    if value.boxes.contains(boxIdx) { return false }
                } else {
                    dict[char] = (rows: [], columns: [], boxes: [])
                }
                
                dict[char]?.rows.insert(row)
                dict[char]?.columns.insert(column)
                dict[char]?.boxes.insert(boxIdx)
            }
        }
        
        return true
    }
}
