//
//  ListNode.swift
//  LeetCodeProblems
//
//  Created by Aynur Nasybullin on 08.09.2023.
//

import Foundation

public final class ListNodeOld {
    public var val: Int
    public var next: ListNodeOld?
    
    public init() {
        self.val = 0
        self.next = nil
    }
    
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
    
    public init(_ val: Int, _ next: ListNodeOld?) {
        self.val = val
        self.next = next
    }
}

extension ListNodeOld {
    static func equalListNodes(_ l1: ListNodeOld? , _ l2: ListNodeOld?) -> Bool {
        var l1 = l1, l2 = l2

        guard l1 != nil, l2 != nil else {
            if l1 == nil, l2 == nil { return true }
            else { return false }
        }
        
        while l1?.next != nil, l2?.next != nil {
            if l1?.val != l2?.val { return false }
            
            l1 = l1?.next
            l2 = l2?.next
        }
        
        guard l1 != nil, l2 != nil, l1?.val == l2?.val else { return false }
        guard l1?.next == nil, l2?.next == nil else { return false }
        
        return true
    }
}

extension ListNodeOld: CustomStringConvertible {
    public var description: String {
        var tmp: ListNodeOld? = self
        var description = "["
        
        while tmp != nil {
            if let val = tmp?.val {
                description += "\(String(describing: val)), "
            }
            tmp = tmp?.next
        }
        
        description.removeLast()
        description += "]"
        
        return description
    }
}
