//
//  Problem_938.swift
//  LeetСodeProblems
//
//  Created by Aynur Nasybullin on 15.02.2024.
//

//  938. Range Sum of BST
//  Easy
//  Topics: Tree, Depth-First Search, Binary Search Tree, Binary Tree

//  Given the root node of a binary search tree and two integers low and high, return the sum of values
//  of all nodes with a value in the inclusive range [low, high].

//  Example 1:
//  Input: root = [10,5,15,3,7,null,18], low = 7, high = 15
//  Output: 32
//  Explanation: Nodes 7, 10, and 15 are in the range [7, 15]. 7 + 10 + 15 = 32.
//
//  Example 2:
//  Input: root = [10,5,15,3,7,13,18,1,null,6], low = 6, high = 10
//  Output: 23
//  Explanation: Nodes 6, 7, and 10 are in the range [6, 10]. 6 + 7 + 10 = 23.
 
//  Constraints:
//  The number of nodes in the tree is in the range [1, 2 * 10^4].
//  1 <= Node.val <= 10^5
//  1 <= low <= high <= 10^5
//  All Node.val are unique.

extension Problems {
    // Approach: Binary Search, Tree, Depth-First Search
    // Time complexity: O(log n) = 187 ms
    // Space complexity: O(log n) = 17.42 MB
    static func problem_938_rangeSumBST(_ root: TreeNode?, _ low: Int, _ high: Int) -> Int {
        guard let root = root else { return 0 }
        
        func rangeSumBST(_ node: TreeNode) -> Int {
            var sum = 0
            if node.val >= low && node.val <= high {
                sum += node.val
            }
            
            if node.val > low, let left = node.left {
                sum += rangeSumBST(left)
            }
            
            if node.val < high, let right = node.right {
                sum += rangeSumBST(right)
            }
            
            return sum
        }
        
        return rangeSumBST(root)
    }
}
