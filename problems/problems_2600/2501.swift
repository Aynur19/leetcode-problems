// 2501. Longest Square Streak in an Array
// Solved
// Medium
// Topics: Array, Hash Table, Binary Search, Dynamic Programming, Sorting
// Companies
// 
// Description:
//     You are given an integer array nums. A subsequence of nums is called a square streak if:
//     - The length of the subsequence is at least 2, and 
//     - after sorting the subsequence, each element (except the first element) is the square of the previous number.
// 
//     Return the length of the longest square streak in nums, or return -1 if there is no square streak.
// 
//     A subsequence is an array that can be derived from another array by deleting some or no elements without changing 
//     the order of the remaining elements.
// 
// Example 1:
//     Input: nums = [4,3,6,16,8,2]
//     Output: 3
//     Explanation: Choose the subsequence [4,16,2]. After sorting it, it becomes [2,4,16].
//         - 4 = 2 * 2.
//         - 16 = 4 * 4.
//         Therefore, [4,16,2] is a square streak.
//         It can be shown that every subsequence of length 4 is not a square streak.
// 
// Example 2:
//     Input: nums = [2,3,5,6,7]
//     Output: -1
//     Explanation: There is no square streak in nums so return -1.
// 
// Constraints:
//     2 <= nums.length <= 10^5
//     2 <= nums[i] <= 10^5


// Time complexity: O(n * log n)
// Memory complexity: O(n)
class Solution {
    func longestSquareStreak(_ nums: [Int]) -> Int {
        var nums = Set(nums).sorted { $0 < $1 }
        var dict = [Int: [Int]]()

        while !nums.isEmpty {
            let num = nums.removeLast()
            let num2num = num * num
            
            dict[num2num, default: []].append(num)
            dict[num] = dict[num2num]
            dict[num2num] = nil
        }

        let result = dict.values.max { $0.count < $1.count }!.count
        return result > 1 ? result : -1
    }
}