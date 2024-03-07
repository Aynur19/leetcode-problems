//
//  BSTIterator.swift
//  LeetCodeProblems
//
//  Created by Aynur Nasybullin on 07.03.2024.
//

//  173. Binary Search Tree Iterator
//  Medium
//  Topics: Stack, Tree, Design, Binary Search Tree, Binary Tree, Iterator

//  Implement the BSTIterator class that represents an iterator over the in-order traversal of a binary search tree (BST):
//  - BSTIterator(TreeNode root) Initializes an object of the BSTIterator class. 
//    The root of the BST is given as part of the constructor. The pointer should be initialized to
//    a non-existent number smaller than any element in the BST.
//  - boolean hasNext() Returns true if there exists a number in the traversal to the right of the pointer,
//    otherwise returns false.
//  - int next() Moves the pointer to the right, then returns the number at the pointer.
//
//  Notice that by initializing the pointer to a non-existent smallest number, 
//  the first call to next() will return the smallest element in the BST.
//
//  You may assume that next() calls will always be valid. 
//  That is, there will be at least a next number in the in-order traversal when next() is called.

//  Example 1:
//  Input
//      ["BSTIterator", "next", "next", "hasNext", "next", "hasNext", "next", "hasNext", "next", "hasNext"]
//      [[[7, 3, 15, null, null, 9, 20]], [], [], [], [], [], [], [], [], []]
//  Output
//      [null, 3, 7, true, 9, true, 15, true, 20, false]
//
//  Explanation
//      BSTIterator bSTIterator = new BSTIterator([7, 3, 15, null, null, 9, 20]);
//      bSTIterator.next();    // return 3
//      bSTIterator.next();    // return 7
//      bSTIterator.hasNext(); // return True
//      bSTIterator.next();    // return 9
//      bSTIterator.hasNext(); // return True
//      bSTIterator.next();    // return 15
//      bSTIterator.hasNext(); // return True
//      bSTIterator.next();    // return 20
//      bSTIterator.hasNext(); // return False
//
//  Constraints:
//  The number of nodes in the tree is in the range [1, 10^5].
//  0 <= Node.val <= 10^6
//  At most 10^5 calls will be made to hasNext, and next.

//  Follow up:
//  Could you implement next() and hasNext() to run in average O(1) time and use O(h) memory, where h is the height of the tree?

//  Approach: Double Linked List, Stack
//  Time complexity:
//    - average O(1)    -> for 1 call of next(), hasNext()
//    - 68 ms           -> for all calls
//  Space complexity:
//    - O(n) where n - tree depth   -> for 1 call of next(), hasNext()
//    - 18.24 MB                    -> for all calls
final class BSTIterator {
    private var nodes = [TreeNode]()

    init(_ root: TreeNode?) {
        if let root = root {
            fillNodes(root)
        }
    }
    
    func next() -> Int {
        let next = nodes.removeLast()
        
        if let right = next.right {
            fillNodes(right)
        }
        
        return next.val
    }
    
    func hasNext() -> Bool {
        return !nodes.isEmpty
    }
    
    private func fillNodes(_ node: TreeNode) {
        var tmp = node
        
        while true {
            nodes.append(tmp)
            
            guard let left = tmp.left else { return }
            tmp = left
        }
    }
}
