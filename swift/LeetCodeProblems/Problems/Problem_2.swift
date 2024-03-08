//
//  Problem_2.swift
//  LeetCodeProblems
//
//  Created by Aynur Nasybullin on 05.10.2023.
//

// 2. Add Two Numbers
// Medium
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

extension Problems {
    // Approach: Linked List
    // Time complexity: O(max(n1, n2)) => 27 ms
    // Space complexity: O(max(n1, n2)) => 14.02 MB
    static func problem_2_addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        guard let l1 = l1 else { return l2 }
        guard let l2 = l2 else { return l1 }
        
        func addNode(_ current: inout ListNode?, _ sum: inout Int) {
            current?.next = ListNode(sum % 10)
            current = current?.next
            
            sum /= 10
        }
        
        let head = ListNode()
        var current: ListNode? = head
        var current1: ListNode? = l1
        var current2: ListNode? = l2
        var sum = 0
        
        while current1 != nil, current2 != nil {
            sum += current1!.val + current2!.val
            
            addNode(&current, &sum)
            
            current1 = current1?.next
            current2 = current2?.next
        }
        
        current1 = current1 ?? current2
        while current1 != nil {
            sum += current1!.val
            
            addNode(&current, &sum)
            
            current1 = current1?.next
        }
        
        if sum > 0 {
            current?.next = ListNode(sum)
        }
        
        return head.next
    }
}

extension ProblemsTestCases {
    typealias TestCase_2 = (l1: ListNode?, l2: ListNode?, expected: ListNode?)
     
    static func testsData_2() -> [TestCase_2] {
        var testsData = [TestCase_2]()
        
        testsData.append((
            l1: ListNode(2, .init(4, .init(3))),
            l2: ListNode(5, .init(6, .init(4))),
            expected: ListNode(7, .init(0, .init(8)))
        ))
        
        testsData.append((
            l1: ListNode(0),
            l2: ListNode(0),
            expected: ListNode(0)
        ))
        
        testsData.append((
            l1: ListNode(9, .init(9, .init(9, .init(9, .init(9, .init(9, .init(9))))))),
            l2: ListNode(9, .init(9, .init(9, .init(9)))),
            expected: ListNode(8, .init(9, .init(9, .init(9, .init(0, .init(0, .init(0, .init(1))))))))
        ))
        
        testsData.append((
            l1: ListNode(2, .init(4, .init(9))),
            l2: ListNode(5, .init(6, .init(4, .init(9)))),
            expected: ListNode(7, .init(0, .init(4, .init(0, .init(1)))))
        ))
        
        return testsData
    }
}
