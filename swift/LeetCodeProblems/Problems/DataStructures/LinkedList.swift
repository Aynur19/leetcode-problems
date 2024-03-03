//
//  LinkedList.swift
//  LeetСodeProblems
//
//  Created by Aynur Nasybullin on 28.01.2024.
//

import Foundation

public final class LinkedList<ValueType> {
    public var value: ValueType
    public var next: LinkedList?
    
    public init(_ value: ValueType, _ next: LinkedList? = nil) {
        self.value = value
        self.next = next
    }
    
    public func addNext(_ next: LinkedList? = nil) {
        self.next = next
    }
    
    public func addNext(value: ValueType) {
        self.next = .init(value)
    }
    
    public func addPrev(_ prev: LinkedList) -> LinkedList {
        prev.next = self
        return prev
    }
    
    public func addPrev(value: ValueType) -> LinkedList {
        return LinkedList(value, self)
    }
}

extension LinkedList: CustomStringConvertible
where ValueType: CustomStringConvertible {
    public var description: String {
        var current = self
        var result: [String] = ["\(value)"]
        
        while true {
            if let tmp = current.next {
                result.append("\(tmp.value)")
                current = tmp
            } else { break }
        }
        
        return result.joined(separator: "<->")
    }
}
