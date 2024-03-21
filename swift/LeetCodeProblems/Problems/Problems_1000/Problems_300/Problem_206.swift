//
//  Problem_206.swift
//  LeetСodeProblems
//
//  Created by Aynur Nasybullin on 28.01.2024.
//

//  206. Reverse Linked List
//  Easy
//  Topics: Linked List, Recursion

//  Given the head of a singly linked list, reverse the list, and return the reversed list.

//  Example 1:
//  Input: head = [1,2,3,4,5]
//  Output: [5,4,3,2,1]
//
//  Example 2:
//  Input: head = [1,2]
//  Output: [2,1]
//
//  Example 3:
//  Input: head = []
//  Output: []
 
//  Constraints:
//  The number of nodes in the list is the range [0, 5000].
//  -5000 <= Node.val <= 5000
 
//  Follow up: A linked list can be reversed either iteratively or recursively. Could you implement both?


import SwiftDataStructures

// MARK: LeetCode Problem 206. Reverse Linked List
// Link: https://leetcode.com/problems/3sum/
extension Problems {
    // Approach: Linked List
    // Time complexity: O(n) = 3
    // Space complexity: O(1) = 15.35
    public func problem_206_reverseList(_ head: ListNode<Int>?) -> ListNode<Int>? {
        guard let head = head, head.next != nil else { return head }

        var prev: ListNode<Int>? = head
        var current = head.next

        while current != nil {
            let tmp = current?.next
            current?.next = prev

            prev = current
            current = tmp
        }
        head.next = nil

        return prev
    }
    
    
    // Approach: Recursion
    // Time complexity: O(n) = 15
    // Space complexity: O(1) = 16.10
    public func problem_206_reverseList_2(_ head: ListNode<Int>?) -> ListNode<Int>? {
        guard let head = head, head.next != nil else { return head }
        var end: ListNode<Int>?
        
        func reverse(_ node: ListNode<Int>, next: ListNode<Int>?) {
            guard let next = next else {
                end = node
                return
            }
            
            node.next = nil
            reverse(next, next: next.next)
            
            next.next = node
        }
        
        reverse(head, next: head.next)
        return end
    }
}


extension ProblemsTestCases {
    static func testsData_206() -> [(head: ListNode<Int>?, expected: ListNode<Int>?)] {
        var testsData = [(head: ListNode<Int>?, expected: ListNode<Int>?)]()
        
        testsData.append((
            head: LinkedList([1, 2, 3, 4, 5]).getNode(0),
            expected: LinkedList([5, 4, 3, 2, 1]).getNode(0)
        ))
        testsData.append((
            head: .init(1, next: .init(2)),
            expected: .init(2, next: .init(1))
        ))
        testsData.append((head: nil, expected: nil))
        
        return testsData
    }
}
