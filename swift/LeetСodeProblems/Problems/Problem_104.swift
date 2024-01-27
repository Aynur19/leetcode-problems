//
//  Problem_104.swift
//  LeetCodeProblems
//
//  Created by Aynur Nasybullin on 17.01.2024.
//

//  104. Maximum Depth of Binary Tree
//  Easy
//  Topics: Tree, Depth-First Search, Breadth-First Search, Binary Tree

//  Given the root of a binary tree, return its maximum depth.
//  A binary tree's maximum depth is the number of nodes along the longest path
//  from the root node down to the farthest leaf node.

//  Example 1:
//  Input: root = [3,9,20,null,null,15,7]
//  Output: 3
//
//  Example 2:
//  Input: root = [1,null,2]
//  Output: 2
 
//  Constraints:
//  The number of nodes in the tree is in the range [0, 10^4].
//  -100 <= Node.val <= 100

extension Problems {
    // Approach: Breadth-First Search
    // Time complexity: O(n) = 30 ms
    // Space complexity: O(log(n)) = 15.94 MB
    static func problem_104_maxDepth_BFS(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        
        var maxDepth = 0
        var nodes = [root]
        
        while !nodes.isEmpty {
            maxDepth += 1
            
            nodes = nodes.flatMap{ node in
                [node.left, node.right].compactMap { $0 }
            }
        }
        
        return maxDepth
    }
    
    // Approach: Depth-First Search
    // Time complexity: O(n) = 27 ms
    // Space complexity: O(1) = 16.37 MB
    static func problem_104_maxDepth_DFS(_ root: TreeNode?) -> Int {
        func maxDepth_DFS(root: TreeNode?) -> Int {
            guard let root = root else { return 0 }
            
            return max(maxDepth_DFS(root: root.left), maxDepth_DFS(root: root.right)) + 1
        }
        
        return maxDepth_DFS(root: root)
    }
}
