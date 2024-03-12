//
//  Problem_25.swift
//  LeetCodeProblems
//
//  Created by Aynur Nasybullin on 18.10.2023.
//

// 25. Reverse Nodes in k-Group
// Hard
// URL: https://leetcode.com/problems/reverse-nodes-in-k-group/
// Topics: Linked List, Recursion

// Given the head of a linked list, reverse the nodes of the list k at a time, and return the modified list.

// k is a positive integer and is less than or equal to the length of the linked list. If the number of nodes is not a multiple of k then left-out nodes, in the end, should remain as it is.

// You may not alter the values in the list's nodes, only nodes themselves may be changed.

 
// Example 1:
// Input: head = [1,2,3,4,5], k = 2
// Output: [2,1,4,3,5]

// Example 2:
// Input: head = [1,2,3,4,5], k = 3
// Output: [3,2,1,4,5]
 

// Constraints:
// The number of nodes in the list is n.
// 1 <= k <= n <= 5000
// 0 <= Node.val <= 1000
 

// Follow-up: Can you solve the problem in O(1) extra memory space?

extension Problems {
    // Approach: Linked List, Recursion
    // Time complexity: O(n) = 29 ms
    // Space complexity: O(1) = 14.82 MB
    static func problem_25_reverseKGroup(_ head: ListNodeOld?, _ k: Int) -> ListNodeOld? {
        guard let head = head else { return nil }
        
        var tmp: ListNodeOld? = head
        var size = 1
        while tmp?.next != nil {
            tmp = tmp?.next
            size += 1
        }
        
        func reverseKGroup(_ head: ListNodeOld?, _ k: Int, _ size: Int) -> ListNodeOld? {
            guard size >= k else { return head }
            
            var ptr1 = head
            var ptr2 = ptr1?.next
            var ptr3: ListNodeOld?
            
            for _ in 1..<k {
                ptr3 = ptr2?.next
                ptr2?.next = ptr1
                
                ptr1 = ptr2
                ptr2 = ptr3
            }
            
            head?.next = reverseKGroup(ptr2, k, size - k)
            
            return ptr1
        }
        
        return reverseKGroup(head, k, size)
    }
}
