//
//  ProblemsTests_100.swift
//  ProblemsTests
//
//  Created by Aynur Nasybullin on 27.01.2024.
//

import XCTest
@testable import Problems

public final class ProblemsTests_100: XCTestCase {
    var problems: Problems!
    
    override public func setUp() {
        super.setUp()
        problems = Problems()
    }
    
    public override func tearDown() {
        problems = nil
        super.tearDown()
    }
    

    // MARK: LeetCode Problem 1. Two Sum
    // Link: https://leetcode.com/problems/two-sum/
    func testsProblem_1() throws {
        let testsData = ProblemsTestCases.testsData_1()
        
        for data in testsData {
            let message = "nums: \(data.nums); target: \(data.target)"
            let actual = problems.problem_1_twoSum(data.nums, data.target)
            
            XCTAssertEqual(actual, data.expected, message)
        }
    }
    
    
    // MARK: LeetCode Problem 2. Add Two Numbers
    // Link: https://leetcode.com/problems/add-two-numbers/
    func testsProblem_2() throws {
        let testsData = ProblemsTestCases.testsData_2()

        for data in testsData {
            let message = "l1: \(data.l1?.description ?? "[]"); l2: \(data.l2?.description ?? "[]")"
            let actual = problems.problem_2_addTwoNumbers(data.l1, data.l2)

            XCTAssertEqual(actual, data.expected, message)
        }
    }
    
    
    // MARK: LeetCode Problem 3. Longest Substring Without Repeating Characters
    // Link: https://leetcode.com/problems/longest-substring-without-repeating-characters/
    func testsProblem_3() throws {
        let testsData = ProblemsTestCases.testsData_3()
        
        for data in testsData {
            let message = "s: '\(data.s)'"
            let actual = problems.problem_3_lengthOfLongestSubstring(data.s)
            
            XCTAssertEqual(actual, data.expected, message)
        }
    }
    
    
    // MARK: LeetCode Problem 4. Median of Two Sorted Arrays
    // Link: https://leetcode.com/problems/median-of-two-sorted-arrays/
    func testsProblem_4() throws {
        let testsData = ProblemsTestCases.testsData_4()
        
        for data in testsData {
            let message = "nums1: \(data.nums1); nums2: \(data.nums2)"
            let actual = problems.problem_4_findMedianSortedArrays(data.nums1, data.nums2)
            
            XCTAssertEqual(actual, data.expected, message)
        }
    }
    

    // MARK: LeetCode Problem 5. Longest Palindromic Substring
    // Link: https://leetcode.com/problems/longest-palindromic-substring/
    func testsProblem_5() throws {
        let testsData = ProblemsTestCases.testsData_5()
        
        for data in testsData {
            let message = "s: '\(data.s)'"
            let actual = problems.problem_5_longestPalindrome(data.s)
            
            XCTAssertEqual(actual, data.expected, message)
        }
    }
    
    // MARK: Problem 53. Maximum Subarray
    func testsProblem_53() throws {
        lazy var testsData_53: [(nums: [Int], expected: Int)] = {
            var testsData = [(nums: [Int], expected: Int)]()
            
            testsData.append((nums: [-2, 1, -3, 4, -1, 2, 1, -5, 4], expected: 6))
            testsData.append((nums: [1], expected: 1))
            testsData.append((nums: [5, 4, -1, 7, 8], expected: 23))
            
            return testsData
        }()
        
        for data in testsData_53 {
            let actual = Problems.problem_53_maxSubArray(data.nums)
            let actual2 = Problems.problem_53_maxSubArray2(data.nums)
            
            XCTAssertEqual(actual, data.expected, "nums: \(data.nums)")
            XCTAssertEqual(actual2, data.expected, "nums: \(data.nums)")
        }
    }
    
    // MARK: Problem 49. Group Anagrams
    func testsProblem_49() throws {
        lazy var testsData_49: [(strs: [String], expected: [[String]])] = {
            var testsData = [(strs: [String], expected: [[String]])]()
            
            testsData.append((
                strs: ["eat", "tea", "tan", "ate", "nat", "bat"],
                expected: [["bat"], ["nat", "tan"], ["ate", "eat", "tea"]]
            ))
            testsData.append((strs: [""], expected: [[""]]))
            testsData.append((strs: ["a"], expected: [["a"]]))
            
            return testsData
        }()
        
        for data in testsData_49 {
            let expected = data.expected.map { $0.sorted().joined() }.sorted()
            let actual = Problems.problem_49_groupAnagrams(data.strs).map { $0.sorted().joined() }.sorted()
            
            XCTAssertEqual(actual, expected, "strs: \(data.strs)")
        }
    }
    
    // MARK: Problem 48. Rotate Image
    func testsProblem_48() throws {
        lazy var testsData_48: [(matrix: [[Int]], expected: [[Int]])] = {
            var testsData = [(matrix: [[Int]], expected: [[Int]])]()
            
            testsData.append((
                matrix: [
                    [1,2,3],
                    [4,5,6],
                    [7,8,9]
                ],
                expected: [
                    [7,4,1],
                    [8,5,2],
                    [9,6,3]
                ]
            ))
            testsData.append((
                matrix: [
                    [5,1,9,11],
                    [2,4,8,10],
                    [13,3,6,7],
                    [15,14,12,16]
                ],
                expected: [
                    [15,13,2,5],
                    [14,3,4,1],
                    [12,6,8,9],
                    [16,7,10,11]
                ]
            ))
            
            return testsData
        }()
        
        for data in testsData_48 {
            var matrix = data.matrix
            Problems.problem_48_rotate(&matrix)
            
            XCTAssertEqual(matrix, data.expected, "matrix: \(data.matrix)")
        }
    }
    
    // MARK: Problem 43. Multiply Strings
    func testsProblem_43() throws {
        lazy var testsData_43: [(num1: String, num2: String, expected: String)] = {
            var testsData = [(num1: String, num2: String, expected: String)]()
            
            testsData.append((num1: "2", num2: "3", expected: "6"))
            testsData.append((num1: "123", num2: "456", expected: "56088"))
            
            return testsData
        }()
        
        for data in testsData_43 {
            let actual = Problems.problem_43_multiply(data.num1, data.num2)
            
            XCTAssertEqual(actual, data.expected, "num1: \(data.num1); num2: \(data.num2)")
        }
    }
    
    // MARK: Problem 38. Count and Say
    func testsProblem_38() throws {
        lazy var testsData_38: [(n: Int, expected: String)] = {
            var testsData = [(n: Int, expected: String)]()
            
            testsData.append((n: 1, expected: "1"))
            testsData.append((n: 4, expected: "1211"))
            
            return testsData
        }()
        
        for data in testsData_38 {
            let actual = Problems.problem_38_countAndSay(data.n)
            let actual_2 = Problems.problem_38_countAndSay_2(data.n)

            XCTAssertEqual(actual, data.expected, "n: \(data.n)")
            XCTAssertEqual(actual_2, data.expected, "n: \(data.n)")
        }
    }
    
    // MARK: Problem 36. Valid Sudoku
    func testsProblem_36() throws {
        lazy var testsData_36: [(board: [[Character]], expected: Bool)] = {
            var testsData = [(board: [[Character]], expected: Bool)]()
            
            testsData.append((
                board: [["5","3",".",".","7",".",".",".","."],
                        ["6",".",".","1","9","5",".",".","."],
                        [".","9","8",".",".",".",".","6","."],
                        ["8",".",".",".","6",".",".",".","3"],
                        ["4",".",".","8",".","3",".",".","1"],
                        ["7",".",".",".","2",".",".",".","6"],
                        [".","6",".",".",".",".","2","8","."],
                        [".",".",".","4","1","9",".",".","5"],
                        [".",".",".",".","8",".",".","7","9"]],
                expected: true
            ))
            testsData.append((
                board: [["8","3",".",".","7",".",".",".","."],
                        ["6",".",".","1","9","5",".",".","."],
                        [".","9","8",".",".",".",".","6","."],
                        ["8",".",".",".","6",".",".",".","3"],
                        ["4",".",".","8",".","3",".",".","1"],
                        ["7",".",".",".","2",".",".",".","6"],
                        [".","6",".",".",".",".","2","8","."],
                        [".",".",".","4","1","9",".",".","5"],
                        [".",".",".",".","8",".",".","7","9"]],
                expected: false
            ))
            
            return testsData
        }()
        
        for data in testsData_36 {
            let actual = Problems.problem_36_isValidSudoku(data.board)

            XCTAssertEqual(actual, data.expected,"board: \(data.board)")
        }
    }
    
    // MARK: Problem 35. Search Insert Position
    func testsProblem_35() throws {
        lazy var testsData_35: [(nums: [Int], target: Int, expected: Int)] = {
            var testsData = [(nums: [Int], target: Int, expected: Int)]()
            
            testsData.append((nums: [1, 3, 5, 6], target: 5, expected: 2))
            testsData.append((nums: [1, 3, 5, 6], target: 2, expected: 1))
            testsData.append((nums: [1, 3, 5, 6], target: 7, expected: 4))
            testsData.append((nums: [1, 3], target: 1, expected: 0))
            testsData.append((nums: [1, 3], target: 0, expected: 0))
            
            return testsData
        }()
        
        for data in testsData_35 {
            let actual = Problems.problem_35_searchInsert(data.nums, data.target)

            XCTAssertEqual(actual, data.expected, "nums: \(data.nums); target: \(data.target)")
        }
    }
    
    // MARK: Problem 34. Find First and Last Position of Element in Sorted Array
    func testsProblem_34() throws {
        lazy var testsData_34: [(nums: [Int], target: Int, expected: [Int])] = {
            var testsData = [(nums: [Int], target: Int, expected: [Int])]()
            
            testsData.append((nums: [5, 7, 7, 8, 8, 10], target: 8, expected: [3, 4]))
            testsData.append((nums: [5, 7, 7, 8, 8, 10], target: 6, expected: [-1, -1]))
            testsData.append((nums: [],     target: 0, expected: [-1, -1]))
            testsData.append((nums: [2, 2], target: 2, expected: [0, 1]))
            testsData.append((nums: [1, 4], target: 4, expected: [1, 1]))
            
            return testsData
        }()
        
        for data in testsData_34 {
            let actual = Problems.problem_34_searchRange(data.nums, data.target)
            
            XCTAssertEqual(actual, data.expected, "nums: \(data.nums); target: \(data.target)")
        }
    }
    
    // MARK: Problem 33. Search in Rotated Sorted Array
    func testsProblem_33() throws {
        lazy var testsData_33: [(nums: [Int], target: Int, expected: Int)] = {
            var testsData = [(nums: [Int], target: Int, expected: Int)]()
            
            testsData.append((nums: [4, 5, 6, 7, 0, 1, 2],      target: 1, expected: 5))
            testsData.append((nums: [4, 5, 6, 7, 8, 1, 2, 3],   target: 8, expected: 4))
            testsData.append((nums: [4, 5, 6, 7, 0, 1, 2],      target: 0, expected: 4))
            testsData.append((nums: [4, 5, 6, 7, 0, 1, 2],      target: 3, expected: -1))
            testsData.append((nums: [1],    target: 0, expected: -1))
            testsData.append((nums: [1, 3], target: 1, expected: 0))
            testsData.append((nums: [1, 3], target: 2, expected: -1))
            
            return testsData
        }()
        
        for data in testsData_33 {
            let actual = Problems.problem_33_search(data.nums, data.target)
            
            XCTAssertEqual(actual, data.expected, "nums: \(data.nums); target: \(data.target)")
        }
    }
    
    // MARK: Problem 32. Longest Valid Parentheses
    func testsProblem_32() throws {
        lazy var testsData_32: [(s: String, expected: Int)] = {
            var testsData = [(s: String, expected: Int)]()
            
            testsData.append((s: "(()", expected: 2))
            testsData.append((s: ")()())", expected: 4))
            testsData.append((s: "", expected: 0))
            
            return testsData
        }()
        
        for data in testsData_32 {
            let actual = Problems.problem_32_longestValidParentheses(data.s)
            let actual2 = Problems.problem_32_longestValidParentheses_2(data.s)
            
            XCTAssertEqual(actual, data.expected,"s: '\(data.s)'")
            XCTAssertEqual(actual2, data.expected, "s: '\(data.s)'")
        }
    }
    
    // MARK: Problem 31. Next Permutation
    func testsProblem_31() throws {
        lazy var testsData_31: [(nums: [Int], expected: [Int])] = {
            var testsData = [(nums: [Int], expected: [Int])]()
            
            testsData.append((nums: [1, 2, 3], expected: [1, 3, 2]))
            testsData.append((nums: [3, 2, 1], expected: [1, 2, 3]))
            testsData.append((nums: [1, 1, 5], expected: [1, 5, 1]))
            testsData.append((nums: [1, 2], expected: [2, 1]))
            testsData.append((nums: [1, 3, 2], expected: [2, 1, 3]))
            
            return testsData
        }()
        
        for data in testsData_31 {
            var nums = data.nums
            Problems.problem_31_nextPermutation(&nums)
            
            XCTAssertEqual(nums, data.expected, "nums: \(data.nums)")
        }
    }
    
    // MARK: Problem 30. Substring with Concatenation of All Words
    func testsProblem_30() throws {
        lazy var testsData_30: [(s: String, words: [String], expected: [Int])] = {
            var testsData = [(s: String, words: [String], expected: [Int])]()
            
            testsData.append((
                s: "barfoothefoobarman",
                words: ["foo", "bar"],
                expected: [0, 9]
            ))
            testsData.append((
                s: "wordgoodgoodgoodbestword",
                words: ["word", "good", "best", "word"],
                expected: []
            ))
            testsData.append((
                s: "barfoofoobarthefoobarman",
                words: ["bar", "foo", "the"],
                expected: [6, 9, 12]
            ))
            
            return testsData
        }()
        
        for data in testsData_30 {
            let actual = Problems.problem_30_findSubstring(data.s, data.words)
            
            XCTAssertEqual(actual, data.expected,"s: '\(data.s)'; word: \(data.words)")
        }
    }
    
    // MARK: Problem 29. Divide Two Integers
    func testsProblem_29() throws {
        lazy var testsData_29: [(dividend: Int, divisor: Int, expected: Int)] = {
            var testsData = [(dividend: Int, divisor: Int, expected: Int)]()
            
            testsData.append((dividend: 10, divisor: 3, expected: 3))
            testsData.append((dividend: 7, divisor: -3, expected: -2))
            testsData.append((dividend: 1004958205, divisor: -2137325331, expected: 0))
            testsData.append((dividend: -1, divisor: 1, expected: -1))
            testsData.append((dividend: -2147483648, divisor: 2, expected: -1073741824))
            
            return testsData
        }()
        
        for data in testsData_29 {
            let actual = Problems.problem_29_divide(data.dividend, data.divisor)
            
            XCTAssertEqual(actual, data.expected, "dividend: \(data.dividend); divisor: \(data.divisor)")
        }
    }
    
    // MARK: Problem 28. Find the Index of the First Occurrence in a String
    func testsProblem_28() throws {
        lazy var testsData_28: [(haystack: String, needle: String, expected: Int)] = {
            var testsData = [(haystack: String, needle: String, expected: Int)]()
            
            testsData.append((haystack: "sadbutsad", needle: "sad", expected: 0))
            testsData.append((haystack: "leetcode", needle: "leeto", expected: -1))
            
            return testsData
        }()
        
        for data in testsData_28 {
            let actual = Problems.problem_28_strStr(data.haystack, data.needle)
            
            XCTAssertEqual(actual, data.expected, "haystack: '\(data.haystack)'; needle: '\(data.needle)'")
        }
    }
    
    // MARK: Problem 26. Remove Duplicates from Sorted Array
    func testsProblem_27() throws {
        lazy var testsData_27: [(nums: [Int], val: Int, expected: Int, expectedNums: [Int])] = {
            var testsData = [(nums: [Int], val: Int, expected: Int, expectedNums: [Int])]()
            
            testsData.append((
                nums: [3, 2, 2, 3],
                val: 3,
                expected: 2,
                expectedNums: [2, 2]
            ))
            testsData.append((
                nums: [0, 1, 2, 2, 3, 0, 4, 2],
                val: 2,
                expected: 5,
                expectedNums: [0, 1, 3, 0, 4]
            ))
            
            return testsData
        }()
        
        for data in testsData_27 {
            var nums = data.nums
            let actual = Problems.problem_27_removeElement(&nums, data.val)
            
            XCTAssertEqual(actual, data.expected, "nums: \(data.nums)")
            XCTAssertEqual(Array(nums[0..<actual]), data.expectedNums, "nums: \(data.nums)")
        }
    }
    
    // MARK: Problem 26. Remove Duplicates from Sorted Array
    func testsProblem_26() throws {
        lazy var testsData_26: [(nums: [Int], expected: Int, expectedNums: [Int])] = {
            var testsData = [(nums: [Int], expected: Int, expectedNums: [Int])]()
            
            testsData.append((
                nums: [1, 1, 2],
                expected: 2,
                expectedNums: [1, 2]
            ))
            testsData.append((
                nums: [0, 0, 1, 1, 1, 2, 2, 3, 3, 4],
                expected: 5,
                expectedNums: [0, 1, 2, 3, 4]
            ))
            
            return testsData
        }()
        
        for data in testsData_26 {
            var nums = data.nums
            let actual = Problems.problem_26_removeDuplicates(&nums)
            
            XCTAssertEqual(actual, data.expected, "nums: \(data.nums)")
            XCTAssertEqual(Array(nums[0..<actual]), data.expectedNums, "nums: \(data.nums)")
        }
    }
    
    // MARK: Problem 25. Reverse Nodes in k-Group
//    func testsProblem_25() throws {
//        lazy var testsData_25: [(head: ListNode?, k: Int, expected: ListNode?)] = {
//            var testsData = [(head: ListNode?, k: Int, expected: ListNode?)]()
//            
//            testsData.append((
//                head: .init(1, .init(2, .init(3, .init(4, .init(5))))),
//                k: 2,
//                expected: .init(2, .init(1, .init(4, .init(3, .init(5)))))
//            ))
//            testsData.append((
//                head: .init(1, .init(2, .init(3, .init(4, .init(5))))),
//                k: 3,
//                expected: .init(3, .init(2, .init(1, .init(4, .init(5)))))
//            ))
//            
//            return testsData
//        }()
//        
//        for data in testsData_25 {
//            let actual = Problems.problem_25_reverseKGroup(data.head, data.k)
//            
//            XCTAssertTrue(ListNode.equalListNodes(actual, data.expected), "head: \(data.head?.description ?? "[]"), k: \(data.k)")
//        }
//    }
    
    // MARK: Problem 24. Swap Nodes in Pairs
//    func testsProblem_24() throws {
//        lazy var testsData_24: [(head: ListNode?, expected: ListNode?)] = {
//            var testsData = [(head: ListNode?, expected: ListNode?)]()
//            
//            testsData.append((
//                head: .init(1, .init(2, .init(3, .init(4)))),
//                expected: .init(2, .init(1, .init(4, .init(3))))
//            ))
//            testsData.append((head: nil, expected: nil))
//            testsData.append((head: .init(1), expected: .init(1)))
//            
//            return testsData
//        }()
//        
//        for data in testsData_24 {
//            let actual = Problems.problem_24_swapPairs(data.head)
//            
//            XCTAssertTrue(ListNode.equalListNodes(actual, data.expected), "head: \(data.head?.description ?? "[]")")
//        }
//    }
    
    // MARK: Problem 23. Merge k Sorted Lists
//    func testsProblem_23() throws {
//        lazy var testsData_23: [(lists: [ListNode?], expected: ListNode?)] = {
//            var testsData = [(lists: [ListNode?], expected: ListNode?)]()
//            
//            testsData.append((
//                lists: [
//                    .init(1, .init(4, .init(5))),
//                    .init(1, .init(3, .init(4))),
//                    .init(2, .init(6))
//                ],
//                expected: .init(1, .init(1, .init(2,.init(3, .init(4, .init(4, .init(5, .init(6))))))))
//            ))
//            testsData.append((lists: [], expected: nil))
//            testsData.append((lists: [nil], expected: nil))
//            
//            return testsData
//        }()
//        
//        for data in testsData_23 {
//            let actual = Problems.problem_23_mergeKLists(data.lists)
//            
//            XCTAssertTrue(ListNode.equalListNodes(actual, data.expected), "lists: \(data.lists)")
//        }
//    }
    
    // MARK: Problem 22. Generate Parentheses
    func testsProblem_22() throws {
        lazy var testsData_22: [(n: Int, expected: [String])] = {
            var testsData = [(n: Int, expected: [String])]()
            
            testsData.append((n: 3, expected: ["((()))", "(()())", "(())()", "()(())", "()()()"]))
            testsData.append((n: 1, expected: ["()"]))
            
            return testsData
        }()
        
        for data in testsData_22 {
            let actual = Problems.problem_22_generateParenthesis(data.n)
            let actual2 = Problems.problem_22_generateParenthesis2(data.n)
            
            XCTAssertEqual(actual, data.expected, "n: \(data.n)")
            XCTAssertEqual(actual2, data.expected, "n: \(data.n)")
        }
    }
    
    // MARK: Problem 21. Merge Two Sorted Lists
//    func testsProblem_21() throws {
//        lazy var testsData_21: [(list1: ListNode?, list2: ListNode?, expected: ListNode?)] = {
//            var testsData = [(list1: ListNode?, list2: ListNode?, expected: ListNode?)]()
//            
//            testsData.append((
//                list1: .init(1, .init(2, .init(4))),
//                list2: .init(1, .init(3, .init(4))),
//                expected: .init(1, .init(1, .init(2, .init(3, .init(4, .init(4))))))
//            ))
//            testsData.append((list1: nil, list2: nil, expected: nil))
//            testsData.append((list1: nil, list2: .init(0), expected: .init(0)))
//            
//            return testsData
//        }()
//        
//        for data in testsData_21 {
//            let actual = Problems.problem_21_mergeTwoLists(data.list1, data.list2)
//            
//            XCTAssertTrue(
//                ListNode.equalListNodes(actual, data.expected),
//                "list1: \(data.list1?.description ?? "[]"); list2: \(data.list2?.description ?? "[]")"
//            )
//        }
//    }
    
    // MARK: Problem 20. Valid Parentheses
    func testsProblem_20() throws {
        lazy var testsData_20: [(s: String, expected: Bool)] = {
            var testsData = [(s: String, expected: Bool)]()
            
            testsData.append((s: "()", expected: true))
            testsData.append((s: "()[]{}", expected: true))
            testsData.append((s: "(]", expected: false))
            
            return testsData
        }()
        
        for data in testsData_20 {
            let actual = Problems.problem_20_isValid(data.s)
            
            XCTAssertEqual(actual, data.expected, "s: '\(data.s)'")
        }
    }
    
    // MARK: Problem 19. Remove Nth Node From End of List
//    func testsProblem_19() throws {
//        lazy var testsData_19: [(head: ListNode?, n: Int, expected: ListNode?)] = {
//            var testsData = [(head: ListNode?, n: Int, expected: ListNode?)]()
//            
//            testsData.append((
//                head: .init(1, .init(2, .init(3, .init(4, .init(5))))),
//                n: 2,
//                expected: .init(1, .init(2, .init(3, .init(5))))
//            ))
//            testsData.append((
//                head: .init(1),
//                n: 1,
//                expected: nil
//            ))
//            testsData.append((
//                head: .init(1, .init(2)),
//                n: 1,
//                expected: .init(1)
//            ))
//            testsData.append((
//                head: .init(1, .init(2)),
//                n: 2,
//                expected: .init(2)
//            ))
//            
//            return testsData
//        }()
//        
//        for data in testsData_19 {
//            let actual = Problems.problem_19_removeNthFromEnd(data.head, data.n)
//        
//            XCTAssertTrue(
//                ListNode.equalListNodes(actual, data.expected), "head: \(data.head?.description ?? "[]"), n: \(data.n)")
//        }
//    }
    
    // MARK: Problem 18. 4Sum
    func testsProblem_18() throws {
        lazy var testsData_18: [(nums: [Int], target: Int, expected: [[Int]])] = {
            var testsData = [(nums: [Int], target: Int, expected: [[Int]])]()
            
            testsData.append((
                nums: [1, 0, -1, 0, -2, 2],
                target: 0,
                expected: [[-2, -1, 1, 2],
                           [-2, 0, 0, 2],
                           [-1, 0, 0, 1]]
            ))
            testsData.append((
                nums: [2, 2, 2, 2, 2],
                target: 8,
                expected: [[2, 2, 2, 2]]
            ))
            testsData.append((
                nums: [-2, -1, -1, 1, 1, 2, 2],
                target: 0,
                expected: [[-2, -1, 1, 2],
                           [-1, -1, 1, 1]]
            ))
            
            return testsData
        }()
        
        for data in testsData_18 {
            let actual = Problems.problem_18_fourSum(data.nums, data.target).sorted { $0.lexicographicallyPrecedes($1) }
            
            XCTAssertEqual(actual, data.expected, "nums: \(data.nums); target: \(data.target)")
        }
    }
    
    // MARK: Problem 17. Letter Combinations of a Phone Number
    func testsProblem_17() throws {
        lazy var testsData_17: [(digits: String, expected: [String])] = {
            var testsData = [(digits: String, expected: [String])]()
            
            testsData.append((
                digits: "23",
                expected: ["ad", "ae", "af",
                           "bd", "be", "bf",
                           "cd", "ce", "cf"]
            ))
            testsData.append((digits: "", expected: []))
            testsData.append((digits: "2", expected: ["a", "b", "c"]))
            
            return testsData
        }()
        
        for data in testsData_17 {
            let actual = Problems.problem_17_letterCombinations(data.digits)
            
            XCTAssertEqual(actual, data.expected, "digits: \(data.digits)")
        }
    }
    
    // MARK: Problem 16. 3Sum Closest
    func testsProblem_16() throws {
        lazy var testsData_16: [(nums: [Int], target: Int, expected:  Int)] = {
            var testsData = [(nums: [Int], target: Int, expected:  Int)]()
            
            testsData.append((nums: [-1, 2, 1, -4], target: 1, expected:  2))
            testsData.append((nums: [0, 0, 0], target: 1, expected:  0))
            
            return testsData
        }()
        
        for data in testsData_16 {
            let actual = Problems.problem_16_threeSumClosest(data.nums, data.target)
            
            XCTAssertEqual(actual, data.expected, "nums: \(data.nums)")
        }
    }
    
    // MARK: Problem 15. 3Sum
    func testsProblem_15() throws {
        lazy var testsData_15: [(nums: [Int], expected:  [[Int]])] = {
            var testsData = [(nums: [Int], expected:  [[Int]])]()
            
            testsData.append((nums: [-1, 0, 1, 2, -1, -4], expected: [[-1, -1, 2], [-1, 0, 1]]))
            testsData.append((nums: [0, 1, 1], expected:  []))
            testsData.append((nums: [0, 0, 0], expected:  [[0, 0, 0]]))
            testsData.append((nums: [-1, 0, 1, 0], expected:  [[-1, 0, 1]]))
            testsData.append((nums: [1, -1, -1, 0], expected:  [[-1, 0, 1]]))
            testsData.append((nums: [-2, 0, 1, 1, 2], expected:  [[-2, 0, 2], [-2, 1, 1]]))
            
            return testsData
        }()
        
        for data in testsData_15 {
            let actual = Problems.problem_15_threeSum(data.nums)
                .sorted(by: { $0.sorted().lexicographicallyPrecedes($1.sorted()) })
            let expected = data.expected
                .sorted(by: { $0.sorted().lexicographicallyPrecedes($1.sorted()) })
            
            XCTAssertEqual(actual, expected, "nums: \(data.nums)")
        }
    }
    
    // MARK: Problem 14. Longest Common Prefix
    func testsProblem_14() throws {
        lazy var testsData_14: [(strs: [String], expected: String)] = {
            var testsData = [(strs: [String], expected: String)]()
            
            testsData.append((strs: ["flower", "flow", "flight"], expected: "fl"))
            testsData.append((strs: ["dog", "racecar", "car"], expected: ""))
            
            return testsData
        }()
        
        for data in testsData_14 {
            let actual = Problems.problem_14_longestCommonPrefix(data.strs)
            
            XCTAssertEqual(actual, data.expected, "strs: '\(data.strs)'")
        }
    }
    
    // MARK: Problem 13. Integer to Roman
    func testsProblem_13() throws {
        lazy var testsData_13: [(s: String, expected: Int)] = {
            var testsData = [(s: String, expected: Int)]()
            
            testsData.append((s: "III", expected: 3))
            testsData.append((s: "LVIII", expected: 58))
            testsData.append((s: "MCMXCIV", expected: 1994))
            
            return testsData
        }()
        
        for data in testsData_13 {
            let actual = Problems.problem_13_romanToInt(data.s)
            let actual2 = Problems.problem_13_romanToInt2(data.s)
            
            XCTAssertEqual(actual, data.expected, "s: '\(data.s)'")
            XCTAssertEqual(actual2, data.expected, "s: '\(data.s)'")
        }
    }
    
    // MARK: Problem 12. Integer to Roman
    func testsProblem_12() throws {
        lazy var testsData_12: [(num: Int, expected: String)] = {
            var testsData = [(num: Int, expected: String)]()
            
            testsData.append((num: 3, expected: "III"))
            testsData.append((num: 58, expected: "LVIII"))
            testsData.append((num: 1994, expected: "MCMXCIV"))
            
            return testsData
        }()
        
        for data in testsData_12 {
            let actual = Problems.problem_12_intToRoman(data.num)
            
            XCTAssertEqual(actual, data.expected, "num: \(data.num)")
        }
    }
    
    // MARK: Problem 11. Container With Most Water
    func testsProblem_11() throws {
        lazy var testsData_11: [(height: [Int], expected: Int)] = {
            var testsData = [(height: [Int], expected: Int)]()
            
            testsData.append((height: [1, 8, 6, 2, 5, 4, 8, 3, 7], expected: 49))
            testsData.append((height: [1, 1], expected: 1))
            
            return testsData
        }()
        
        for data in testsData_11 {
            let actual = Problems.problem_11_maxArea(data.height)
            
            XCTAssertEqual(actual, data.expected, "height: \(data.height)")
        }
    }
    
    // MARK: Problem 10. Regular Expression Matching
    func testsProblem_10() throws {
        lazy var testsData_10: [(s: String, p: String, expected: Bool)] = {
            var testsData = [(s: String, p: String, expected: Bool)]()
            
            testsData.append((s: "aa", p: "a", expected: false))
            testsData.append((s: "aa", p: "a*", expected: true))
            testsData.append((s: "ab", p: ".*", expected: true))
            
            return testsData
        }()
        
        for data in testsData_10 {
            let actual = Problems.problem_10_cleanPattern(data.s, data.p)
            
            XCTAssertEqual(actual, data.expected, "s: '\(data.s)'; p: '\(data.p)'")
        }
    }
    
    // MARK: Problem 9. Palindrome Number
    func testsProblem_9() throws {
        lazy var testsData_9: [(x: Int, expected: Bool)] = {
            var testsData = [(x: Int, expected: Bool)]()
            
            testsData.append((x: 121, expected: true))
            testsData.append((x: -121, expected: false))
            testsData.append((x: 10, expected: false))
            
            return testsData
        }()
        
        for data in testsData_9 {
            let actual = Problems.problem_9_isPalindrome(data.x)
            
            XCTAssertEqual(actual, data.expected, "x: \(data.x)")
        }
    }
    
    // MARK: Problem 8. String to Integer (atoi)
    func testsProblem_8() throws {
        lazy var testsData_problem_8: [(s: String, expected: Int)] = {
            var testsData = [(s: String, expected: Int)]()
            
            testsData.append((s: "42", expected: 42))
            testsData.append((s: "   -42", expected: -42))
            testsData.append((s: "4193 with words", expected: 4193))
            testsData.append((s: "00000-42a1234", expected: 0))
            testsData.append((s: "words and 987", expected: 0))
            testsData.append((s: "20000000000000000000", expected: Int(Int32.max)))
            
            return testsData
        }()
        
        for data in testsData_problem_8 {
            let actual = Problems.problem_8_myAtoi(data.s)
            
            XCTAssertEqual(actual, data.expected, "s: '\(data.s)'")
        }
    }
    
    // MARK: Problem 7. Reverse Integer
    func testsProblem_7() throws {
        lazy var testsData_7: [(x: Int, expected: Int)] = {
            var testsData = [(x: Int, expected: Int)]()
            
            testsData.append((x: 123, expected: 321))
            testsData.append((x: -123, expected: -321))
            testsData.append((x: 120, expected: 21))
            
            return testsData
        }()
        
        for data in testsData_7 {
            let actual = Problems.problem_7_reverse(data.x)
            
            XCTAssertEqual(actual, data.expected, "x: \(data.x)")
        }
    }
    
    // MARK: Problem 6. Zigzag Conversion
    func testsProblem_6() throws {
        lazy var testsData_6: [(s: String, numRows: Int, expected: String)] = {
            var testsData = [(s: String, numRows: Int, expected: String)]()
            
            testsData.append((s: "PAYPALISHIRING", numRows: 3, expected: "PAHNAPLSIIGYIR"))
            testsData.append((s: "PAYPALISHIRING", numRows: 4, expected: "PINALSIGYAHRPI"))
            testsData.append((s: "A", numRows: 1, expected: "A"))
            
            return testsData
        }()
        
        for data in testsData_6 {
            let actual = Problems.problem_6_convert(data.s, data.numRows)
            
            XCTAssertEqual(actual, data.expected, "s: '\(data.s)'; numRows: \(data.numRows)")
        }
    }

}
