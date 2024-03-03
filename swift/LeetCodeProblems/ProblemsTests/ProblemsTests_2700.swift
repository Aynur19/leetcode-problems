//
//  ProblemsTests_2700.swift
//  ProblemsTests
//
//  Created by Aynur Nasybullin on 20.02.2024.
//

import XCTest

final class ProblemsTests_2700: XCTestCase {
    // MARK: Problem 2657. Find the Prefix Common Array of Two Arrays
    func testsProblem_2657() throws {
        typealias TestCase = (A: [Int], B: [Int], expected: [Int])
        
        lazy var testsData_2657: [TestCase] = {
            var testsData = [TestCase]()
            
            testsData.append((A: [1,3,2,4], B: [3,1,2,4], expected: [0,2,3,4]))
            testsData.append((A: [2,3,1], B: [3,1,2], expected: [0,1,3]))
            
            return testsData
        }()
        
        
        for data in testsData_2657 {
            let message = "A: \(data.A); B: \(data.B)"
            let actual = Problems.problem_2657_findThePrefixCommonArray(data.A, data.B)
            
            XCTAssertEqual(actual, data.expected, message)
        }
    }
}
