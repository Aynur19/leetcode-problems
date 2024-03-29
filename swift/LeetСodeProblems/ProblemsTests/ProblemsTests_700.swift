//
//  ProblemsTests_700.swift
//  ProblemsTests
//
//  Created by Aynur Nasybullin on 08.02.2024.
//

import XCTest

final class ProblemsTests_700: XCTestCase {
    // MARK: Problem 692. Top K Frequent Words
    func testsProblem_692() throws {
        typealias TestCase = (words: [String], k: Int, expected: [String])
        lazy var testsData_692: [TestCase] = {
            var testsData = [TestCase]()
            
            testsData.append((
                words: ["i","love","leetcode","i","love","coding"],
                k: 2,
                expected: ["i","love"]
            ))
            testsData.append((
                words: ["the","day","is","sunny","the","the","the","sunny","is","is"],
                k: 4,
                expected: ["the","is","sunny","day"]
            ))
            
            return testsData
        }()
        
        for data in testsData_692 {
            let message = "words: '\(data.words)'; k: \(data.k)"
            let actual = Problems.problem_692_topKFrequent(data.words, data.k)
            
            XCTAssertEqual(actual, data.expected, message)
        }
    }
    
    // MARK: Problem 680. Valid Palindrome II
    func testsProblem_680() throws {
        typealias TestCase = (s: String, expected: Bool)
        lazy var testsData_680: [TestCase] = {
            var testsData = [TestCase]()
            
            testsData.append((s: "aba", expected: true))
            testsData.append((s: "abca", expected: true))
            testsData.append((s: "abc", expected: false))
            
            return testsData
        }()
        
        for data in testsData_680 {
            let message = "s: '\(data.s)'"
            let actual = Problems.problem_680_validPalindrome(data.s)
            let actual2 = Problems.problem_680_validPalindrome2(data.s)
            
            XCTAssertEqual(actual, data.expected, message)
            XCTAssertEqual(actual2, data.expected, message)
        }
    }
    
    // MARK: Problem 658. Find K Closest Elements
    func testsProblem_658() throws {
        typealias TestCase = (arr: [Int], k: Int, x: Int, expected: [Int])
        lazy var testsData_658: [TestCase] = {
            var testsData = [TestCase]()
            
            testsData.append((arr: [1,2,3,4,5], k: 4, x: 3, expected: [1,2,3,4]))
            testsData.append((arr: [1,2,3,4,5], k: 4, x: -1, expected: [1,2,3,4]))
            testsData.append((arr: [1,1,1,10,10,10], k: 1, x: 9, expected: [10]))
            
            return testsData
        }()
        
        for data in testsData_658 {
            let message = "arr: \(data.arr); k: \(data.k); x: \(data.x)"
            let actual = Problems.problem_658_findClosestElements(data.arr, data.k, data.x)
            
            XCTAssertEqual(actual, data.expected, message)
        }
    }
    
    // MARK: Problem 652. Find Duplicate Subtrees
    func testsProblem_652() throws {
        typealias TestCase = (root: TreeNode?, expected: [TreeNode?])
        lazy var testsData_652: [TestCase] = {
            var testsData = [TestCase]()
            
            testsData.append((
                root: .init(1, .init(2, .init(4), nil), .init(3, .init(2, .init(4), nil), .init(4))),
                expected: [.init(2, .init(4), nil), .init(4)]
            ))
            testsData.append((
                root: .init(2, .init(1), .init(1)),
                expected: [.init(1)]
            ))
            testsData.append((
                root: .init(2, .init(2, .init(3), nil), .init(2, .init(3), nil)),
                expected: [.init(2, .init(3), nil), .init(3)]
            ))
            testsData.append((
                root: .init(0, .init(0, .init(0, .init(0), nil), nil), .init(0, nil, .init(0, nil, .init(0)))),
                expected: [.init(0)]
            ))
            testsData.append((root: .init(1), expected: []))
            
            return testsData
        }()
        
        let codec = TreeCodec()
        for data in testsData_652 {
            let actual = Array(Problems.problem_652_findDuplicateSubtrees(data.root).reversed())
            let message = "tree: [\(codec.serialize(data.root))]"
            
            XCTAssertEqual(actual.count, data.expected.count, message)
            for idx in 0..<actual.count {
                let expression = data.expected[idx] != nil ? (actual[idx]! === data.expected[idx]!) : actual[idx]! == data.expected[idx]
                XCTAssertTrue(expression, "idx: \(idx + 1); \(message)")
            }
        }
    }
}
