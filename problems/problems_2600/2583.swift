// 2583. Kth Largest Sum in a Binary Tree
// Solved
// Medium
// Topics: Tree, Breadth-First Search, Sorting, Binary Tree
// Companies
// 
// Description:
//     You are given the root of a binary tree and a positive integer k.
// 
//     The level sum in the tree is the sum of the values of the nodes that are on the same level.
// 
//     Return the kth largest level sum in the tree (not necessarily distinct). 
//     If there are fewer than k levels in the tree, return -1.
// 
//     Note that two nodes are on the same level if they have the same distance from the root.
// 
// Example 1:
//     Input: root = [5,8,9,2,1,3,7,4,6], k = 2
//     Output: 13
//     Explanation: The level sums are the following:
//         - Level 1: 5.
//         - Level 2: 8 + 9 = 17.
//         - Level 3: 2 + 1 + 3 + 7 = 13.
//         - Level 4: 4 + 6 = 10.
//         The 2nd largest level sum is 13.
// 
// Example 2:
//     Input: root = [1,2,null,3], k = 1
//     Output: 3
//     Explanation: The largest level sum is 3.
// 
// Constraints:
//     The number of nodes in the tree is n.
//     2 <= n <= 10^5
//     1 <= Node.val <= 10^6
//     1 <= k <= n


// Time complexity: O(n)
// Memory complexity: O(n)
/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */
class Solution {
    func kthLargestLevelSum(_ root: TreeNode?, _ k: Int) -> Int {
        guard var root = root else { return -1 }

        var sums = [Int]()
        var nodes = [root]

        while !nodes.isEmpty {
            var sum = 0
            var nodes2 = [TreeNode]()

            while !nodes.isEmpty {
                let last = nodes.removeLast()
                sum += last.val

                if let left = last.left {
                    nodes2.append(left)
                }

                if let right = last.right {
                    nodes2.append(right)
                }
            } 

            sums.append(sum)
            nodes = nodes2
        }

        return sums.count >= k ? sums.sorted(by: >)[k - 1] : -1
    }
}