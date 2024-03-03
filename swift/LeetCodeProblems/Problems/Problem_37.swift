//
//  Problem_37.swift
//  LeetCodeProblems
//
//  Created by Aynur Nasybullin on 14.01.2024.
//

//  37. Sudoku Solver
//  Hard
//  Topics: Array, Hash Table, Backtracking, Matrix
//
//  Write a program to solve a Sudoku puzzle by filling the empty cells.
//
//  A sudoku solution must satisfy all of the following rules:
//
//  Each of the digits 1-9 must occur exactly once in each row.
//  Each of the digits 1-9 must occur exactly once in each column.
//  Each of the digits 1-9 must occur exactly once in each of the 9 3x3 sub-boxes of the grid.
//  The '.' character indicates empty cells.

//  Example 1:
//  Input: board = [
//    ["5","3",".",".","7",".",".",".","."],
//    ["6",".",".","1","9","5",".",".","."],
//    [".","9","8",".",".",".",".","6","."],
//    ["8",".",".",".","6",".",".",".","3"],
//    ["4",".",".","8",".","3",".",".","1"],
//    ["7",".",".",".","2",".",".",".","6"],
//    [".","6",".",".",".",".","2","8","."],
//    [".",".",".","4","1","9",".",".","5"],
//    [".",".",".",".","8",".",".","7","9"]
//  ]
//  Output: [
//    ["5","3","4","6","7","8","9","1","2"],
//    ["6","7","2","1","9","5","3","4","8"],
//    ["1","9","8","3","4","2","5","6","7"],
//    ["8","5","9","7","6","1","4","2","3"],
//    ["4","2","6","8","5","3","7","9","1"],
//    ["7","1","3","9","2","4","8","5","6"],
//    ["9","6","1","5","3","7","2","8","4"],
//    ["2","8","7","4","1","9","6","3","5"],
//    ["3","4","5","2","8","6","1","7","9"]
//  ]
//  Explanation: The input board is shown above and the only valid solution is shown below:

//  Constraints:
//  board.length == 9
//  board[i].length == 9
//  board[i][j] is a digit or '.'.
//  It is guaranteed that the input board has only one solution.

//class LinkedList4<DataType>
//where DataType: Hashable {
//    enum LinkedListDirection {
//        case left
//        case right
//        case up
//        case down
//    }
//    
//    var left: LinkedList4?
//    var right: LinkedList4?
//    var up: LinkedList4?
//    var down: LinkedList4?
//    
//    var value: DataType
//    
//    init(
//        left: LinkedList4? = nil,
//        right: LinkedList4? = nil,
//        up: LinkedList4? = nil,
//        down: LinkedList4? = nil,
//        value: DataType
//    ) {
//        self.left = left
//        self.right = right
//        self.up = up
//        self.down = down
//        self.value = value
//    }
//    
//    init(
//        matrix: [[DataType]]
//    ) {
//        value = matrix[0][0]
//        var rowNode = self
//        for row in matrix.indices {
//            var columnNode = rowNode
//            
//            for column in columns.indices {
//                columnNode.value = matrix[row][column]
//                column
//            }
//        }
//    }
//    
//    func addRow(row: [DataType], direction: LinkedListDirection, includeSelf: Bool = true) {
//        var tmp: LinkedList4
//        switch direction {
//            case .right:
//                let start: Int
//                if includeSelf {
//                    tmp = self
//                    tmp.value = row[0]
//                    start = 1
//                } else {
//                    start = 0
//                }
//                
//                for i in start..<row.count {
//                    
//                }
//                
//            case .up: return
//            case .down: return
//            case .left: return
//        }
//    }
//    
//    func addToRight(data: DataType) -> Self {
//        let right = LinkedList4(left: self, value: data)
//        self.right = right
//        
//        if let rightUp = self.up?.right {
//            right.up = rightUp
//            rightUp
//        }
//        return right
//    }
//    
//    
//    func toString() {
//        var row: LinkedList4? = self
//        while row != nil {
//            print("| \(value)", terminator: " | ")
//            
//            var tmp = row?.right
//            while tmp != nil {
//                print("\(value)", terminator: " | ")
//            }
//            
//            row = row?.down
//        }
//    }
//}

extension Problems {
    
    
    // Approach: Array, Hash Table, Backtracking, Matrix
    // Time complexity: O() =>  ms
    // Space complexity: O() =>  MB
    // n = 3
    static func problem_37_solveSudoku(_ board: inout [[Character]]) {
        
    }
}
