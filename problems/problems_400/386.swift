// 386. Lexicographical Numbers
// Solved
// Medium
// Topics: Depth-First Search, Trie
// Companies

// Given an integer n, return all the numbers in the range [1, n] sorted in lexicographical order.
// 
// You must write an algorithm that runs in O(n) time and uses O(1) extra space. 

// Example 1:
// Input: n = 13
// Output: [1,10,11,12,13,2,3,4,5,6,7,8,9]
//
// Example 2: 
// Input: n = 2
// Output: [1,2]

// Constraints:
// 1 <= n <= 5 * 10^4


// Time complexity: O(n)
// Memory complexity: O(n)
class Solution {
    func lexicalOrder(_ n: Int) -> [Int] {
        var result = [Int]()
        
        for num in 1...9 where num <= n {
            getSubArray(num: num, maxNum: n, result: &result)
        }

        return result
    }

    func getSubArray(num: Int, maxNum: Int, result: inout [Int]) {
        result.append(num)

        for addedNum in 0...9 {
            let nextNum = num * 10 + addedNum

            if nextNum <= maxNum {
                getSubArray(num: nextNum, maxNum: maxNum, result: &result)
            } else {
                break
            }
            
        }
    }
}