//
//  Problem_1071.swift
//  LeetCodeProblems
//
//  Created by Aynur Nasybullin on 03.03.2024.
//

//  1071. Greatest Common Divisor of Strings
//  Easy
//  Topics: 

//  For two strings s and t, we say "t divides s" if and only if s = t + t + t + ... + t + t 
//  (i.e., t is concatenated with itself one or more times).
//
//  Given two strings str1 and str2, return the largest string x such that x divides both str1 and str2.

//  Example 1:
//  Input: str1 = "ABCABC", str2 = "ABC"
//  Output: "ABC"
//  
//  Example 2:
//  Input: str1 = "ABABAB", str2 = "ABAB"
//  Output: "AB"
//  
//  Example 3:
//  Input: str1 = "LEET", str2 = "CODE"
//  Output: ""

//  Constraints:
//  1 <= str1.length, str2.length <= 1000
//  str1 and str2 consist of English uppercase letters.

extension Problems {
    // Approach: Two Pointers
    // Time complexity: O(n) = 14 ms
    // Space complexity: O(n) = 16.43 MB
    static func problem_1071_gcdOfStrings(_ str1: String, _ str2: String) -> String {
        let nStr1 = str1.count
        let nStr2 = str2.count
        
        let chars1 = Array(str1)
        let chars2 = Array(str2)
        
        let minSize = min(nStr1, nStr2)
        if minSize == 0 { return "" }
        
        let uniqueChars = Set(str1)
        if Set(str2) != uniqueChars { return "" }
        if minSize == 1 { return String(uniqueChars) }
        
        var divider = 0
        var size = minSize
        var mask = nStr1 > nStr2 ? chars2[...] : chars1[...]
        let halfMinSize = minSize / 2
        
        var isValid = true
        while true {
            divider += 1
            
            if divider > halfMinSize { break }
            if minSize % divider != 0 { continue }
            
            size = minSize / divider
            mask = mask[0..<size]
            
            isValid = true
            for leftIdx in stride(from: 0, to: nStr1, by: +size) {
                let rightIdx = leftIdx + size - 1
                if rightIdx >= chars1.count || chars1[leftIdx..<(leftIdx + size)] != mask {
                    isValid = false
                    break
                }
            }
            
            if !isValid { continue }
            for leftIdx in stride(from: 0, to: nStr2, by: +size) {
                let rightIdx = leftIdx + size - 1
                if rightIdx >= chars2.count || chars2[leftIdx..<(leftIdx + size)] != mask {
                    isValid = false
                    break
                }
            }
            
            if isValid { break}
        }
        
        return isValid ? String(mask) : ""
    }
}
