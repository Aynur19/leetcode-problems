// 670. Maximum Swap
// Solved
// Medium
// Topics: Math, Greedy
// Companies
// 
// You are given an integer num. You can swap two digits at most once to get the maximum valued number.
// 
// Return the maximum valued number you can get.
// 
// Example 1:
// Input: num = 2736
// Output: 7236
// Explanation: Swap the number 2 and the number 7.
// 
// Example 2:
// Input: num = 9973
// Output: 9973
// Explanation: No swap.
// 
// Constraints:
// 0 <= num <= 10^8


// Time complexity: O(n)
// Memory complexity: O(n)
class Solution {
    func maximumSwap(_ num: Int) -> Int {
        guard num > 10 else { return num }

        var digits = String(num).compactMap { Int(String($0)) }
        var dict = digits.indices.reduce(into: [Int:Set<Int>]()) { result, idx in
            result[digits[idx], default: []].insert(idx)
        }

        for idx in 0..<(digits.count - 1) {
            let current = digits[idx]
            if let indexes = dict[current] {
                if indexes.count > 1 {
                    dict[digits[idx]]?.remove(idx)
                } else {
                    dict[digits[idx]] = nil
                }
            }

            var digit = 9
            while digit > digits[idx] {
                if let indexes = dict[digit] {
                    digits.swapAt(idx, indexes.max()!)
                    return Int(digits.map({ String($0) }).joined())!
                }

                digit -= 1
            }
        }

        return num
    }
}