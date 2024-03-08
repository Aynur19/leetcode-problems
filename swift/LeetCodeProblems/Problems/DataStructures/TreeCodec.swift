//
//  Problem_449.swift
//  LeetСodeProblems
//
//  Created by Aynur Nasybullin on 05.02.2024.
//

//  449. Serialize and Deserialize BST
//  Medium
//  Topics: String, Tree, Depth-First Search, Breadth-First Search, Design, Binary Search Tree, Binary Tree

//  Serialization is converting a data structure or object into a sequence of bits
//  so that it can be stored in a file or memory buffer, or transmitted across a network connection link
//  to be reconstructed later in the same or another computer environment.
//
//  Design an algorithm to serialize and deserialize a binary search tree.
//  There is no restriction on how your serialization/deserialization algorithm should work.
//  You need to ensure that a binary search tree can be serialized to a string,
//  and this string can be deserialized to the original tree structure.
//
//  The encoded string should be as compact as possible.

//  Example 1:
//  Input: root = [2,1,3]
//  Output: [2,1,3]
//
//  Example 2:
//  Input: root = []
//  Output: []
 
//  Constraints:
//  The number of nodes in the tree is in the range [0, 10^4].
//  0 <= Node.val <= 10^4
//  The input tree is guaranteed to be a binary search tree.

final class TreeCodec {
    // Encodes a tree to a single string.
    func serialize(_ root: TreeNode?, _ option: Int = 0) -> String {
        switch option {
            case 1: return serialize_1(root)
            case 2: return serialize_2(root)
            default: return serialize_3(root)
        }
    }
    
    // Decodes your encoded data to tree.
    func deserialize(_ data: String, _ option: Int = 0) -> TreeNode? {
        switch option {
            case 1: return deserialize_1(data)
            case 2: return deserialize_2(data)
            default: return deserialize_3(data)
        }
    }
    
    // Approach: Depth-First Search, Recursion
    // Time complexity: O(n) = 29 ms
    // Space complexity: O(n) = 18.04 MB
    private func serialize_1(_ root: TreeNode?) -> String {
        func serialize_DFS(_ node: TreeNode) -> [String] {
            var result = ["\(node.val);"]
            
            if let left = node.left {
                result.append(contentsOf: serialize_DFS(left))
            } else {
                result.append("?;")
            }
            
            if let right = node.right {
                result.append(contentsOf: serialize_DFS(right))
            } else {
                result.append("?;")
            }
            
            return result
        }
        
        guard let root = root else { return "" }
        return serialize_DFS(root).joined()
    }
    
    // Approach: Depth-First Search, Recursion
    // Time complexity: O(n) = 29 ms
    // Space complexity: O(n) = 18.04 MB
    private func deserialize_1(_ data: String) -> TreeNode? {
        guard !data.isEmpty else { return nil }
        
        func serialize_DFS(_ data: inout [String], _ idx: inout Int) -> TreeNode? {
            guard idx < data.count,
                  let val = Int(data[idx])
            else { return nil }
            
            idx += 1
            let left = serialize_DFS(&data, &idx)
            
            idx += 1
            let right = serialize_DFS(&data, &idx)
            
            return .init(val, left, right)
        }
        
        var idx = 0
        var data = data.split(separator: ";").compactMap { String($0) }
        return serialize_DFS(&data, &idx)
    }
    
    // Approach: Depth-First Search, Stack
    // Time complexity: O(n) = 31 ms
    // Space complexity: O(n) = 17.58 MB
    private func serialize_2(_ root: TreeNode?) -> String {
        guard let root = root else { return "" }
        
        var values = [String]()
        var nodes: [TreeNode?] = [root]
        
        while !nodes.isEmpty {
            if let node = nodes.removeLast() {
                nodes.append(contentsOf: [node.right, node.left])
                values.append("\(node.val);")
            } else {
                values.append("?;")
            }
        }
        
        return values.joined()
    }
    
    // Approach: Depth-First Search, Stack
    // Time complexity: O(n) = 31 ms
    // Space complexity: O(n) = 17.58 MB
    private func deserialize_2(_ data: String) -> TreeNode? {
        guard !data.isEmpty else { return nil }
        let values = data.split(separator: ";").compactMap { String($0) }
        
        guard !data.isEmpty, let rootVal = Int(values[0]) else { return nil }
        let root = TreeNode(rootVal)
        var isLeft = true
        var nodes = [root]
    
        for idx in 1..<values.count {
            if let val = Int(values[idx]) {
                let node = TreeNode(val)
                
                if isLeft {
                    nodes.last?.left = node
                } else {
                    nodes.last?.right = node
                    isLeft = true
                }
                nodes.append(node)
            } else {
                isLeft.toggle()
                
                if isLeft {
                    _ = nodes.removeLast()
                    while nodes.last?.right != nil {
                        _ = nodes.removeLast()
                    }
                    isLeft.toggle()
                }
            }
        }
        
        return root
    }
    
    // Approach: Breadth-First Search, Queue
    // Time complexity: O(n) = 34 ms
    // Space complexity: O(n) = 18.12 MB
    private func serialize_3(_ root: TreeNode?) -> String {
        guard let root = root else { return "" }
        
        let queue: Queue<TreeNode?> = .init()
        var values = [String]()
        
        queue.enqueue(root)
        while !queue.empty() {
            if let qVal = queue.dequeue(), let node = qVal {
                queue.enqueue(node.left)
                queue.enqueue(node.right)
                values.append("\(node.val);")
            } else {
                values.append("?;")
            }
        }
        
        return values.joined()
    }
    
    // Approach: Breadth-First Search, Queue
    // Time complexity: O(n) = 34 ms
    // Space complexity: O(n) = 18.12 MB
    private func deserialize_3(_ data: String) -> TreeNode? {
        guard !data.isEmpty else { return nil }
        let values = data.split(separator: ";").compactMap { String($0) }
        
        guard !data.isEmpty, let rootVal = Int(values[0]) else { return nil }
        let root = TreeNode(rootVal)
        let queue: Queue<TreeNode> = .init()
        queue.enqueue(root)
        
        var idx = 1
        while idx < values.count {
            if let val = Int(values[idx]) {
                let node = TreeNode(val)
                
                queue.peek()?.left = node
                queue.enqueue(node)
            }
            
            if let val = Int(values[idx + 1]) {
                let node = TreeNode(val)
                
                queue.peek()?.right = node
                queue.enqueue(node)
            }
            
            _ = queue.dequeue()
            idx += 2
        }
        
        return root
    }
}
