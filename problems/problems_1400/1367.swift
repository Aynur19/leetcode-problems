// 1367. Linked List in Binary Tree
// Solved
// Medium
// Topics: Linked List, Tree, Depth-First Search, Breadth-First Search, Binary Tree
// Companies

// Given a binary tree root and a linked list with head as the first node. 
// 
// Return True if all the elements in the linked list starting from the head correspond to some downward path connected 
// in the binary tree otherwise return False.
// 
// In this context downward path means a path that starts at some node and goes downwards.

// Example 1:
// Input: head = [4,2,8], root = [1,4,4,null,2,2,null,1,null,6,8,null,null,null,null,1,3]
// Output: true
// Explanation: Nodes in blue form a subpath in the binary Tree.  
//
// Example 2:
// Input: head = [1,4,2,6], root = [1,4,4,null,2,2,null,1,null,6,8,null,null,null,null,1,3]
// Output: true
//
// Example 3:
// Input: head = [1,4,2,6,8], root = [1,4,4,null,2,2,null,1,null,6,8,null,null,null,null,1,3]
// Output: false
// Explanation: There is no path in the binary tree that contains all the elements of the linked list from head.

// Constraints:
// The number of nodes in the tree will be in the range [1, 2500].
// The number of nodes in the list will be in the range [1, 100].
// 1 <= Node.val <= 100 for each node in the linked list and binary tree.]


/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */
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

// Time complexity: O(n * m)
// Memory complexity: O(n + m)
import Collections

class Solution {
    func isSubPath(_ head: ListNode?, _ root: TreeNode?) -> Bool {
        guard let treeNode = root, let listNode = head else { return false }

        var treeNodes = Deque([treeNode])
        while let firstTreeNode = treeNodes.popFirst() {
            if checkSubtree(list: listNode, subtree: firstTreeNode) { return true }

            if let leftTreeNode = firstTreeNode.left {
                treeNodes.append(leftTreeNode)
            }

            if let rightTreeNode = firstTreeNode.right {
                treeNodes.append(rightTreeNode)
            }
        }

        return false
    }

    func checkSubtree(list: ListNode, subtree: TreeNode) -> Bool {
        guard list.val == subtree.val else { return false }

        var tmpTreeNodes = [subtree]
        var tmpListNode = list

        while let nextListNode = tmpListNode.next {
            var nextTreeNodes = [TreeNode]()

            for tmpTreeNode in tmpTreeNodes {
                if let leftTreeNode = tmpTreeNode.left, leftTreeNode.val == nextListNode.val {
                    nextTreeNodes.append(leftTreeNode)
                }

                if let rightTreeNode = tmpTreeNode.right, rightTreeNode.val == nextListNode.val {
                    nextTreeNodes.append(rightTreeNode)
                }
            }

            if nextTreeNodes.isEmpty { return false }

            tmpTreeNodes = nextTreeNodes
            tmpListNode = nextListNode
        }

        return true
    }
}