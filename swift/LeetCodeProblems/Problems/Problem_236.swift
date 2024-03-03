//
//  Problem_236.swift
//  LeetСodeProblems
//
//  Created by Aynur Nasybullin on 29.01.2024.
//

//  236. Lowest Common Ancestor of a Binary Tree
//  Medium
//  Topics: Tree, Depth-First Search, Binary Tree

//  Given a binary tree, find the lowest common ancestor (LCA) of two given nodes in the tree.
//
//  According to the definition of LCA on Wikipedia:
//  “The lowest common ancestor is defined between two nodes p and q as the lowest node
//  in T that has both p and q as descendants (where we allow a node to be a descendant of itself).”

//  Example 1:
//  Input: root = [3,5,1,6,2,0,8,null,null,7,4], p = 5, q = 1
//  Output: 3
//  Explanation: The LCA of nodes 5 and 1 is 3.
//
//  Example 2:
//  Input: root = [3,5,1,6,2,0,8,null,null,7,4], p = 5, q = 4
//  Output: 5
//  Explanation: The LCA of nodes 5 and 4 is 5, since a node can be a descendant of itself according to the LCA definition.
//
//  Example 3:
//  Input: root = [1,2], p = 1, q = 2
//  Output: 1
 
//  Constraints:
//  The number of nodes in the tree is in the range [2, 10^5].
//  -10^9 <= Node.val <= 10^9
//  All Node.val are unique.
//  p != q
//  p and q will exist in the tree.

extension Problems {
    // Approach: Depth-First Search
    // Time complexity: O(n) = 70 ms
    // Space complexity: O(1) = 18.44 MB
    static func problem_236_lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        var lca: TreeNode?
        
        func searchLCA(_ node: TreeNode?) -> Bool {
            if node == nil { return false }
            
            let resultLeft = searchLCA(node?.left)
            let resultRight = searchLCA(node?.right)
            let result = node?.val == p?.val || node?.val == q?.val
            
            if lca != nil { return true }
            
            if !resultLeft && !resultRight { return result }
            
            if resultLeft && resultRight {
                lca = node
                return true
            }
            
            if (resultLeft || resultRight) && result {
                lca = node
                return true
            }
        
            return resultLeft || resultRight || result
        }
        
        _ = searchLCA(root)
        return lca
    }
}


