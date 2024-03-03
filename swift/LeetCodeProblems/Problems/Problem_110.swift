//
//  Problem_110.swift
//  LeetCodeProblems
//
//  Created by Aynur Nasybullin on 17.01.2024.
//

//  110. Balanced Binary Tree
//  Easy
//  Topics: Tree, Depth-First Search, Binary Tree

//  Given a binary tree, determine if it isheight-balanced.

//  Example 1:
//  Input: root = [3,9,20,null,null,15,7]
//  Output: true
//  
//  Example 2:
//  Input: root = [1,2,2,3,3,null,null,4,4]
//  Output: false
//
//  Example 3:
//  Input: root = []
//  Output: true
 
//  Constraints:
//  The number of nodes in the tree is in the range [0, 5000].
//  -10^4 <= Node.val <= 10^4

extension Problems {
    // Approach: Depth-First Search, Recursion
    // Time complexity: O(n) = 40 ms
    // Space complexity: O(1) = 16.51 MB
    static func problem_110_isBalanced(_ root: TreeNode?) -> Bool {
        func isBalanced_DFS(root: TreeNode?) -> (depth: Int, result: Bool) {
            guard let root = root else { return (0, true) }
            
            let left = isBalanced_DFS(root: root.left)
            let right = isBalanced_DFS(root: root.right)
            let depth = max(left.depth, right.depth) + 1
            
            if !left.result || !right.result {
                return (depth: depth, result: false)
            }
            
            let result = abs(left.depth - right.depth) <= 1
            
            return (depth: depth, result: result)
        }
        
        return isBalanced_DFS(root: root).result
    }
}
