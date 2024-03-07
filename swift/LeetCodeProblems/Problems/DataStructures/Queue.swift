//
//  Queue.swift
//  LeetСodeProblems
//
//  Created by Aynur Nasybullin on 28.01.2024.
//

import Foundation

public final class Queue<ValueType> {
    private var list: LinkedList2<ValueType>?
    private var end: LinkedList2<ValueType>?
    
    init() { }
    
    init(_ value: ValueType) {
        self.list = LinkedList2(value)
        self.end = self.list
    }
    
    var isEmpty: Bool { list == nil }
    
    func peek() -> ValueType? { list?.value }
    
    func enqueue(_ value: ValueType) {
        if list != nil {
            end?.next = .init(value)
            end = end?.next
            return
        }
        
        list = .init(value)
        end = list
    }
    
    func dequeue() -> ValueType? {
        let first = list
        let second = list?.next
        let value = first?.value
        
        first?.next = nil
        list = second
        
        if list == nil {
            end = nil
        }
        
        return value
    }
}

//extension Queue {
//    func pushBack() -> ValueType? {
//        let
//    }
//}

extension Queue: CustomStringConvertible
where ValueType: CustomStringConvertible {
    public var description: String {
        return list?.description ?? "[]"
    }
}
