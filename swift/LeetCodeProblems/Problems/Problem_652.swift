//
//  Problem_652.swift
//  LeetСodeProblems
//
//  Created by Aynur Nasybullin on 08.02.2024.
//

//  652. Find Duplicate Subtrees
//  Medium
//  Topics: Hash Table, Tree, Depth-First Search, Binary Tree

//  Given the root of a binary tree, return all duplicate subtrees.
//
//  For each kind of duplicate subtrees, you only need to return the root node of any one of them.
//
//  Two trees are duplicate if they have the same structure with the same node values.

//  Example 1:
//  Input: root = [1,2,3,4,null,2,4,null,null,4]
//  Output: [[2,4],[4]]
//
//  Example 2:
//  Input: root = [2,1,1]
//  Output: [[1]]
//
//  Example 3:
//  Input: root = [2,2,2,3,null,3,null]
//  Output: [[2,3],[3]]
 
//  Constraints:
//  The number of the nodes in the tree will be in the range [1, 5000]
//  -200 <= Node.val <= 200

extension Problems {
    // Approach: Hash Table, Tree, Depth-First Search, Binary Tree, Recursion
    // Time complexity: O(n) = 25 ms
    // Space complexity: O(n) = 22.86 MB
    static func problem_652_findDuplicateSubtrees(_ root: TreeNode?) -> [TreeNode?] {
        if root?.left == nil, root?.right == nil { return [] }
        
        var dict = [String:Int]()
        var result: [TreeNode?] = []
        
        func serializeSubtree(_ node: TreeNode?) -> String {
            var currentData = ""
            if let node = node {
                currentData += "\(node.val);"
                currentData += serializeSubtree(node.left)
                currentData += serializeSubtree(node.right)
            } else {
                currentData = "?;"
            }
            
            if currentData != "?;" {
                if let count = dict[currentData] {
                    if count == 1 {
                        result.append(node)
                    }
                    dict[currentData] = count + 1
                } else {
                    dict[currentData] = 1
                }
            }
            
            return currentData
        }
        
        _ = serializeSubtree(root?.left)
        _ = serializeSubtree(root?.right)
        
        return result
    }
}
