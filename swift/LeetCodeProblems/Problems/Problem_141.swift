//
//  Problem_141.swift
//  LeetCodeProblems
//
//  Created by Aynur Nasybullin on 18.01.2024.
//

//  141. Linked List Cycle
//  Easy
//  Topics: Hash Table, Linked List, Two Pointers

//  Given head, the head of a linked list, determine if the linked list has a cycle in it.
//
//  There is a cycle in a linked list if there is some node in the list that can be reached again
//  by continuously following the next pointer. Internally, pos is used to denote the index
//  of the node that tail's next pointer is connected to. Note that pos is not passed as a parameter.
//
//  Return true if there is a cycle in the linked list. Otherwise, return false.

//  Example 1:
//  Input: head = [3,2,0,-4], pos = 1
//  Output: true
//  Explanation: There is a cycle in the linked list, where the tail connects to the 1st node (0-indexed).
//
//  Example 2:
//  Input: head = [1,2], pos = 0
//  Output: true
//  Explanation: There is a cycle in the linked list, where the tail connects to the 0th node.
//
//  Example 3:
//  Input: head = [1], pos = -1
//  Output: false
//  Explanation: There is no cycle in the linked list.
 
//  Constraints:
//  The number of the nodes in the list is in the range [0, 10^4].
//  -10^5 <= Node.val <= 10^5
//  pos is -1 or a valid index in the linked-list.
//
//  Follow up: Can you solve it using O(1) (i.e. constant) memory?


extension ListNodeOld: Equatable {
    public static func == (lhs: ListNodeOld, rhs: ListNodeOld) -> Bool {
        ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
    }
}

extension ListNodeOld: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(ObjectIdentifier(self))
    }
}

// help: https://www.youtube.com/watch?v=4mxXON0cJtg
extension Problems {
    // Approach: Hashing, Set
    // Time complexity: O(n) = 61 ms
    // Space complexity: O(n) = 16.75 MB
    static func problem_141_hasCycle(_ head: ListNodeOld?) -> Bool {
        guard var node = head else { return false }
        
        var set: Set<ListNodeOld> = [node]
        
        while true {
            if let next = node.next {
                if !set.insert(next).inserted {
                    return true
                }
                
                node = next
            } else {
                return false
            }
        }
    }
    
    
    // Approach: Quick, Slow Iteration
    // Time complexity: O(n) = 63 ms
    // Space complexity: O(1) = 16.15 MB
    static func problem_141_hasCycle2(_ head: ListNodeOld?) -> Bool {
        if head == nil { return false }
        
        var nodePtr1: ListNodeOld? = head?.next
        var nodePtr2: ListNodeOld? = head?.next?.next
        
        while nodePtr1 != nil, nodePtr2 != nil {
            if nodePtr1 == nodePtr2 { return true }
            
            nodePtr1 = nodePtr1?.next
            nodePtr2 = nodePtr2?.next?.next
        }
        
        return false
    }
}
