// 590. N-ary Tree Postorder Traversal
// Solved
// Easy
// Topics: Stack, Tree, Depth-First Search
// Companies
// Given the root of an n-ary tree, return the postorder traversal of its nodes' values.
// 
// Nary-Tree input serialization is represented in their level order traversal. 
// Each group of children is separated by the null value (See examples)
// 
// Example 1:
// Input: root = [1,null,3,2,4,null,5,6]
// Output: [5,6,3,2,4,1]
// 
// Example 2:
// Input: root = [1,null,2,3,4,5,null,null,6,7,null,8,null,9,10,null,null,11,null,12,null,13,null,null,14]
// Output: [2,6,14,11,7,3,12,8,4,13,9,10,5,1]
//  
// Constraints:
// The number of nodes in the tree is in the range [0, 104].
// 0 <= Node.val <= 104
// The height of the n-ary tree is less than or equal to 1000.
//  
// Follow up: Recursive solution is trivial, could you do it iteratively?


/**
 * Definition for a Node.
 * public class Node {
 *     public var val: Int
 *     public var children: [Node]
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.children = []
 *     }
 * }
 */

import Collections

class Solution {
    func postorder(_ root: Node?) -> [Int] {
        guard var root = root else { return [] }

        return postorder2(root)
    }

    func postorder2(_ root: Node) -> [Int] {
        if root.children.isEmpty { return [root.val] }

        return root.children
            .map { postorder($0) }
            .flatMap { $0 } + [root.val]

        var deque = Deque([root.val])
        var nodes = Deque([root])

        while let tmp = nodes.popFirst() {
            deque.prepend(contentsOf: tmp.children.map { $0.val })
            nodes.append(contentsOf: tmp.children)
        }

        return deque.map { $0 }
    }
}
