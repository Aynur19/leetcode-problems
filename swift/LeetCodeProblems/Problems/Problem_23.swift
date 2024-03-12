//
//  Problem_23.swift
//  LeetCodeProblems
//
//  Created by Aynur Nasybullin on 16.10.2023.
//

// 23. Merge k Sorted Lists
// Hard
// URL: https://leetcode.com/problems/merge-k-sorted-lists/description/
// Topics: Linked List, Divide and Conquer, Heap (Priority Queue), Merge Sort

// You are given an array of k linked-lists lists, each linked-list is sorted in ascending order.

// Merge all the linked-lists into one sorted linked-list and return it.

 
// Example 1:
// Input: lists = [[1, 4, 5], [1, 3, 4], [2, 6]]
// Output: [1, 1, 2, 3, 4, 4, 5, 6]
// Explanation: The linked-lists are:
//   [
//     1 -> 4 -> 5,
//     1 -> 3 -> 4,
//     2 -> 6
//   ]

// merging them into one sorted list:
//   1 -> 1 -> 2 -> 3 -> 4 -> 4 -> 5 -> 6

// Example 2:
// Input: lists = []
// Output: []

// Example 3:
// Input: lists = [[]]
// Output: []
 

// Constraints:
// k == lists.length
// 0 <= k <= 10^4
// 0 <= lists[i].length <= 500
// -10^4 <= lists[i][j] <= 10^4
// lists[i] is sorted in ascending order.
// The sum of lists[i].length will not exceed 10^4.

extension Problems {
    // Approach: Hash Table, Linked List
    // Time complexity: O(m * n)
    // Space complexity: O(m * n)
    static func problem_23_mergeKLists(_ lists: [ListNodeOld?]) -> ListNodeOld? {
        guard !lists.isEmpty else { return nil }

        let result = ListNodeOld()
        var dict: [Int:[ListNodeOld]] = [:]
        var tmp: ListNodeOld?
        
        for list in lists {
            tmp = list
            
            while tmp != nil {
                if let val = tmp?.val,
                   let currentList = tmp {
                    dict[val, default: []].append(currentList)
                    tmp = tmp?.next
                }
            }
        }
        
        let keys = Array(dict.keys.sorted())
        tmp = result
        
        for key in keys {
            dict[key]?.forEach { ln in
                tmp?.next = ln
                tmp = tmp?.next
            }
        }
        
        return result.next
    }
}
