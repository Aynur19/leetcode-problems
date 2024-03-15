//
//  ProblemsTests_2500.swift
//  ProblemsTests
//
//  Created by Aynur Nasybullin on 13.03.2024.
//

import XCTest

final class ProblemsTests_2500: XCTestCase {
    
    // MARK: Problem: 2485. Find the Pivot Integer
    func testsProblem_2485() throws {
        let testsData_2485 = ProblemsTestCases.testsData_2485()
        let problems = Problems()

        for data in testsData_2485 {
            let message = "n: \(data.n)"
            let actual = problems.problem_2485_pivotInteger(data.n)

            XCTAssertEqual(actual, data.expected, message)
        }
    }
}
