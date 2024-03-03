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

extension Problems {
    // Approach: Linked List
    // Time complexity: O(n) = 11
    // Space complexity: O(1) = 15.89
    static func problem_206_reverseList(_ head: ListNode?) -> ListNode? {
        guard let head = head, head.next != nil else { return head }

        var prev: ListNode? = head
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
    static func problem_206_reverseList2(_ head: ListNode?) -> ListNode? {
        guard let head = head, head.next != nil else { return head }
        var end: ListNode?
        
        func reverse(_ node: ListNode, next: ListNode?) {
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
