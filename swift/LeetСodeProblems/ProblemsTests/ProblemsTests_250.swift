//
//  ProblemsTests_250.swift
//  ProblemsTests
//
//  Created by Aynur Nasybullin on 28.01.2024.
//

import XCTest
@testable import Problems

extension ProblemsTests {
    // MARK: Problem 206. Reverse Linked List
    
    func testsProblem_206() throws {
        lazy var testsData_206: [(head: ListNode?, expected: ListNode?)] = {
            var testsData = [(head: ListNode?, expected: ListNode?)]()
            
            testsData.append((
                head: .init(1, .init(2, .init(3, .init(4, .init(5))))),
                expected: .init(5, .init(4, .init(3, .init(2, .init(1)))))
            ))
            testsData.append((
                head: .init(1, .init(2)),
                expected: .init(2, .init(1))
            ))
            testsData.append((head: nil, expected: nil))
            
            return testsData
        }()
        
//        for data in testsData_206 {
//            let actual = Problems.problem_206_reverseList(data.head)
//            XCTAssertTrue(ListNode.equalListNodes(actual, data.expected), "head: \(data.head?.description ?? "[]")")
//        }
        
        
        for data in testsData_206 {
            let actual = Problems.problem_206_reverseList2(data.head)
            XCTAssertTrue(ListNode.equalListNodes(actual, data.expected), "head: \(data.head?.description ?? "[]")")
        }
    }
    
    // MARK: Problem 205. Isomorphic Strings
    func testsProblem_205() throws {
        lazy var testsData_205: [(s: String, t: String, expected: Bool)] = {
            var testsData = [(s: String, t: String, expected: Bool)]()
            
            testsData.append((s: "egg", t: "add", expected: true))
            testsData.append((s: "foo", t: "bar", expected: false))
            testsData.append((s: "paper", t: "title", expected: true))
            testsData.append((s: "bads", t: "baba", expected: false ))
            
            return testsData
        }()
        
        for data in testsData_205 {
            let actual = Problems.problem_205_isIsomorphic(data.s, data.t)
            
            XCTAssertEqual(actual, data.expected, "s: '\(data.s)'; t: '\(data.t)'")
        }
    }
}
