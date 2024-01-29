//
//  Problem_235.swift
//  LeetСodeProblems
//
//  Created by Aynur Nasybullin on 29.01.2024.
//

//  235. Lowest Common Ancestor of a Binary Search Tree
//  Medium
//  Topics: Tree, Depth-First Search, Binary Search Tree, Binary Tree

//  Given a binary search tree (BST), find the lowest common ancestor (LCA) node of two given nodes in the BST.
//
//  According to the definition of LCA on Wikipedia:
//  “The lowest common ancestor is defined between two nodes p and q as the lowest node
//  in T that has both p and q as descendants (where we allow a node to be a descendant of itself).”

//  Example 1:
//  Input: root = [6,2,8,0,4,7,9,null,null,3,5], p = 2, q = 8
//  Output: 6
//  Explanation: The LCA of nodes 2 and 8 is 6.
//
//  Example 2:
//  Input: root = [6,2,8,0,4,7,9,null,null,3,5], p = 2, q = 4
//  Output: 2
//  Explanation: The LCA of nodes 2 and 4 is 2, since a node can be a descendant of itself according to the LCA definition.
//
//  Example 3:
//  Input: root = [2,1], p = 2, q = 1
//  Output: 2
 
//  Constraints:
//  The number of nodes in the tree is in the range [2, 10^5].
//  -10^9 <= Node.val <= 10^9
//  All Node.val are unique.
//  p != q
//  p and q will exist in the BST.

extension Problems {
    // Approach: Binary Search
    // Time complexity: O(log n) = 110 ms
    // Space complexity: O(1) = 1649 MB
    static func problem_235_lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        guard var tmp = root,
              let p = p,
              let q = q
        else { return nil }
        
        let left = p.val > q.val ? q : p
        let right = p.val < q.val ? q : p
        
        while true {
            if tmp.val == left.val || tmp.val == right.val { return tmp }
            if tmp.val > left.val && tmp.val < right.val { return tmp }
            
            if tmp.val > right.val {
                guard let next = tmp.left else { return nil }
                tmp = next
            } else {
                guard let next = tmp.right else { return nil }
                tmp = next
            }
        }
    }
}

