//
//  Problem_404.swift
//  LeetСodeProblems
//
//  Created by Aynur Nasybullin on 31.01.2024.
//

//  404. Sum of Left Leaves
//  Easy
//  Topics: Tree, Depth-First Search, Breadth-First Search, Binary Tree

//  Given the root of a binary tree, return the sum of all left leaves.
//
//  A leaf is a node with no children. A left leaf is a leaf that is the left child of another node.

//  Example 1:
//  Input: root = [3,9,20,null,null,15,7]
//  Output: 24
//  Explanation: There are two left leaves in the binary tree, with values 9 and 15 respectively.
//
//  Example 2:
//  Input: root = [1]
//  Output: 0
 
//  Constraints:
//  The number of nodes in the tree is in the range [1, 1000].
//  -1000 <= Node.val <= 1000

extension Problems {
    // Approach: Depth-First Search, Recursion
    // Time complexity: O(n) = 12 ms
    // Space complexity: O(n) = 15.44 MB
    static func problem_404_sumOfLeftLeaves(_ root: TreeNode?) -> Int {
        func sumOfLeftLeaves(_ root: TreeNode, isLeft: Bool = true) -> Int {
            var sum = 0
            var hasChilds = false
            
            if let left = root.left {
                sum += sumOfLeftLeaves(left)
                hasChilds = true
            }
            
            if let right = root.right {
                sum += sumOfLeftLeaves(right, isLeft: false)
                hasChilds = true
            }
            
            if sum == 0, isLeft, !hasChilds {
                sum += root.val
            }
            
            return sum
        }
        
        guard let root = root else { return 0 }
        return sumOfLeftLeaves(root, isLeft: false)
    }
    
    // Approach: Depth-First Search, Stack
    // Time complexity: O(n) = 13 ms
    // Space complexity: O(n) = 15.40 MB
    static func problem_404_sumOfLeftLeaves2(_ root: TreeNode?) -> Int {
        struct Pair {
            let node: TreeNode
            let isLeft: Bool
            
            init(_ node: TreeNode, isLeft: Bool = true) {
                self.node = node
                self.isLeft = isLeft
            }
        }
        
        guard let root = root else { return 0 }
        
        var sum = 0
        var pairs = [Pair(root, isLeft: false)]
        
        while !pairs.isEmpty {
            let current = pairs.removeLast()
            var hasChilds = false
            
            if let left = current.node.left {
                pairs.append(.init(left))
                hasChilds = true
            }
            
            if let right = current.node.right {
                pairs.append(.init(right, isLeft: false))
                hasChilds = true
            }
            
            if !hasChilds, current.isLeft {
                sum += current.node.val
            }
        }
        
        return sum
    }
    
    // Approach: Breadth-First Search, Queue
    // Time complexity: O(n) = 8 ms
    // Space complexity: O(n * (2 / 3)) = 15.45 MB
    static func problem_404_sumOfLeftLeaves3(_ root: TreeNode?) -> Int {
        struct Pair {
            let node: TreeNode
            let isLeft: Bool
            
            init(_ node: TreeNode, isLeft: Bool = true) {
                self.node = node
                self.isLeft = isLeft
            }
        }
        
        guard let root = root else { return 0 }
        
        var sum = 0
        let queue = Queue<Pair>()
        queue.enqueue(.init(root, isLeft: false))
        
        while true {
            guard let current = queue.dequeue() else { return sum }
            var hasChilds = false
            
            if let left = current.node.left {
                queue.enqueue(.init(left))
                hasChilds = true
            }
            
            if let right = current.node.right {
                queue.enqueue(.init(right, isLeft: false))
                hasChilds = true
            }
            
            if !hasChilds, current.isLeft {
                sum += current.node.val
            }
        }
    }
}
