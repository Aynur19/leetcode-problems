//
//  TreeNode.swift
//  LeetCodeProblems
//
//  Created by Aynur Nasybullin on 10.09.2023.
//

import Foundation

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    
    public init() {
        self.val = 0
        self.left = nil
        self.right = nil
    }
    
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil;
    }
    
    public init(_ val: Int, _ left: TreeNode? = nil, _ right: TreeNode? = nil) {
        self.val = val
        self.left = left
        self.right = right
    }
}

extension TreeNode: Equatable {
    public static func == (lhs: TreeNode, rhs: TreeNode) -> Bool {
        ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
    }
    
    public static func === (lhs: TreeNode, rhs: TreeNode) -> Bool {
        if lhs.val != rhs.val { return false }
        
        if let lhsLeft = lhs.left,
           let rhsLeft = rhs.left {
            if !(lhsLeft === rhsLeft) { return false }
        } else {
            if lhs.left != nil || rhs.left != nil { return false }
        }
        
        if let lhsRight = lhs.right,
           let rhsRight = rhs.right {
            if !(lhsRight === rhsRight) { return false }
        } else {
            if lhs.right != nil || rhs.right != nil { return false }
        }
        
        return true
    }
}
