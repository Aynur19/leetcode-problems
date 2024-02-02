//
//  ProblemsTests_450.swift
//  ProblemsTests
//
//  Created by Aynur Nasybullin on 31.01.2024.
//

import XCTest

final class ProblemsTests_450: XCTestCase {
    // MARK: Problem 438. Find All Anagrams in a String
    func testsProblem_438() throws {
        lazy var testsData_438: [(s: String, p: String, expected: [Int])] = {
            var testsData = [(s: String, p: String, expected: [Int])]()
            
            testsData.append((s: "cbaebabacd", p: "abc", expected: [0, 6]))
            testsData.append((s: "abab", p: "ab", expected: [0, 1, 2]))
            testsData.append((s: "abaacbabc", p: "abc", expected: [3, 4, 6]))
            
            return testsData
        }()
        
        var testCase = 0
        for data in testsData_438 {
            testCase += 1
            let actual = Problems.problem_438_findAnagrams(data.s, data.p)
            let actual2 = Problems.problem_438_findAnagrams(data.s, data.p)
            
            XCTAssertEqual(actual, data.expected, "s: '\(data.s)'; p: '\(data.p)'")
            XCTAssertEqual(actual2, data.expected, "s: '\(data.s)'; p: '\(data.p)'")
        }
    }
    
    // MARK: Problem 424. Longest Repeating Character Replacement
    func testsProblem_424() throws {
        lazy var testsData_424: [(s: String, k: Int, expected: Int)] = {
            var testsData = [(s: String, k: Int, expected: Int)]()
            
            testsData.append((s: "ABAB", k: 2, expected: 4))
            testsData.append((s: "AABABBA", k: 1, expected: 4))
            testsData.append((s: "AABA", k: 0, expected: 2))
            testsData.append((s: "ABAA", k: 0, expected: 2))
            testsData.append((s: "BAAA", k: 0, expected: 3))
            testsData.append((s: "AAAA", k: 2, expected: 4))
            testsData.append((s: "AAAB", k: 0, expected: 3))
            testsData.append((s: "ABBB", k: 2, expected: 4))
            testsData.append((
                s: "KRSCDCSONAJNHLBMDQGIFCPEKPOHQIHLTDIQGEKLRLCQNBOHNDQGHJPNDQPERNFSSSRDEQLFPCCCARFMDLHADJADAGNNSBNCJQOF",
                k: 4, expected: 7))
            
            return testsData
        }()
        
        var testCase = 0
        for data in testsData_424 {
            testCase += 1
            let actual = Problems.problem_424_characterReplacement(data.s, data.k)
            let actual2 = Problems.problem_424_characterReplacement2(data.s, data.k)
            
            XCTAssertEqual(actual, data.expected, "s: '\(data.s)'; k: \(data.k)")
            XCTAssertEqual(actual2, data.expected, "s: '\(data.s)'; k: \(data.k)")
        }
    }
    
    // MARK: Problem 404. Sum of Left Leaves
    func testsProblem_404() throws {
        lazy var testsData_404: [(root: TreeNode?, expected: Int)] = {
            var testsData = [(root: TreeNode?, expected: Int)]()
            
            testsData.append((
                root: .init(3, .init(9), .init(20, .init(15), .init(7))),
                expected: 24
            ))
            testsData.append((
                root: .init(1),
                expected: 0
            ))
            testsData.append((
                root: .init(0, 
                    .init(2, .init(1, .init(5), .init(1)), nil),
                    .init(4, .init(3, nil, .init(6)), .init(-1, nil, .init(8)))
                ),
                expected: 5
            ))
            
            return testsData
        }()
        
        var testCase = 0
        for data in testsData_404 {
            testCase += 1
            let actual = Problems.problem_404_sumOfLeftLeaves(data.root)
            let actual2 = Problems.problem_404_sumOfLeftLeaves2(data.root)
            let actual3 = Problems.problem_404_sumOfLeftLeaves3(data.root)
            
            XCTAssertEqual(actual, data.expected, "testCase: \(testCase)")
            XCTAssertEqual(actual2, data.expected, "testCase: \(testCase)")
            XCTAssertEqual(actual3, data.expected, "testCase: \(testCase)")
        }
    }
}
