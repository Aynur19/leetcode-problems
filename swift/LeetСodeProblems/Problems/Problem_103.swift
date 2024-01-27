//
//  Problem_103.swift
//  LeetCodeProblems
//
//  Created by Aynur Nasybullin on 16.01.2024.
//

//  103. Binary Tree Zigzag Level Order Traversal
//  Medium
//  Topics: Tree, Breadth-First Search, Binary Tree

//  Given the root of a binary tree, return the zigzag level order traversal of its nodes' values. 
//  (i.e., from left to right, then right to left for the next level and alternate between).

//  Example 1:
//  Input: root = [3,9,20,null,null,15,7]
//  Output: [[3],[20,9],[15,7]]
//
//  Example 2:
//  Input: root = [1]
//  Output: [[1]]
//
//  Example 3:
//  Input: root = []
//  Output: []
 
//  Constraints:
//  The number of nodes in the tree is in the range [0, 2000].
//  -100 <= Node.val <= 100

extension Problems {
    // Approach: Reversing
    // Time complexity: O(n) = 7 ms
    // Space complexity: O(1) = 15.48 MB
    static func problem_103_zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else { return [] }
        
        var nodes = [root]
        var result = [[Int]]()
        var toRight = false
    
        while !nodes.isEmpty {
            result.append(nodes.map { $0.val })
    
            nodes = nodes.flatMap {
                (!toRight ? [$0.left, $0.right] : [$0.right, $0.left]).compactMap { $0 }
            }.reversed()
            
            toRight.toggle()
        }
    
        return result
    }
}
