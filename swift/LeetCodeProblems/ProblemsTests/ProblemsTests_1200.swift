//
//  ProblemsTests_1200.swift
//  ProblemsTests
//
//  Created by Aynur Nasybullin on 12.03.2024.
//

import XCTest
import SwiftDataStructures

final class ProblemsTests_1200: XCTestCase {
    // MARK: Problem: 1171. Remove Zero Sum Consecutive Nodes from Linked List
    func testsProblem_1171() throws {
        let testsData_1171 = ProblemsTestCases.testsData_1171()
        let problems = Problems()
        
        for data in testsData_1171 {
            let message = "head: \(data.head?.description ?? "[]")"
            let actual = problems.problem_1171_removeZeroSumSublists(data.head)
            
            XCTAssertEqual(actual, data.expected, message)
        }
    }
}
