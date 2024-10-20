// 1106. Parsing A Boolean Expression
// Solved
// Hard
// Topics: String, Stack, Recursion
// Companies
// 
// Description:
//     A boolean expression is an expression that evaluates to either true or false. It can be in one of the following shapes:
//     - 't' that evaluates to true.
//     - 'f' that evaluates to false.
//     - '!(subExpr)' that evaluates to the logical NOT of the inner expression subExpr.
//     - '&(subExpr1, subExpr2, ..., subExprn)' that evaluates to the logical AND of the inner expressions subExpr1, 
//       subExpr2, ..., subExprn where n >= 1.
//     - '|(subExpr1, subExpr2, ..., subExprn)' that evaluates to the logical OR of the inner expressions subExpr1, 
//       subExpr2, ..., subExprn where n >= 1.
// 
//     Given a string expression that represents a boolean expression, return the evaluation of that expression.
// 
//     It is guaranteed that the given expression is valid and follows the given rules.
// 
// Example 1:
//     Input: expression = "&(|(f))"
//     Output: false
//     Explanation: 
//         First, evaluate |(f) --> f. The expression is now "&(f)".
//         Then, evaluate &(f) --> f. The expression is now "f".
//         Finally, return false.
// 
// Example 2:
//     Input: expression = "|(f,f,f,t)"
//     Output: true
//     Explanation: The evaluation of (false OR false OR false OR true) is true.
// 
// Example 3:
//     Input: expression = "!(&(f,t))"
//     Output: true
//     Explanation: 
//         First, evaluate &(f,t) --> (false AND true) --> false --> f. The expression is now "!(f)".
//         Then, evaluate !(f) --> NOT false --> true. We return true.
// 
// Constraints:
//     1 <= expression.length <= 2 * 10^4
//     expression[i] is one following characters: '(', ')', '&', '|', '!', 't', 'f', and ','.


// Time complexity: O(n)
// Memory complexity: O(n)
class Solution {
    func parseBoolExpr(_ expression: String) -> Bool {
        var iter = expression.makeIterator()
        return parseBoolExpr(curr: iter.next()!, iter: &iter)
    }

    func parseBoolExpr(curr: Character, iter: inout String.Iterator) -> Bool {
        let action: (_ first: Bool, _ second: Bool) -> Bool = switch curr {
            case "&": { $0 && $1 }
            case "|": { $0 || $1 }
            default: { !($0 && $1) }
        }

        var curExpr = true
        var isUsed = false
        
        while let next = iter.next(), next != ")" {
            switch next {
                case "!", "&", "|":
                    let subExpr = parseBoolExpr(curr: next, iter: &iter)
                    
                    curExpr = action(isUsed ? curExpr : subExpr, subExpr)
                case "f":
                    if isUsed {
                        curExpr = action(curExpr, false)
                    } else {
                        curExpr = action(false, false)
                    }
                case "t":
                    if isUsed {
                        curExpr = action(curExpr, true)
                    } else {
                        curExpr = action(true, true)
                    }
                default:
                    continue
            }
            isUsed = true
        }
            
        return curExpr
    }
}
