// 632. Smallest Range Covering Elements from K Lists
// Solved
// Hard
// Topics: Array, Hash Table, Greedy, Sliding Window, Sorting, Heap (Priority Queue)
// Companies

// You have k lists of sorted integers in non-decreasing order. 
// Find the smallest range that includes at least one number from each of the k lists.
// 
// We define the range [a, b] is smaller than range [c, d] if b - a < d - c or a < c if b - a == d - c.

// Example 1:
// Input: nums = [[4,10,15,24,26],[0,9,12,20],[5,18,22,30]]
// Output: [20,24]
// Explanation: 
//     List 1: [4, 10, 15, 24,26], 24 is in range [20,24].
//     List 2: [0, 9, 12, 20], 20 is in range [20,24].
//     List 3: [5, 18, 22, 30], 22 is in range [20,24].
// 
// Example 2:
// Input: nums = [[1,2,3],[1,2,3],[1,2,3]]
// Output: [1,1]

// Constraints:
// nums.length == k
// 1 <= k <= 3500
// 1 <= nums[i].length <= 50
// -10^5 <= nums[i][j] <= 10^5
// nums[i] is sorted in non-decreasing order.


// Time complexity: O(n * log + n)
// Memoru complexity: O(n)
import Collections

class Solution {
    func smallestRange(_ nums: [[Int]]) -> [Int] {
        let heap = Heap(items: nums
            .indices.map { index in
                nums[index].map { Pair(index: index, value: $0) } 
            }
            .flatMap { $0 }
        ) { (parent: Pair, child: Pair) in
            parent.value < child.value
        }

        var result = [Int]()
        var deque = Deque<Pair>([])
        var dict = [Int:Int]()

        while let next = heap.pop() {
            dict[next.index, default: 0] += 1
            deque.append(next)

            if dict.count == nums.count {
                var first = deque.first!

                while let countFirst = dict[first.index], countFirst > 1 {
                    _ = deque.popFirst()
                    dict[first.index] = countFirst - 1
                    first = deque.first!
                }
                
                if result.isEmpty {
                    result.append(first.value)
                    result.append(next.value)
                    continue
                }

                if next.value - first.value < result[1] - result[0] {
                    result[0] = first.value
                    result[1] = next.value
                }
            }
        }

        return result
    }
}

struct Pair {
    let index: Int
    let value: Int
}