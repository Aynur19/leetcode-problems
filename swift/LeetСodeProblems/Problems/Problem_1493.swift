//
//  Problem_1493.swift
//  LeetСodeProblems
//
//  Created by Aynur Nasybullin on 18.02.2024.
//

//  1493. Longest Subarray of 1's After Deleting One Element
//  Medium
//  Topics: Array, Dynamic Programming, Sliding Window

//  Given a binary array nums, you should delete one element from it.
//
//  Return the size of the longest non-empty subarray containing only 1's in the resulting array.
//  Return 0 if there is no such subarray.

//  Example 1:
//  Input: nums = [1,1,0,1]
//  Output: 3
//  Explanation: After deleting the number in position 2, [1,1,1] contains 3 numbers with value of 1's.
//
//  Example 2:
//  Input: nums = [0,1,1,1,0,1,1,0,1]
//  Output: 5
//  Explanation: After deleting the number in position 4, [0,1,1,1,1,1,0,1] longest subarray with value of 1's is [1,1,1,1,1].
//
//  Example 3:
//  Input: nums = [1,1,1]
//  Output: 2
//  Explanation: You must delete one element.
 
//  Constraints:
//  1 <= nums.length <= 10^5
//  nums[i] is either 0 or 1.

extension Problems {
    // Approach: Counting
    // Time complexity: O(n) = 111 ms
    // Space complexity: O(n) = 18.72 MB
    static func problem_1493_longestSubarray(_ nums: [Int]) -> Int {
        guard nums.count > 1 else { return 0 }
        
        var zerosIdxs = [Int]()
        for idx in nums.indices {
            if nums[idx] == 0 {
                zerosIdxs.append(idx)
            }
        }
        
        if zerosIdxs.isEmpty { return nums.count - 1 }
        
        var result = 0
        var leftSize = zerosIdxs[0]
        var rightSize = 0
        
        for idx in 1..<zerosIdxs.count {
            rightSize = zerosIdxs[idx] - zerosIdxs[idx - 1] - 1
            result = max(result, leftSize + rightSize)
            leftSize = rightSize
        }
        
        return max(result, leftSize + (nums.count - zerosIdxs[zerosIdxs.count - 1] - 1))
    }
    
    // Approach: Counting
    // Time complexity: O() = 114 ms
    // Space complexity: O() = 18.26 MB
    static func problem_1493_longestSubarray2(_ nums: [Int]) -> Int {
        guard nums.count > 1 else { return 0 }
        
        var result = 0
        var size = 0
        var zeroIdx = -1
        var zeros = 0
        
        for idx in nums.indices {
            if nums[idx] == 1 {
                size += 1
            } else {
                zeros += 1
                size = idx - zeroIdx - 1
                zeroIdx = idx
            }
            
            result = max(result, size)
        }
        
        if zeros == 1 { return nums.count - 1 }
        if zeroIdx == -1 { return result - 1 }
        
        return result
    }
}
