//
//  ProblemsTests_1500.swift
//  ProblemsTests
//
//  Created by Aynur Nasybullin on 17.02.2024.
//

import XCTest

final class ProblemsTests_1500: XCTestCase {
    // MARK: Problem 1446. Consecutive Characters
    func testsProblem_1446() throws {
        typealias TestCase = (s: String, expected: Int)
        
        lazy var testsData_1446: [TestCase] = {
            var testsData = [TestCase]()
            
            testsData.append((s: "leetcode", expected: 2))
            testsData.append((s: "abbcccddddeeeeedcba", expected: 5))
            testsData.append((s: "j", expected: 1))
            testsData.append((s: "cc", expected: 2))
            
            return testsData
        }()
        
        
        for data in testsData_1446 {
            let message = "s: '\(data.s)'"
            let actual = Problems.problem_1446_maxPower(data.s)
            
            XCTAssertEqual(actual, data.expected, message)
        }
    }
}
