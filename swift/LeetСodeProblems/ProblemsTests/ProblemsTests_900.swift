//
//  ProblemsTests_900.swift
//  ProblemsTests
//
//  Created by Aynur Nasybullin on 14.02.2024.
//

import XCTest

final class ProblemsTests_900: XCTestCase {
    // MARK: Problem 849. Maximize Distance to Closest Person
    func testsProblem_849() throws {
        typealias TestCase = (seats: [Int], expected: Int)
        lazy var testsData_849: [TestCase] = {
            var testsData = [TestCase]()
            
            testsData.append((seats: [1,0,0,0,1,0,1], expected: 2))
            testsData.append((seats: [1,0,0,0], expected: 3))
            testsData.append((seats: [0,1], expected: 1))
            
            return testsData
        }()
        
        for data in testsData_849 {
            let message = "seats: \(data.seats)"
            let actual = Problems.problem_849_maxDistToClosest(data.seats)
            
            XCTAssertEqual(actual, data.expected, message)
        }
    }
}
