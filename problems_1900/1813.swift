// 1813. Sentence Similarity III
// Solved
// Medium
// Topics: Array, Two Pointers, String
// Companies
// Hint

// You are given two strings sentence1 and sentence2, each representing a sentence composed of words. A sentence is 
// a list of words that are separated by a single space with no leading or trailing spaces. Each word consists of only 
// uppercase and lowercase English characters.
// 
// Two sentences s1 and s2 are considered similar if it is possible to insert an arbitrary sentence (possibly empty) 
// inside one of these sentences such that the two sentences become equal. Note that the inserted sentence must be 
// separated from existing words by spaces.
// 
// For example,
// 1) s1 = "Hello Jane" and s2 = "Hello my name is Jane" can be made equal by inserting "my name is" 
//    between "Hello" and "Jane" in s1.
// 2) s1 = "Frog cool" and s2 = "Frogs are cool" are not similar, since although there is a sentence "s are" inserted 
//    into s1, it is not separated from "Frog" by a space.
// 
// Given two sentences sentence1 and sentence2, return true if sentence1 and sentence2 are similar. Otherwise, return false.

// Example 1:
// Input: sentence1 = "My name is Haley", sentence2 = "My Haley"
// Output: true
// Explanation:
// sentence2 can be turned to sentence1 by inserting "name is" between "My" and "Haley".
// 
// Example 2:
// Input: sentence1 = "of", sentence2 = "A lot of words"
// Output: false
// Explanation:
// No single sentence can be inserted inside one of the sentences to make it equal to the other.
// 
// Example 3:
// Input: sentence1 = "Eating right now", sentence2 = "Eating"
// Output: true
// Explanation:
// sentence2 can be turned to sentence1 by inserting "right now" at the end of the sentence.

// Constraints:
// 1 <= sentence1.length, sentence2.length <= 100
// sentence1 and sentence2 consist of lowercase and uppercase English letters and spaces.
// The words in sentence1 and sentence2 are separated by a single space.


// Help: https://algo.monster/liteproblems/1813
// Time complexity: O(min(n, m))
// Memory complexity: O(n) (string -> [character]) or O(1) if iteration only string
class Solution {
    func areSentencesSimilar(_ sentence1: String, _ sentence2: String) -> Bool {
        guard !sentence1.isEmpty, !sentence2.isEmpty else { return true }
        let chars1 = Array(sentence1)
        let chars2 = Array(sentence2)

        guard chars1[0] == chars2[0] || chars1[chars1.count - 1] == chars2[chars2.count - 1] else { return false }

        if chars1.count >= chars2.count {
            return areSentencesSimilar(chars1, chars2)
        } else {
            return areSentencesSimilar(chars2, chars1)
        }
    }

    func areSentencesSimilar(_ chars1: [Character], _ chars2: [Character]) -> Bool {
        let (n1, n2) = (chars1.count, chars2.count)
        var count = 0

        var (ptr1, ptr2) = (0, 0)
        while ptr2 < n2 {
            if chars1[ptr1] != chars2[ptr2] { break }
            if chars1[ptr1] == " " {
                count += 1
            }

            ptr1 += 1
            ptr2 += 1
        }

        if ptr2 == n2 {
           if ptr1 == n1 { return true }  
        
            if ptr1 < n1, chars1[ptr1] == " " {
                count += 1
            }
        }

        ptr1 = n1 - 1
        ptr2 = n2 - 1
        while ptr2 > -1 {
            if chars1[ptr1] != chars2[ptr2] { break }
            if chars1[ptr1] == " " {
                count += 1
            }

            ptr1 -= 1
            ptr2 -= 1
        }

        if ptr2 == -1 {
            if ptr1 == -1 { return true }
            if ptr1 > -1, chars1[ptr1] == " " {
                count += 1
            }
        }

        return count >= 1 + chars2.reduce(into: 0) { result, char in
            result += char == " " ? 1 : 0
        }
    }
}