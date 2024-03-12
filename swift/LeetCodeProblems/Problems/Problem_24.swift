//
//  Problem_24.swift
//  LeetCodeProblems
//
//  Created by Aynur Nasybullin on 18.10.2023.
//

// 24. Swap Nodes in Pairs
// Medium
// URL: https://leetcode.com/problems/swap-nodes-in-pairs/
// Topics: Linked List, Recursion

// Given a linked list, swap every two adjacent nodes and return its head. You must solve the problem without modifying the values in the list's nodes (i.e., only nodes themselves may be changed.)

 
// Example 1:
// Input: head = [1,2,3,4]
// Output: [2,1,4,3]

// Example 2:
// Input: head = []
// Output: []

// Example 3:
// Input: head = [1]
// Output: [1]
 

// Constraints:
// The number of nodes in the list is in the range [0, 100].
// 0 <= Node.val <= 100

extension Problems {
    // Approach: Linked List, Recursion
    // Time complexity: O(n) = 3 ms
    // Space complexity: O(1) = 14.17 MB
    static func problem_24_swapPairs(_ head: ListNodeOld?) -> ListNodeOld? {
        func swapPairs(_ head: ListNodeOld?) -> ListNodeOld? {
            guard head != nil && head?.next != nil else { return head }
            
            var result: ListNodeOld?
            let end = swapPairs(head?.next?.next)
            
            result = head?.next
            result?.next = head
            result?.next?.next = end
            
            return result
        }
        
        return swapPairs(head)
    }
}
