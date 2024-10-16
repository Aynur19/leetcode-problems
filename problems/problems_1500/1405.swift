// 1405. Longest Happy String
// Solved
// Medium
// Topics: String, Greedy, Heap (Priority Queue)
// Companies

// A string s is called happy if it satisfies the following conditions:
// - s only contains the letters 'a', 'b', and 'c'.
// - s does not contain any of "aaa", "bbb", or "ccc" as a substring.
// - s contains at most a occurrences of the letter 'a'.
// - s contains at most b occurrences of the letter 'b'.
// - s contains at most c occurrences of the letter 'c'.
// 
// Given three integers a, b, and c, return the longest possible happy string. 
// If there are multiple longest happy strings, return any of them. If there is no such string, return the empty string "".
// 
// A substring is a contiguous sequence of characters within a string.

// Example 1:
// Input: a = 1, b = 1, c = 7
// Output: "ccaccbcc"
// Explanation: "ccbccacc" would also be a correct answer.
// 
// Example 2:
// Input: a = 7, b = 1, c = 0
// Output: "aabaa"
// Explanation: It is the only correct answer in this case.

// Constraints:
// 0 <= a, b, c <= 100
// a + b + c > 0


// Tome complexity: O(n * log n)
// Memory complacity: O(1)
class Solution {
    func longestDiverseString(_ a: Int, _ b: Int, _ c: Int) -> String {
        let heap = Heap(
            items: [
                Pair(char: "a", count: a),
                Pair(char: "b", count: b),
                Pair(char: "c", count: c)
            ]
            .compactMap { $0.count > 0 ? $0 : nil }
        ) { (parent: Pair, child: Pair) in
            parent.count > child.count
        }

        var result = [Character]()
        while var pair = heap.pop() {
            guard var pair2 = heap.pop() else {
                result.append(contentsOf: [Character](repeating: pair.char, count: min(2, pair.count)))
                break
            } 

            let count: Int 
            let count2: Int
            if pair.count > pair2.count {
                count = min(2, pair.count)
                count2 = 1
            } else {
                count = 1
                count2 = min(2, pair2.count)
            }

            result.append(contentsOf: [Character](repeating: pair.char, count: count))
            result.append(contentsOf: [Character](repeating: pair2.char, count: count2))

            pair.count -= count
            pair2.count -= count2

            if pair.count > 0 {
                heap.push(pair)
            }

            if pair2.count > 0 {
                heap.push(pair2)
            }
        }

        return String(result)
    }
}

struct Pair {
    let char: Character
    var count: Int
}