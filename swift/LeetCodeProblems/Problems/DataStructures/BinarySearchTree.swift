//
//  BinarySearchTree.swift
//  LeetCodeProblems
//
//  Created by Aynur Nasybullin on 09.03.2024.
//




public final class BinarySearchTree<ValueType>
where ValueType: Comparable {
    private class Node {
        let value: ValueType
        var left: Node?
        var right: Node?
        weak var parent: Node?
        
        init(_ value: ValueType, left: Node? = nil, right: Node? = nil, parent: Node? = nil) {
            self.value = value
            self.left = left
            self.right = right
            self.parent = parent
        }
    }
    
    private var root: Node?
    
    init() { }
}

extension BinarySearchTree {
    enum TraversalOrder {
        case inorder, preorder, postorder
    }
    
    private func search(_ val: ValueType, node: Node) -> Node? {
        if node.value == val { return node }
        
        guard let next = (node.value > val) ? node.left : node.right else { return nil }
        
        return search(val, node: next)
    }
    
    private func inorderTraversal(_ node: Node, values: inout [ValueType]) {
        if let left = node.left {
            inorderTraversal(left, values: &values)
        }
        
        values.append(node.value)
        
        if let right = node.right {
            inorderTraversal(right, values: &values)
        }
    }
    
    private func preorderTraversal(_ node: Node, values: inout [ValueType]) {
        values.append(node.value)
        
        if let left = node.left {
            inorderTraversal(left, values: &values)
        }
        
        if let right = node.right {
            inorderTraversal(right, values: &values)
        }
    }
    
    private func postorderTraversal(_ node: Node, values: inout [ValueType]) {
        if let left = node.left {
            inorderTraversal(left, values: &values)
        }
        
        if let right = node.right {
            inorderTraversal(right, values: &values)
        }
        
        values.append(node.value)
    }
    
    func traversal(order: TraversalOrder) -> [ValueType] {
        var result = [ValueType]()
        
        guard let root = root else { return result }
        
        switch order {
            case .inorder:
                inorderTraversal(root, values: &result)
            case .postorder:
                postorderTraversal(root, values: &result)
            case .preorder:
                preorderTraversal(root, values: &result)
        }
        
        return result
    }
}


extension BinarySearchTree {
    private static func getLeft(_ node: Node) -> Node {
        guard let left = node.left else { return node }

        return getLeft(left)
    }

    private static func getRight(_ node: Node) -> Node {
        guard let right = node.right else { return node }

        return Self.getRight(right)
    }
    
    func min() -> ValueType? {
        guard let root = root else { return nil }
        
        return Self.getLeft(root).value
    }
    
    func max() -> ValueType? {
        guard let root = root else { return nil }
        
        return Self.getRight(root).value
    }
}

extension BinarySearchTree {
}

extension BinarySearchTree {
    final class Iterator {
        typealias BST = BinarySearchTree
        
        private var current: Node?
        private let order: TraversalOrder
        
        init(_ bst: BinarySearchTree, order: TraversalOrder = .inorder) {
            self.order = order
            self.current = bst.root
            
            if let root = bst.root {
                if order == .inorder {
                    self.current = BST.getLeft(root)
                }
            }
        }
        
        private func getNextInorder(_ node: Node) -> Node? {
            if let right = node.right {
                return getLeft(right)
            }
            
            var tmp = node
            while true {
                if let parent = tmp.parent {
                    if parent.right === tmp {
                        tmp = parent
                        continue
                    }
                    
                    return parent
                } else {
                    return nil
                }
            }
        }
        
        private func getPrevInorder(_ node: Node) -> Node? {
            if let left = node.left {
                return BST.getRight(left)
            }
            
            var tmp = node
            while true {
                if let parent = tmp.parent {
                    if parent.left === tmp {
                        tmp = parent
                        continue
                    }
                    
                    return parent
                } else {
                    return nil
                }
            }
        }
        
        
        private func getNextPreorder(_ node: Node) -> Node? {
            if let left = node.left { return left }
            
            if let right = node.right { return right }
            
            var tmp = node
            while true {
                guard let parent = tmp.parent else { return nil }
                
                if parent.right === tmp {
                    tmp = parent
                } else {
                    return parent.right
                }
            }
        }
        
        private func getPrevPreorder(_ node: Node) -> Node? {
            guard let parent = node.parent else { return nil }
            
            if let left = parent.left, left !== node {
                return BST.getRight(left)
            }
            
            return parent
        }
        
        
        private func getNextPostorder(_ node: Node) -> Node? {
            guard let parent = node.parent else { return nil }
            
            guard let right = parent.parent, right !== node else { return parent }
            
            return BST.getLeft(right)
        }
        
//        private func getPrevPostorder(_ node: Node) -> Node? {
//            guard let parent = node.parent else { return nil }
//            
//            guard let left = parent.parent, left !== node else { return parent }
//            
//            return BST.getLeft(right)
//        }
        
        
        
        func next() -> ValueType? {
            let nextValue = current?.value
            
            if let tmp = current {
                switch order {
                    default:
                        current = getNextInorder(tmp)
                }
            }
            
            return nextValue
        }
        
        func prev() -> ValueType? {
            let prevValue = current?.value
            
            if let tmp = current {
                switch order {
                    default:
                        current = getPrevInorder(tmp)
                }
            }
            
            return prevValue
        }
        
        func hasNext() -> Bool {
            return current != nil
        }
    }
}

extension BinarySearchTree {
    private func insert(_ val: ValueType, node: Node) -> Bool {
        var tmp = node
        
        while true {
            if tmp.value == val { return false }
            
            guard let next = (tmp.value > val) ? tmp.left : tmp.right else {
                tmp.left = .init(val, parent: tmp)
                return true
            }
            
            tmp = next
        }
    }
    
    // O(h) -> h - глубина дерева
    func insert(_ val: ValueType) -> Bool {
        guard let root = root else {
            self.root = .init(val)
            return true
        }
        
        return insert(val, node: root)
    }
}

extension BinarySearchTree {
    private func delete(_ val: ValueType, node: Node) -> Bool {
        return true
    }
    
    func delete(_ val: ValueType) -> Bool {
        guard let root = root else { return false }
        
        return delete(val, node: root)
    }
}
