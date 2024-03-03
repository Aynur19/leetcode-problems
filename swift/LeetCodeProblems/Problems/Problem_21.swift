//
//  Problem_21.swift
//  LeetCodeProblems
//
//  Created by Aynur Nasybullin on 16.10.2023.
//

// 21. Merge Two Sorted Lists
// URL: https://leetcode.com/problems/merge-two-sorted-lists/
// Easy

// You are given the heads of two sorted linked lists list1 and list2.

// Merge the two lists into one sorted list. The list should be made by splicing together the nodes of the first two lists.

// Return the head of the merged linked list.

 
// Example 1:
// Input: list1 = [1,2,4], list2 = [1,3,4]
// Output: [1,1,2,3,4,4]

// Example 2:
// Input: list1 = [], list2 = []
// Output: []

// Example 3:
// Input: list1 = [], list2 = [0]
// Output: [0]
 

// Constraints:
// The number of nodes in both lists is in the range [0, 50].
// -100 <= Node.val <= 100
// Both list1 and list2 are sorted in non-decreasing order.

extension Problems {
    // Approach: Linked List, Pointers
    // Time complexity: O(min(n1, n2)) => 6 ms
    // Space complexity: O(1) => 13.97 MB
    static func problem_21_mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        guard var list1 = list1 else { return list2 }
        guard var list2 = list2 else { return list1 }
        
        let result = ListNode()
        var current: ListNode? = result
        
        while true {
            if list1.val >= list2.val {
                current?.next = ListNode(list2.val)
                current = current?.next
                
                if let tmp = list2.next {
                    list2 = tmp
                } else {
                    current?.next = list1
                    return result.next
                }
            } else {
                current?.next = ListNode(list1.val)
                current = current?.next
                
                if let tmp = list1.next {
                    list1 = tmp
                } else {
                    current?.next = list2
                    return result.next
                }
            }
        }
        
        return result.next
    }
}
