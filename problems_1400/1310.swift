// 1310. XOR Queries of a Subarray
// Solved
// Medium
// Topics: Array, Bit Manipulation, Prefix Sum
// Companies

// You are given an array arr of positive integers. You are also given the array queries where queries[i] = [lefti, righti].
// 
// For each query i compute the XOR of elements from lefti to righti (that is, arr[lefti] XOR arr[lefti + 1] 
// XOR ... XOR arr[righti] ).
// 
// Return an array answer where answer[i] is the answer to the ith query.

// Example 1:
// Input: arr = [1,3,4,8], queries = [[0,1],[1,2],[0,3],[3,3]]
// Output: [2,7,14,8] 
// Explanation: 
//      The binary representation of the elements in the array are:
//      1 = 0001 
//      3 = 0011 
//      4 = 0100 
//      8 = 1000 
//      The XOR values for queries are:
//      [0,1] = 1 xor 3 = 2 
//      [1,2] = 3 xor 4 = 7 
//      [0,3] = 1 xor 3 xor 4 xor 8 = 14 
//      [3,3] = 8
//
// Example 2:
// Input: arr = [4,8,2,10], queries = [[2,3],[1,3],[0,0],[0,3]]
// Output: [8,0,4,4]

// Constraints:
// 1 <= arr.length, queries.length <= 3 * 10^4
// 1 <= arr[i] <= 10^9
// queries[i].length == 2
// 0 <= left_i <= right_i < arr.length


// Time complexity: O(n)
// Memory complexity: O(n)
class Solution {
    func xorQueries(_ arr: [Int], _ queries: [[Int]]) -> [Int] {
        var xors = arr
        var total = 0

        for idx in arr.indices {
            total ^= arr[idx]
            xors[idx] = total
        }

        var result = Array(repeating: 0, count: queries.count)
        for idx in result.indices {
            let x = queries[idx][0]
            let y = queries[idx][1]

            result[idx] = xors[y] ^ (x == 0 ? 0 : xors[x - 1])
        }

        return result
    }
}