//
//  Problem_1669.swift
//  LeetCodeProblems
//
//  Created by Aynur Nasybullin on 20.03.2024.
//

//  1669. Merge In Between Linked Lists
//  Medium
//  Topics: Linked List

//  You are given two linked lists: list1 and list2 of sizes n and m respectively.
//  
//  Remove list1's nodes from the ath node to the bth node, and put list2 in their place.
//  
//  The blue edges and nodes in the following figure indicate the result:
//
//  Build the result list and return its head.

//  Example 1:
//  Input: list1 = [10,1,13,6,9,5], a = 3, b = 4, list2 = [1000000,1000001,1000002]
//  Output: [10,1,13,1000000,1000001,1000002,5]
//  Explanation: We remove the nodes 3 and 4 and put the entire list2 in their place. 
//  The blue edges and nodes in the above figure indicate the result.
//
//  Example 2:
//  Input: list1 = [0,1,2,3,4,5,6], a = 2, b = 5, list2 = [1000000,1000001,1000002,1000003,1000004]
//  Output: [0,1,1000000,1000001,1000002,1000003,1000004,6]
//  Explanation: The blue edges and nodes in the above figure indicate the result.

//  Constraints:
//  3 <= list1.length <= 10^4
//  1 <= a <= b < list1.length - 1
//  1 <= list2.length <= 10^4


import SwiftDataStructures


extension Problems {
    // MARK: LeetCode Problem 1669. Merge In Between Linked Lists
    // Link: https://leetcode.com/problems/merge-in-between-linked-lists/
    // Approach: Linked List
    // Time complexity: O(n) => 387 ms
    // Space complexity: O(1) => 18.54 MB
    public func problem_1669_mergeInBetween(
        _ list1: ListNode<Int>?,
        _ a: Int,
        _ b: Int,
        _ list2: ListNode<Int>?
    ) -> ListNode<Int>? {
        guard list1 != nil else { return list2 }
        guard list2 != nil else { return list1 }
        
        var idx = -1
        let head = ListNode<Int>(0, next: list1)
        var tmp = head
                
        func getNode(iter to: Int) -> ListNode<Int>? {
            while idx < to {
                if let next = tmp.next {
                    tmp = next
                } else {
                    assertionFailure("Linked list node list1 at index `a` was not found")
                    return nil
                }
                
                idx += 1
            }
            
            return tmp
        }
        
        guard var leftNode = getNode(iter: a - 1) else { return nil }
        guard let rightNode = getNode(iter: b) else { return nil }
        
        leftNode.next = list2
        
        while true {
            if let next = leftNode.next {
                leftNode = next
            } else { break }
        }
        
        leftNode.next = rightNode.next
        rightNode.next = nil
        
        return head.next
    }
}


extension ProblemsTestCases {
    static func testsData_1669() -> [(list1: ListNode<Int>?, a: Int, b: Int, list2: ListNode<Int>?, expected: ListNode<Int>?)] {
        var testsData = [(list1: ListNode<Int>?, a: Int, b: Int, list2: ListNode<Int>?, expected: ListNode<Int>?)]()
        
        testsData.append((
            list1: LinkedList([10, 1, 13, 6, 9, 5]).getNode(0),
            a: 3, b: 4,
            list2: LinkedList([1000000, 1000001, 1000002]).getNode(0),
            expected: LinkedList([10, 1, 13, 1000000, 1000001, 1000002, 5]).getNode(0)
        ))
        testsData.append((
            list1: LinkedList([0, 1, 2, 3, 4, 5, 6]).getNode(0),
            a: 2, b: 5,
            list2: LinkedList([1000000, 1000001, 1000002, 1000003, 1000004]).getNode(0),
            expected: LinkedList([0, 1, 1000000, 1000001, 1000002, 1000003, 1000004, 6]).getNode(0)
        ))
        
        return testsData
    }
}
