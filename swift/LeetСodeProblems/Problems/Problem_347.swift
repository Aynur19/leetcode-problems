//
//  Problem_347.swift
//  LeetСodeProblems
//
//  Created by Aynur Nasybullin on 30.01.2024.
//

//  347. Top K Frequent Elements
//  Medium
//  Topics: Array, Hash Table, Divide and Conquer, Sorting, Heap (Priority Queue), Bucket Sort, Counting, Quickselect

//  Given an integer array nums and an integer k, return the k most frequent elements. You may return the answer in any order.

//  Example 1:
//  Input: nums = [1,1,1,2,2,3], k = 2
//  Output: [1,2]
//
//  Example 2:
//  Input: nums = [1], k = 1
//  Output: [1]
 
//  Constraints:
//  1 <= nums.length <= 10^5
//  -10^4 <= nums[i] <= 10^4
//  k is in the range [1, the number of unique elements in the array].
//  It is guaranteed that the answer is unique.
 
//  Follow up: Your algorithm's time complexity must be better than O(n log n), where n is the array's size.

//  help: https://www.youtube.com/watch?v=gamjygyIzg0&ab_channel=3.5%D0%B7%D0%B0%D0%B4%D0%B0%D1%87%D0%B8%D0%B2%D0%BD%D0%B5%D0%B4%D0%B5%D0%BB%D1%8E
extension Problems {
    // Approach: Hash Table, Sorting
    // Time complexity: O(n) = 80 ms
    // Space complexity: O(n) = 17.62 MB
    static func problem_347_topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        var dictCounts = [Int:Int]()
        nums.forEach { num in
            dictCounts[num, default: 0] += 1
        }
        
        var dictKeys = [Int:[Int]]()
        dictCounts.forEach { (key, value) in
            dictKeys[value, default: []].append(key)
        }

        let sortedDict = dictKeys.sorted { $0.key > $1.key }
        var result = [Int]()
        
        for (_, keys) in sortedDict {
            if result.count >= k {
                break
            }
            
            result.append(contentsOf: keys)
        }
        
        return result
    }
}
