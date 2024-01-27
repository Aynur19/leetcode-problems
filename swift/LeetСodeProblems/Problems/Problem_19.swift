//
//  Problem_19.swift
//  LeetCodeProblems
//
//  Created by Aynur Nasybullin on 16.10.2023.
//

// 19. Remove Nth Node From End of List
// Medium

// Given the head of a linked list, remove the nth node from the end of the list and return its head.

 
// Example 1:
// Input: head = [1,2,3,4,5], n = 2
// Output: [1,2,3,5]

// Example 2:
// Input: head = [1], n = 1
// Output: []

// Example 3:
// Input: head = [1,2], n = 1
// Output: [1]
 

// Constraints:
// The number of nodes in the list is sz.
// 1 <= sz <= 30
// 0 <= Node.val <= 100
// 1 <= n <= sz

extension Problems {
    // Approach: Linked List
    // Time complexity: O(n) => 0 ms
    // Space complexity: O(1) => 13.93 MB
    static func problem_19_removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        if head?.next == nil, n == 1 { return nil }
        var tmp = head
        var count = 0
        
        while tmp != nil {
            count += 1
            tmp = tmp?.next
        }
        
        count -= n + 1
        if count < 0 { return head?.next }
        
        tmp = head
        while count > 0 {
            tmp = tmp?.next
            count -= 1
        }
    
        let tmp2 = tmp?.next
        tmp?.next = tmp?.next?.next
        tmp2?.next = nil
        
        return head
    }
}

