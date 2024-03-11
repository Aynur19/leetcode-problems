//
//  TreeProtocol.swift
//  LeetCodeProblems
//
//  Created by Aynur Nasybullin on 10.03.2024.
//

public final class TreeNode2<ValueType> {
    let value: ValueType
    var left: TreeNode2?
    var right: TreeNode2?
    
    init(
        _ value: ValueType,
        left: TreeNode2? = nil,
        right: TreeNode2? = nil
    ) {
        self.value = value
        self.left = left
        self.right = right
    }
}

public final class TreeNode3<ValueType> {
    let value: ValueType
    var left: TreeNode3?
    var right: TreeNode3?
    weak var parent: TreeNode3?
    
    init(
        _ value: ValueType,
        left: TreeNode3? = nil,
        right: TreeNode3? = nil,
        parent: TreeNode3? = nil
    ) {
        self.value = value
        self.left = left
        self.right = right
        self.parent = parent
    }
}

public final class TreeNodeK<ValueType> {
    let value: ValueType
    var nodes: [TreeNodeK]
    weak var parent: TreeNodeK?
    
    init(
        _ value: ValueType,
        nodes: [TreeNodeK] = [],
        parent: TreeNodeK? = nil
    ) {
        self.value = value
        self.nodes = nodes
        self.parent = parent
    }
}
