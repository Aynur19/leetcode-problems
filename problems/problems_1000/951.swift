// 951. Flip Equivalent Binary Trees
// Solved
// Medium
// Topics: Tree, Depth-First Search, Binary Tree
// Companies
// 
// Description:
//     For a binary tree T, we can define a flip operation as follows: choose any node, and swap the left and right child subtrees.
// 
//     A binary tree X is flip equivalent to a binary tree Y if and only if we can make X equal to Y after some number of flip operations.
// 
//     Given the roots of two binary trees root1 and root2, return true if the two trees are flip equivalent or false otherwise.
// 
// Example 1:
//     Flipped Trees Diagram
//     Input: root1 = [1,2,3,4,5,6,null,null,null,7,8], root2 = [1,3,2,null,6,4,5,null,null,null,null,8,7]
//     Output: true
//     Explanation: We flipped at nodes with values 1, 3, and 5.
// 
// Example 2:
//     Input: root1 = [], root2 = []
//     Output: true
// 
// Example 3:
//     Input: root1 = [], root2 = [1]
//     Output: false
// 
// Constraints:
//     The number of nodes in each tree is in the range [0, 100].
//     Each tree will have unique node values in the range [0, 99].


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
    func flipEquiv(_ root1: TreeNode?, _ root2: TreeNode?) -> Bool {
        guard let root1 = root1,
              let root2 = root2
        else { 
            return root1 == nil && root2 == nil
        }

        return flipEquiv(root1, root2)
    }


    func flipEquiv(_ root1: TreeNode, _ root2: TreeNode) -> Bool {
        guard root1.val == root2.val else { return false }

        let nodes1 = [root1.left, root1.right].compactMap { $0 }
        let nodes2 = [root2.left, root2.right].compactMap { $0 }

        guard nodes1.count == nodes2.count else { return false }
        
        if nodes1.isEmpty { return true }

        if nodes1.count == 1 { 
            return flipEquiv(nodes1[0], nodes2[0])
        }

        if flipEquiv(nodes1[0], nodes2[0]) && flipEquiv(nodes1[1], nodes2[1]) {
            return true
        } else if flipEquiv(nodes1[0], nodes2[1]) && flipEquiv(nodes1[1], nodes2[0]) {
            return true
        } 
        
        return false
    }
}