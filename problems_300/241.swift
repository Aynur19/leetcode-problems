// 241. Different Ways to Add Parentheses
// Solved
// Medium
// Topics: Math, String, Dynamic Programming, Recursion, Memoization
// Companies

// Given a string expression of numbers and operators, return all possible results from computing all the different 
// possible ways to group numbers and operators. You may return the answer in any order.
// 
// The test cases are generated such that the output values fit in a 32-bit integer and the number of different results 
// does not exceed 104.
// 
//  
// 
// Example 1:
// Input: expression = "2-1-1"
// Output: [0,2]
// Explanation:
//      ((2-1)-1) = 0 
//      (2-(1-1)) = 2
//
// Example 2:
// Input: expression = "2*3-4*5"
// Output: [-34,-14,-10,-10,10]
// Explanation:
//      (2*(3-(4*5))) = -34 
//      ((2*3)-(4*5)) = -14 
//      ((2*(3-4))*5) = -10 
//      (2*((3-4)*5)) = -10 
//      (((2*3)-4)*5) = 10

// Constraints:
// 1 <= expression.length <= 20
// expression consists of digits and the operator '+', '-', and '*'.
// All the integer values in the input expression are in the range [0, 99].
// The integer values in the input expression do not have a leading '-' or '+' denoting the sign.


// Time complexity: O(n! * n^2)
// Memory complexity: O(n^2)
class Solution {
    func diffWaysToCompute(_ expression: String) -> [Int] {
        let operations = Set("+-*")
        
        func process(left: Int, right: Int, chars: ArraySlice<Character>, dict: inout[String:[Int]]) -> [Int] {
            let dictKey = String(right) + String(left)
            if let result = dict[dictKey] {
                return result
            }
            
            let expression = chars[left..<right]
            if let result = Int(String(expression)) {
                return [result]
            }
            
            var result = [Int]()
            for idx in left..<right {
                guard operations.contains(chars[idx]) else { continue }
                
                let resultL = process(left: left, right: idx, chars: chars, dict: &dict)
                let resultR = process(left: idx + 1, right: right, chars: chars, dict: &dict)
                
                let operation: ((Int, Int) -> Int) = switch chars[idx] {
                case "*": { $0 * $1 }
                case "-": { $0 - $1 }
                default: { $0 + $1 }
                }
                
                for numL in resultL {
                    for numR in resultR {
                        dict[dictKey, default: []].append(operation(numL, numR))
                    }
                }
            }
            
            return dict[dictKey]!
        }
        
        var chars = Array(expression)
        var dict = [String:[Int]]()
        return process(left: 0, right: chars.count, chars: chars[0..<chars.count], dict: &dict)
    }
}
