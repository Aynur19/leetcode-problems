//
//  Problem_2.swift
//  LeetCodeProblems
//
//  Created by Aynur Nasybullin on 05.10.2023.
//

// 2. Add Two Numbers
// Medium
// Topics: Linked List, Math, Recursion

// You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order, and each of their nodes contains a single digit. Add the two numbers and return the sum as a linked list.

// You may assume the two numbers do not contain any leading zero, except the number 0 itself.

// Example 1:
// Input: l1 = [2,4,3], l2 = [5,6,4]
// Output: [7,0,8]
// Explanation: 342 + 465 = 807.

// Example 2:
// Input: l1 = [0], l2 = [0]
// Output: [0]

// Example 3:
// Input: l1 = [9,9,9,9,9,9,9], l2 = [9,9,9,9]
// Output: [8,9,9,9,0,0,0,1]
 
// Constraints:
// The number of nodes in each linked list is in the range [1, 100].
// 0 <= Node.val <= 9
// It is guaranteed that the list represents a number that does not have leading zeros.

import SwiftDataStructures

extension Problems {
    // Link: https://leetcode.com/problems/add-two-numbers/
    // Approach: Linked List
    // Time complexity: O(n) => 21 ms
    // Space complexity: O(n) => 15.01 MB
    public func problem_2_addTwoNumbers(_ l1: ListNode<Int>?, _ l2: ListNode<Int>?) -> ListNode<Int>? {
        guard var l1 = l1 else { return l2 }
        guard var l2 = l2 else { return l1 }
        
        let head = ListNode(0)
        var tmp = head
        var val = 0
        
        while true {
            val += l1.val + l2.val
            let tmpNext = ListNode(val % 10)
            tmp.next = tmpNext
            tmp = tmpNext
            val /= 10
            
            if let next = l1.next {
                l1 = next
            } else {
                tmp.next = l2.next
                break
            }
            
            if let next = l2.next {
                l2 = next
            } else {
                tmp.next = l1
                break
            }
        }
        
        while true {
            if let next = tmp.next {
                val += next.val
                let tmpNext = ListNode<Int>(val % 10, next: next.next)
               
                tmp.next = tmpNext
                tmp = tmpNext
                
                next.next = nil
                val /= 10
            } else { break }
        }
        
        if val > 0 {
            tmp.next = .init(val)
        }
        
        return head.next
    }
}

extension ProblemsTestCases {
    static func testsData_2() -> [(l1: ListNode<Int>?, l2: ListNode<Int>?, expected: ListNode<Int>?)] {
        var testsData = [(l1: ListNode<Int>?, l2: ListNode<Int>?, expected: ListNode<Int>?)]()
        
        testsData.append((
            l1: LinkedList([2, 4, 3]).getNode(0),
            l2: LinkedList([5, 6, 4]).getNode(0),
            expected: LinkedList([7, 0, 8]).getNode(0)
        ))
        
        testsData.append((
            l1: .init(0),
            l2: .init(0),
            expected: .init(0)
        ))
        
        testsData.append((
            l1: LinkedList([9, 9, 9, 9, 9, 9, 9]).getNode(0),
            l2: LinkedList([9, 9, 9, 9]).getNode(0),
            expected: LinkedList([8, 9, 9, 9, 0, 0, 0, 1]).getNode(0)
        ))
        
        testsData.append((
            l1: LinkedList([2, 4, 9]).getNode(0),
            l2: LinkedList([5, 6, 4, 9]).getNode(0),
            expected: LinkedList([7, 0, 4, 0, 1]).getNode(0)
        ))
        
        return testsData
    }
}
