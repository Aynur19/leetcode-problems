// 2326. Spiral Matrix IV
// Solved
// Medium
// Topics: Array, Linked List, Matrix, Simulation
// Companies

// You are given two integers m and n, which represent the dimensions of a matrix.
// 
// You are also given the head of a linked list of integers.
// 
// Generate an m x n matrix that contains the integers in the linked list presented in spiral order (clockwise), 
// starting from the top-left of the matrix. If there are remaining empty spaces, fill them with -1.
// 
// Return the generated matrix.

// Example 1:
// Input: m = 3, n = 5, head = [3,0,2,6,8,1,7,9,4,2,5,5,0]
// Output: [[3,0,2,6,8],[5,0,-1,-1,1],[5,2,4,9,7]]
// Explanation: The diagram above shows how the values are printed in the matrix.
//      Note that the remaining spaces in the matrix are filled with -1.
// 
// Example 2:
// Input: m = 1, n = 4, head = [0,1,2]
// Output: [[0,1,2,-1]]
// Explanation: The diagram above shows how the values are printed from left to right in the matrix.
//      The last space in the matrix is set to -1.

// Constraints:
// 1 <= m, n <= 10^5
// 1 <= m * n <= 10^5
// The number of nodes in the list is in the range [1, m * n].
// 0 <= Node.val <= 1000


/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */


// Time complexity: O(n * m)
// Memory complexity: O(1)
class Solution {
    func spiralMatrix(_ m: Int, _ n: Int, _ head: ListNode?) -> [[Int]] {
        var result = Array(repeating: Array(repeating: -1, count: n), count: m)
        var (startR, startC) = (0, 0)
        var (endR, endC) = (m - 1, n - 1)
        var current = head

        while startR <= endR, startC <= endC {
            for idx in startC...endC {
                guard let val = getListNodeVal(node: &current) else { return result }
                result[startR][idx] = val
                print("row: \(startR): column: \(idx)")
            }

            if startR + 1 > endR { return result }
            for idx in (startR + 1)...endR {
                guard let val = getListNodeVal(node: &current) else { return result }
                result[idx][endC] = val
                print("row: \(idx): column: \(endC)")
            }

            if endC - 1 < startC { return result }
            for idx in stride(from: (endC - 1), to: startC - 1, by: -1) {
                guard let val = getListNodeVal(node: &current) else { return result }
                result[endR][idx] = val
                print("row: \(endR): column: \(idx)")
            }

            if endR - 1 < startR + 1 { return result }
            for idx in stride(from: (endR - 1), to: startR, by: -1) {
                guard let val = getListNodeVal(node: &current) else { return result }
                result[idx][startC] = val
                print("row: \(idx): column: \(startC)")
            }

            startC += 1
            startR += 1
            endC -= 1
            endR -= 1
        }

        return result
    }

    func getListNodeVal(node: inout ListNode?) -> Int? {
        let result = node?.val
        node = node?.next

        return result
    }
}