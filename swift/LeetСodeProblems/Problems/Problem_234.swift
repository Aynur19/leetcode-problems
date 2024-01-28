//
//  Problem_234.swift
//  LeetСodeProblems
//
//  Created by Aynur Nasybullin on 28.01.2024.
//

//  234. Palindrome Linked List
//  Easy
//  Topics: Linked List, Two Pointers, Stack, Recursion

//  Given the head of a singly linked list, return true if it is a palindrome or false otherwise.

//  Example 1:
//  Input: head = [1,2,2,1]
//  Output: true
//
//  Example 2:
//  Input: head = [1,2]
//  Output: false
 
//  Constraints:
//  The number of nodes in the list is in the range [1, 105].
//  0 <= Node.val <= 9
 
//  Follow up: Could you do it in O(n) time and O(1) space?

extension Problems {
    // Approach: Linked List, Recursion
    // Time complexity: O(n) = 804
    // Space complexity: O(1) = 33.98
    static func problem_234_isPalindrome(_ head: ListNode?) -> Bool {
        guard var tmp = head else { return true }
        
        func check(_ node: ListNode) -> Bool {
            guard let next = node.next else { return true }
            
            let result = check(next) && tmp.val == next.val
            tmp = tmp.next!
            
            return result
        }
        
        return check(tmp)
    }
}
