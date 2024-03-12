//
//  LinkedList.swift
//  LeetСodeProblems
//
//  Created by Aynur Nasybullin on 28.01.2024.
//

//  707. Design Linked List
//  Medium
//  Topics: Linked List, Design

//  Design your implementation of the linked list. You can choose to use a singly or doubly linked list.
//  A node in a singly linked list should have two attributes: val and next. val is the value of the current node, 
//  and next is a pointer/reference to the next node.
//
//  If you want to use the doubly linked list, you will need one more attribute prev to indicate the previous node
//  in the linked list. Assume all nodes in the linked list are 0-indexed.
//
//  Implement the MyLinkedList class:
//  - MyLinkedList() Initializes the MyLinkedList object.
//  - int get(int index) Get the value of the indexth node in the linked list. If the index is invalid, return -1.
//  - void addAtHead(int val) Add a node of value val before the first element of the linked list.
//    After the insertion, the new node will be the first node of the linked list.
//  - void addAtTail(int val) Append a node of value val as the last element of the linked list.
//  - void addAtIndex(int index, int val) Add a node of value val before the indexth node in the linked list.
//    If index equals the length of the linked list, the node will be appended to the end of the linked list.
//    If index is greater than the length, the node will not be inserted.
//  - void deleteAtIndex(int index) Delete the indexth node in the linked list, if the index is valid.
//
//  Example 1:
//  Input
//      ["MyLinkedList", "addAtHead", "addAtTail", "addAtIndex", "get", "deleteAtIndex", "get"]
//      [[], [1], [3], [1, 2], [1], [1], [1]]
//  Output
//      [null, null, null, null, 2, null, 3]
//  Explanation
//      MyLinkedList myLinkedList = new MyLinkedList();
//      myLinkedList.addAtHead(1);
//      myLinkedList.addAtTail(3);
//      myLinkedList.addAtIndex(1, 2);    // linked list becomes 1->2->3
//      myLinkedList.get(1);              // return 2
//      myLinkedList.deleteAtIndex(1);    // now the linked list is 1->3
//      myLinkedList.get(1);              // return 3

//  Constraints:
//  0 <= index, val <= 1000
//  Please do not use the built-in LinkedList library.
//  At most 2000 calls will be made to get, addAtHead, addAtTail, addAtIndex and deleteAtIndex.

public final class LinkedListOld<ValueType>: ListProtocol {
    private class Node {
        var value: ValueType
        var next: Node?
        
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
    
extension LinkedListOld {
    func addAtHead(_ val: ValueType) {
        let newHead = Node(value: val)
        newHead.next = head
        head = newHead
        
        if end == nil {
            end = head
        }
        
        count += 1
    }
    
    func addAtTail(_ val: ValueType) {
        if let end = end {
            end.next = .init(value: val)
            self.end = end.next
        } else {
            self.head = .init(value: val)
            self.end = head
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
        
        guard let prev = getNode(index - 1) else { return false }
        
        let addedNode = Node(value: val)
        addedNode.next = prev.next
        prev.next = addedNode
        
        count += 1
        return true
    }
}
    
extension LinkedListOld {
    func removeAtHead() -> ValueType? {
        guard let head = head else { return nil }
        
        self.head = head.next
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
        
        guard let prevNode = getNode(index - 1) else { return nil }
        let nextNode = prevNode.next
        let removedValue = nextNode?.value
      
        prevNode.next = nextNode?.next
        nextNode?.next = nil
        
        count -= 1
        return removedValue
    }
}
    
extension LinkedListOld {
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

extension LinkedListOld: CustomStringConvertible
where ValueType: CustomStringConvertible {
    public var description: String {
        guard var tmp = head else { return "[]" }
        var result = ["[", "\(tmp.value)"]
        
        while true {
            if let next = tmp.next {
                result.append(" -> \(next.value)")
                tmp = next
            }
            else { break }
        }
        
        result.append("]")
        return result.joined()
    }
}


extension ProblemsTestCases {
    typealias TestCase_707 = [(command: String, args: [Int], expected: Int)]
    
    static func testsData_707() -> [TestCase_707] {
        var testsData = [TestCase_707]()
        
        testsData.append([
            (command: "MyLinkedList",   args: [], expected: 0),
            (command: "addAtHead",      args: [1], expected: 0),
            (command: "addAtTail",      args: [3], expected: 0),
            (command: "addAtIndex",     args: [1, 2], expected: 0),
            (command: "get",            args: [1], expected: 2),
            (command: "deleteAtIndex",  args: [1], expected: 0),
            (command: "get",            args: [1], expected: 3)
        ])
        
        testsData.append([
            (command: "MyLinkedList",   args: [], expected: 0),
            (command: "addAtHead",      args: [4], expected: 0),
            (command: "get",            args: [1], expected: -1),
            (command: "addAtHead",      args: [1], expected: 0),
            (command: "addAtHead",      args: [5], expected: 0),
            (command: "deleteAtIndex",  args: [3], expected: 0),
            (command: "addAtHead",      args: [7], expected: 0),
            (command: "get",            args: [3], expected: 4),
            (command: "get",            args: [3], expected: 4),
            (command: "get",            args: [3], expected: 4),
            (command: "addAtHead",      args: [1], expected: 0),
            (command: "deleteAtIndex",  args: [4], expected: 0)
        ])
        
        testsData.append([
            (command: "MyLinkedList",   args: [0], expected: 0),
            (command: "addAtHead",      args: [7], expected: 0),
            (command: "addAtHead",      args: [2], expected: 0),
            (command: "addAtHead",      args: [1], expected: 0),
            (command: "addAtIndex",     args: [3, 0], expected: 0),
            (command: "deleteAtIndex",  args: [2], expected: 0),
            (command: "addAtHead",      args: [6], expected: 0),
            (command: "addAtTail",      args: [4], expected: 0),
            (command: "get",            args: [4], expected: 4),
            (command: "addAtHead",      args: [4], expected: 0),
            (command: "addAtIndex",     args: [5, 0], expected: 0),
            (command: "addAtHead",      args: [6], expected: 0)
        ])
        
        testsData.append([
            (command: "MyLinkedList",   args: [], expected: 0),
            (command: "addAtTail",      args: [1], expected: 0),
            (command: "get",            args: [0], expected: 1)
        ])
        
        return testsData
    }
}
