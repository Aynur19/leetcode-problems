//
//  ProblemsTests_1700.swift
//  ProblemsTests
//
//  Created by Aynur Nasybullin on 03.03.2024.
//

import XCTest
import SwiftDataStructures

final class ProblemsTests_1700: XCTestCase {
    var problems: Problems!
    
    override func setUp() {
        super.setUp()
        problems = .init()
    }
    
    override func tearDown() {
        problems = nil
        super.tearDown()
    }
    
    
    // MARK: LeetCode Problem 1669. Merge In Between Linked Lists
    // Link: https://leetcode.com/problems/merge-in-between-linked-lists/
    func testsProblem_1669() throws {
        var testsData = ProblemsTestCases.testsData_1669()
        for data in testsData {
            let message = "list1: \(data.list1?.description ?? "[]"); list2: \(data.list2?.description ?? "[]"); "
            let message2 = "a: \(data.a); b: \(data.b)"
            let actual = problems.problem_1669_mergeInBetween(data.list1, data.a, data.b, data.list2)
            
            XCTAssertEqual(actual, data.expected, message + message2)
        }
        
        testsData = ProblemsTestCases.testsData_1669()
        for data in testsData {
            let message = "list1: \(data.list1?.description ?? "[]"); list2: \(data.list2?.description ?? "[]"); "
            let message2 = "a: \(data.a); b: \(data.b)"
            
            let lList = LinkedList(data.list1!)
            lList.mergeInBetween(data.list2, startIn: data.a, endIn: data.b)
            
            XCTAssertEqual(lList.getNode(0), data.expected, message + message2)
        }
    }
    
    
    
    // MARK: Problem 1609. Even Odd Tree
    func testsProblem_1609() throws {
        typealias TestCase = (root: TreeNode?, expected: Bool)
        
        lazy var testsData_1609: [TestCase] = {
            var testsData = [TestCase]()
            
            testsData.append((
                root:
                        .init(1,
                              .init(10,
                                    .init(3, .init(12), .init(8))
                              ),
                              .init(4,
                                    .init(7, .init(6)),
                                    .init(9, nil, .init(2))
                              )
                        ),
                expected: true
            ))
            testsData.append((
                root:
                        .init(5,
                              .init(4, .init(3), .init(3)),
                              .init(2, .init(7))
                        ),
                expected: false
            ))
            testsData.append((
                root:
                        .init(5,
                              .init(9, .init(3), .init(5)),
                              .init(1, .init(7))
                        ),
                expected: false
            ))
            
            return testsData
        }()
        
        
        for idx in testsData_1609.indices {
            let message = "testCase: \(idx + 1)"
            let data = testsData_1609[idx]
            let actual = Problems.problem_1609_isEvenOddTree(data.root)
            
            XCTAssertEqual(actual, data.expected, message)
        }
    }
}
