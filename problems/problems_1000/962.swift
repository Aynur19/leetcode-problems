// 962. Maximum Width Ramp
// Solved
// Medium
// Topics: Array, Stack, Monotonic Stack
// Companies

// A ramp in an integer array nums is a pair (i, j) for which i < j and nums[i] <= nums[j]. The width of such a ramp is j - i.
// 
// Given an integer array nums, return the maximum width of a ramp in nums. If there is no ramp in nums, return 0.

// Example 1:
// Input: nums = [6,0,8,2,1,5]
// Output: 4
// Explanation: The maximum width ramp is achieved at (i, j) = (1, 5): nums[1] = 0 and nums[5] = 5.
//
// Example 2:
// Input: nums = [9,8,1,0,1,9,4,0,4,1]
// Output: 7
// Explanation: The maximum width ramp is achieved at (i, j) = (2, 9): nums[2] = 1 and nums[9] = 1.

// Constraints:
// 2 <= nums.length <= 5 * 10^4
// 0 <= nums[i] <= 5 * 10^4


// Time complexity: O(n)
// Memory complexity: O(n)
class Solution {
    func maxWidthRamp(_ nums: [Int]) -> Int {
        let n = nums.count
        var startIds: [Int] = [0]

        for idx in 1..<n {
            if nums[idx] < nums[startIds.last!] { 
                startIds.append(idx) 
            }
        }

        var result = 0
        for idx in stride(from: n - 1, to: -1, by: -1) {
            while !startIds.isEmpty && nums[startIds.last!] <= nums[idx] {
                let start = startIds.popLast()!
                result = max(result, idx - start)
            }
        }
 
        return result
    }
}