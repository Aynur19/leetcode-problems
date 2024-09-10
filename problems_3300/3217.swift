// 3217. Delete Nodes From Linked List Present in Array
// Solved
// Medium
// Topics: Array, Hash Table, Linked List
// Companies

// You are given an array of integers nums and the head of a linked list. Return the head of the modified linked list 
// after removing all nodes from the linked list that have a value that exists in nums.

// Example 1:
// Input: nums = [1,2,3], head = [1,2,3,4,5]
// Output: [4,5]
// Explanation:
//      Remove the nodes with values 1, 2, and 3.
// 
// Example 2:
// Input: nums = [1], head = [1,2,1,2,1,2]
// Output: [2,2,2]
// Explanation:
//      Remove the nodes with value 1.
// 
// Example 3:
// Input: nums = [5], head = [1,2,3,4]
// Output: [1,2,3,4]
// Explanation:
//      No node has value 5.

// Constraints:
// 1 <= nums.length <= 10^5
// 1 <= nums[i] <= 10^5
// All elements in nums are unique.
// The number of nodes in the given list is in the range [1, 10^5].
// 1 <= Node.val <= 10^5
// The input is generated such that there is at least one node in the linked list that has a value not present in nums.


/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */

// Time complexity: O(n)
// Memory complexity: O(1)

 class Solution {
    func modifiedList(_ nums: [Int], _ head: ListNode?) -> ListNode? {
        let nums = Set(nums)
        var result = head

        while let val = result?.val, nums.contains(val) {
            let next = result?.next
            result?.next = nil
            result = next
        }

        var prev = result
        var current = prev?.next

        while let currentVal = current?.val {
            if nums.contains(currentVal) {
                prev?.next = nil
                let next = current?.next
                current?.next = nil
                current = next
            } else {
                prev?.next = current
                prev = prev?.next
                current = current?.next
            }
        }

        return result
    }
}