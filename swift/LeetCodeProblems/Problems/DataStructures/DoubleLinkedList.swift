//
//  DoubleLinkedList.swift
//  LeetCodeProblems
//
//  Created by Aynur Nasybullin on 18.09.2023.
//

import Foundation

public final class DoubleLinkedList<ValueType>: ListProtocol {
    private class Node {
        var value: ValueType
        var next: Node?
        weak var prev: Node?
        
        init(value: ValueType) {
            self.value = value
        }
    }
    
    private var head: Node?
    private var end: Node?
    private var count = 0
    
    init() { }
    
    private func getNode(_ index: Int) -> Node? {
        guard index >= 0, index < count,
              var tmp = head
        else { return nil }
        
        var idx = 0
        while idx != index {
            if let next = tmp.next {
                tmp = next
            } else {
                return nil
            }
            
            idx += 1
        }
        
        return tmp
    }
    
    func get(_ index: Int) -> ValueType? {
        return getNode(index)?.value
    }
    
    func empty() -> Bool { return count == 0 }
}

extension DoubleLinkedList {
    func addAtHead(_ val: ValueType) {
        let newHead = Node(value: val)
        newHead.next = head
        
        head?.prev = newHead
        head = newHead
        
        if end == nil {
            end = head
        }
        
        count += 1
    }
    
    func addAtTail(_ val: ValueType) {
        let newEnd = Node(value: val)
        
        if let end = end {
            newEnd.prev = end
            end.next = newEnd
            self.end = newEnd
        } else {
            end = newEnd
            head = end
        }
        
        count += 1
    }
    
    func addAtIndex(_ index: Int, _ val: ValueType) -> Bool {
        guard index <= count else { return false }
        
        guard index > 0 else {
            addAtHead(val)
            return true
        }
        
        guard index != count else {
            addAtTail(val)
            return true
        }
        
        guard let prev = getNode(index - 1) else {
            return false
        }
        
        let addedNode = Node(value: val)
        addedNode.next = prev.next
        addedNode.prev = prev
        
        prev.next?.prev = addedNode
        prev.next = addedNode
        
        count += 1
        return true
    }
}
    
extension DoubleLinkedList {
    func removeAtHead() -> ValueType? {
        guard let head = head else { return nil }
        
        self.head = head.next
        self.head?.prev = nil
        
        head.next = nil
        
        if self.head == nil {
            end = nil
        }
        
        count -= 1
        return head.value
    }
    
    func removeAtTail() -> ValueType? {
        guard let end = end else { return nil }
        let removedValue = end.value
        
        guard let prevEnd = getNode(count - 2) else {
            self.head = nil
            self.end = nil
            count = 0
            
            return removedValue
        }
        
        end.prev = nil
        prevEnd.next = nil
        self.end = prevEnd
        count -= 1
        
        return removedValue
    }
    
    func removeAtIndex(_ index: Int) -> ValueType? {
        guard index < count else { return nil }
        
        guard index > 0 else {
            return removeAtHead()
        }
        
        guard index != count - 1 else {
            return removeAtTail()
        }
        
        guard let prevNode = getNode(index - 1) else {
            return nil
        }
        
        let nextNode = prevNode.next
        let removedValue = nextNode?.value
      
        prevNode.next = nextNode?.next
        prevNode.next?.prev = prevNode
        
        nextNode?.next = nil
        nextNode?.prev = nil
        
        count -= 1
        return removedValue
    }
}
    
extension DoubleLinkedList {
    func deleteAtHead() {
        _ = removeAtHead()
    }
    
    func deleteAtTail() {
        _ = removeAtTail()
    }
    
    func deleteAtIndex(_ index: Int) {
        _ = removeAtIndex(index)
    }
}

extension DoubleLinkedList: CustomStringConvertible
where ValueType: CustomStringConvertible {
    public var description: String {
        guard var tmp = head else { return "[]" }
        var result = ["[", "\(tmp.value)"]
        
        while true {
            if let next = tmp.next {
                result.append(" <-> \(next.value)")
                tmp = next
            }
            else { break }
        }
        
        result.append("]")
        return result.joined()
    }
}

extension DoubleLinkedList: Equatable {
    public static func == (lhs: DoubleLinkedList, rhs: DoubleLinkedList) -> Bool {
        ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
    }
}
    
//    
//    func setNext(_ node: DoubleLinkedList) {
//        if let next = self.next {
//            node.next = next
//            next.prev = node
//        }
//        
//        self.next = node
//        node.prev = self
//    }
//    
//    func setPrev(_ node: DoubleLinkedList) {
//        if let prev = self.prev {
//            node.prev = prev
//            prev.next = node
//        }
//        
//        self.prev = node
//        node.next = self
//    }
//    
//    func setPrev(_ key: ValueType) {
//        let node = DoubleLinkedList(value: key, prev: prev, next: self)
//        
//        if let prev = self.prev {
//            prev.next = node
//        }
//        
//        prev = node
//    }
//    
//    func remove() {
//        prev?.next = next
//        next?.prev = prev
//        
//        prev = nil
//        next = nil
//    }
//    
//    func removeNext() -> DoubleLinkedList? {
//        if let next = self.next {
//            next.prev = nil
//            next.next?.prev = self
//            self.next = next.next
//            next.next = nil
//            return next
//        }
//        
//        return nil
//    }
//    
//    func removePrev() -> DoubleLinkedList? {
//        if let prev = self.prev {
//            prev.next = nil
//            prev.prev?.next = self
//            self.prev = prev.prev
//            prev.prev = nil
//            return prev
//        }
//        
//        return nil
//    }
//    
//    func getFirst() -> DoubleLinkedList {
//        guard let prev = self.prev else { return self }
//        
//        return prev.getFirst()
//    }
//    
//    func getLast() -> DoubleLinkedList {
//        guard let next = self.next else { return self }
//        
//        return next.getLast()
//    }
//}
