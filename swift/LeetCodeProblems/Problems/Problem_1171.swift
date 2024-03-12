//
//  Problem_1171.swift
//  LeetCodeProblems
//
//  Created by Aynur Nasybullin on 12.03.2024.
//

//  1171. Remove Zero Sum Consecutive Nodes from Linked List
//  Medium
//  Topics: Hash Table, Linked List

//  Given the head of a linked list, we repeatedly delete consecutive sequences of nodes that sum to 0 until there are no such sequences.
//  
//  After doing so, return the head of the final linked list.  You may return any such answer.
//
//  (Note that in the examples below, all sequences are serializations of ListNode objects.)

//  Example 1:
//  Input: head = [1,2,-3,3,1]
//  Output: [3,1]
//  Note: The answer [1,2,1] would also be accepted.
//
//  Example 2:
//  Input: head = [1,2,3,-3,4]
//  Output: [1,2,4]
//
//  Example 3:
//  Input: head = [1,2,3,-3,-2]
//  Output: [1]

//  Constraints:
//  The given linked list will contain between 1 and 1000 nodes.
//  Each node in the linked list has -1000 <= node.val <= 1000.


import SwiftDataStructures

extension Problems {
    typealias Node = ListNode<Int>
    
    func problem_1171_removeZeroSumSublists(_ head: ListNode<Int>?) -> ListNode<Int>? {
        guard var head = head else { return nil }
        head = .init(0, next: head)
        
        var sum = 0
        var dict = [Int:ListNode<Int>]() // [index:sum]
        
        func deleteNodes(_ node: ListNode<Int>, sum: Int) {
            var tmpNode = node
            var tmpSum = sum
            
            while true {
                if let next = tmpNode.next {
                    tmpNode = next
                    tmpSum += tmpNode.val
                } else { return }
                
                if tmpSum == sum { return }
                
                dict[tmpSum] = nil
            }
        }
        
        var tmp = head
        while true {
            sum += tmp.val
            
            if let node = dict[sum] {
                deleteNodes(node, sum: sum)
                
                node.next = tmp.next
                tmp.next = nil
                tmp = node
            } else {
                dict[sum] = tmp
            }
            
            if let next = tmp.next {
                tmp = next
            } else { break }
        }
        
        return head.next
    }
}

extension ProblemsTestCases {
    typealias TestCase_1171 = (head: ListNode<Int>?, expected: ListNode<Int>?)
    
    static func testsData_1171() -> [TestCase_1171] {
        var testsData = [TestCase_1171]()
        
        testsData.append((
            head: .init(1, next: .init(2, next: .init(-3, next: .init(3, next: .init(1))))),
            expected: .init(3, next: .init(1))
        ))
        
        testsData.append((
            head: .init(1, next: .init(2, next: .init(3, next: .init(-3, next: .init(4))))),
            expected: .init(1, next: .init(2, next: .init(4)))
        ))
        
        testsData.append((
            head: .init(1, next: .init(2, next: .init(3, next: .init(-3, next: .init(-2))))),
            expected: .init(1)
        ))
        
        return testsData
    }
}
