// 2641. Cousins in Binary Tree II
// Solved
// Medium
// Topics: Hash Table, Tree, Depth-First Search, Breadth-First Search, Binary Tree
// Companies
// 
// Description:
//     Given the root of a binary tree, replace the value of each node in the tree with the sum of all its cousins' values.
// 
//     Two nodes of a binary tree are cousins if they have the same depth with different parents.
// 
//     Return the root of the modified tree.
// 
//     Note that the depth of a node is the number of edges in the path from the root node to it.
// 
// Example 1:
//     Input: root = [5,4,9,1,10,null,7]
//     Output: [0,0,0,7,7,null,11]
//     Explanation: The diagram above shows the initial binary tree and the binary tree after changing the value of each node.
//         - Node with value 5 does not have any cousins so its sum is 0.
//         - Node with value 4 does not have any cousins so its sum is 0.
//         - Node with value 9 does not have any cousins so its sum is 0.
//         - Node with value 1 has a cousin with value 7 so its sum is 7.
//         - Node with value 10 has a cousin with value 7 so its sum is 7.
//         - Node with value 7 has cousins with values 1 and 10 so its sum is 11.
// 
// Example 2:
//     Input: root = [3,1,2]
//     Output: [0,0,0]
//     Explanation: The diagram above shows the initial binary tree and the binary tree after changing the value of each node.
//         - Node with value 3 does not have any cousins so its sum is 0.
//         - Node with value 1 does not have any cousins so its sum is 0.
//         - Node with value 2 does not have any cousins so its sum is 0.
// 
// Constraints:
//     The number of nodes in the tree is in the range [1, 10^5].
//     1 <= Node.val <= 10^4


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
    func replaceValueInTree(_ root: TreeNode?) -> TreeNode? {
        guard var root = root else { return nil }

        var nodes = [[root]]
        var level = 0
        
        while !nodes.isEmpty {
            level += 1

            let sum = nodes.reduce(into: 0) { result, subArray in
                result += subArray.reduce(into: 0) { subNodesSum, node in
                    subNodesSum += node.val
                }
            }

            if level > 2 {
                for idx in nodes.indices {
                    let subsum = nodes[idx].reduce(into: 0) { result, node in
                        result += node.val
                    }

                    for nodeIdx in nodes[idx].indices {
                        nodes[idx][nodeIdx].val = sum - subsum
                    }
                }
            } else {
                for idx in nodes.indices {
                    for nodeIdx in nodes[idx].indices {
                        nodes[idx][nodeIdx].val = 0
                    }
                }
            }

            var nodes2 = [[TreeNode]]()
            for subnodes in nodes {
                for node in subnodes {
                    nodes2.append([node.left, node.right].compactMap { $0 })
                }
            }
            nodes = nodes2
        }

        return root
    }
}